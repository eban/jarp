#
# test/ftools/test_ftools.rb
#

$:.unshift File.dirname(__FILE__)

require 'ftools'
require 'fileutils'
require 'test/unit'
require 'fileasserts'


def have_drive_letter?
  /djgpp|mswin|mingw|bcc|wince|emx/ === RUBY_PLATFORM
end

def have_file_perm?
  /djgpp|mswin|mingw|bcc|wince|emx/ !~ RUBY_PLATFORM
end

begin
  File.symlink 'not_exist', 'symlink_test'
  HAVE_SYMLINK = true
rescue NotImplementedError
  HAVE_SYMLINK = false
ensure
  File.unlink 'symlink_test' if File.symlink?('symlink_test')
end
def have_symlink?
  HAVE_SYMLINK
end


class TestFileUtils < Test::Unit::TestCase

  def my_rm_rf( path )
    FileUtils.rm_rf path
  end

  def setup
    my_rm_rf 'data'; Dir.mkdir 'data'
    my_rm_rf 'tmp';  Dir.mkdir 'tmp'
    prepare_data_file
  end

  def teardown
    my_rm_rf 'data'
    my_rm_rf 'tmp'
  end


  TARGETS = %w( data/same data/all data/random data/zero )

  def prepare_data_file
    same_chars = 'a' * 50
    File.open('data/same', 'w') {|f|
      32.times do
        f.puts same_chars
      end
    }

    all_chars = (0..255).map {|n| n.chr }.join('')
    File.open('data/all', 'w') {|f|
      32.times do
        f.puts all_chars
      end
    }

    random_chars = (0...50).map { rand(256).chr }.join('')
    File.open('data/random', 'w') {|f|
      32.times do
        f.puts random_chars
      end
    }

    File.open('data/zero', 'w') {|f|
      ;
    }
  end

  BIGFILE = 'data/big'

  def prepare_big_file
    File.open('data/big', 'w') {|f|
      (4 * 1024 * 1024 / 256).times do   # 4MB
        f.print "aaaa aaaa aaaa aaaa aaaa aaaa aaaa aaaa aaaa aaaa\n"
      end
    }
  end

  def test_cmp
    TARGETS.each do |fname|
      assert File.cmp(fname, fname), 'not same?'
    end
  end

  def test_cp
    TARGETS.each do |fname|
      File.cp fname, 'tmp/cp'
      assert_same_file fname, 'tmp/cp'

      File.cp fname, 'tmp'
      assert_same_file fname, 'tmp/' + File.basename(fname)

    end

    # src==dest
#    FileUtils.touch 'tmp/cptmp'
#    assert_raises(ArgumentError) {
#      File.cp 'tmp/cptmp', 'tmp/cptmp'
#    }
#if have_symlink?
#    File.symlink 'cptmp', 'tmp/cptmp_symlink'
#    assert_raises(ArgumentError) {
#      File.cp 'tmp/cptmp', 'tmp/cptmp_symlink'
#    }
#    File.symlink 'symlink', 'tmp/symlink'
#    assert_raises(Errno::ELOOP) {
#      File.cp 'tmp/symlink', 'tmp/symlink'
#    }
#end
  end

  def test_mv
    TARGETS.each do |fname|
      File.cp fname, 'tmp/mvsrc'
      File.mv 'tmp/mvsrc', 'tmp/mvdest'
      assert_same_file fname, 'tmp/mvdest'
    end

    # src==dest
#    FileUtils.touch 'tmp/cptmp'
#    assert_raises(ArgumentError) {
#      File.mv 'tmp/cptmp', 'tmp/cptmp'
#    }
#if have_symlink?
#    File.symlink 'cptmp', 'tmp/cptmp_symlink'
#    assert_raises(ArgumentError) {
#      File.mv 'tmp/cptmp', 'tmp/cptmp_symlink'
#    }
#    File.symlink 'symlink', 'tmp/symlink'
#    assert_raises(Errno::ELOOP) {
#      File.mv 'tmp/symlink', 'tmp/symlink'
#    }
#end
  end

  def test_rm
    TARGETS.each do |fname|
      File.cp fname, 'tmp/rmsrc'
      File.rm_f 'tmp/rmsrc'
      assert_file_not_exist 'tmp/rmsrc'
    end
  end

  def test_rm_f
    TARGETS.each do |fname|
      File.cp fname, 'tmp/rmsrc'
      File.rm_f 'tmp/rmsrc'
      assert_file_not_exist 'tmp/rmsrc'
    end

if have_symlink?
    File.open('tmp/lnf_symlink_src', 'w') {|f| f.puts 'dummy' }
    File.symlink 'tmp/lnf_symlink_src', 'tmp/lnf_symlink_dest'
    File.rm_f 'tmp/lnf_symlink_dest'
    assert_file_not_exist 'tmp/lnf_symlink_dest'
    assert_file_exist     'tmp/lnf_symlink_src'
end

    File.rm_f 'notexistdatafile'
    File.rm_f 'tmp/notexistdatafile'
    my_rm_rf 'tmpdatadir'
    Dir.mkdir 'tmpdatadir'
    # rm_f 'tmpdatadir'
    Dir.rmdir 'tmpdatadir'
  end

  def test_with_big_file
    prepare_big_file

    File.cp BIGFILE, 'tmp/cpdest'
    assert_same_file BIGFILE, 'tmp/cpdest'
    assert File.cmp(BIGFILE, 'tmp/cpdest'), 'orig != copied'

    File.mv 'tmp/cpdest', 'tmp/mvdest'
    assert_same_file BIGFILE, 'tmp/mvdest'
    assert_file_not_exist 'tmp/cpdest'

    File.rm_f 'tmp/mvdest'
    assert_file_not_exist 'tmp/mvdest'
  end

#      tmpdir/dir/./
#      tmpdir/dir/./.././dir/
  def test_makedirs
    dirs = %w(
      tmpdir/dir/
      tmpdir/a
      tmpdir/a/
      tmpdir/a/b
      tmpdir/a/b/
      tmpdir/a/b/c/
      tmpdir/a/b/c
      tmpdir/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a/a
      tmpdir/a/a
    )
    my_rm_rf 'tmpdir'
    dirs.each do |d|
      File.makedirs d
      assert_directory d
      assert_file_not_exist "#{d}/a"
      assert_file_not_exist "#{d}/b"
      assert_file_not_exist "#{d}/c"
      my_rm_rf 'tmpdir'
    end
    dirs.each do |d|
      File.makedirs d
      assert_directory d
    end
    my_rm_rf 'tmpdir'

  end

  def test_install
    File.open('tmp/aaa', 'w') {|f| f.puts 'aaa' }
    File.open('tmp/bbb', 'w') {|f| f.puts 'bbb' }
    File.install 'tmp/aaa', 'tmp/bbb', 0600
    assert_equal "aaa\n", File.read('tmp/bbb')
    assert_equal 0600, (File.stat('tmp/bbb').mode & 0777) if have_file_perm?

    t = File.mtime('tmp/bbb')
    File.install 'tmp/aaa', 'tmp/bbb'
    assert_equal "aaa\n", File.read('tmp/bbb')
    assert_equal 0600, (File.stat('tmp/bbb').mode & 0777) if have_file_perm?
    assert_equal t, File.mtime('tmp/bbb')

    File.unlink 'tmp/aaa'
    File.unlink 'tmp/bbb'

    # src==dest
#    FileUtils.touch 'tmp/cptmp'
#    assert_raises(ArgumentError) {
#      File.install 'tmp/cptmp', 'tmp/cptmp'
#    }
#if have_symlink?
#    File.symlink 'cptmp', 'tmp/cptmp_symlink'
#    assert_raises(ArgumentError) {
#      File.install 'tmp/cptmp', 'tmp/cptmp_symlink'
#    }
#    File.symlink 'symlink', 'tmp/symlink'
#    assert_raises(Errno::ELOOP) {
#      File.install 'tmp/symlink', 'tmp/symlink'
#    }
#end
  end

end
