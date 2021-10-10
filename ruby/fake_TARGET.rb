class Object
  if $target
    target = $target
    if $version
      version = $version
      ver = version.sub(/\.\d+$/, '')
    end
  elsif /fake[-_](.+?)(?:[-_]([\d.]+))?\.rb/ === __FILE__
    target = $1
    if $2
      version = $2
      ver = version.sub(/\.\d+$/, '')
    end
  else
    raise "bad filename: " + File.basename(__FILE__)
  end

  destdir = ($dist || File.expand_path('~/dist')) + '/' + target
  over = RUBY_VERSION.sub(/\.\d+$/, '')

  $:.collect! do |x|
    x.sub!(/^\/usr/, destdir+'/usr')
    x.sub!(RUBY_PLATFORM, target)
    if version
      x.sub!(over, ver)
    end
    x
  end

  remove_const :RUBY_PLATFORM
  RUBY_PLATFORM = target
  if defined? PLATFORM
    remove_const :PLATFORM
    PLATFORM = target
  end

  if version
    remove_const :RUBY_VERSION
    RUBY_VERSION = version
    if defined? VERSION
      remove_const :VERSION
      VERSION = version
    end
  end

  CROSS_COMPILING = true
end
