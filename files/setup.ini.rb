#!/usr/bin/env ruby

package_dir = '~ftp/pub/ruby/binaries/cygwin'
Info = Struct.new :version, :filename, :size
Package = Struct.new :prev, :curr, :test

Dir.chdir File.expand_path(package_dir)

ver = ARGV[0]
if ver
  Dir.chdir ver
  ver = ''
else
  ver = '1.8/'
end

packages = {}

pattern = ver+'{ruby-[1-9]*-i386-cygwin*.tar.bz2,ext/*-i386-cygwin*.tar.bz2}'
files = Dir[pattern].map {|y|
  [y.scan(/[\w\d]+/).map{|x|"%020s" % Integer(x) rescue x}, y]
}.sort.map{|x| x.last}
for filename in files
  next if /^old/ =~ filename
  size = File.size(filename)

=begin
  ruby_ver = '-1.6'
  ruby_ver =  '-' + $& if /^\d+\.\d+/ =~ filename
=end
  ruby_ver = '-1.6'
  if /(?:i386-cygwin|^ruby)(-\d\.\d)/ =~ filename
    ruby_ver = $1
  end

  case filename
  when /(ruby)-([\d\-.]+-\d{8})-i386/,
       /ext\/(win32ole)-(\d+\.\d+\.\da)-i386/,
       /([\w\-]+)-(\d[\w\-.]+)-i386.+1\.8/
    package = packages[File.basename($1) + ruby_ver] ||= Package.new
    package.test = Info.new $2, filename, size
  when /ext\/(http-access2)-(\w)-i386/,
       /(rdoc)-((?:alpha|beta)-[\da-f]+)-i386/,
       /([\w\-]+)-(\d[\w\-.]+)-i386/
    package = packages[File.basename($1) + ruby_ver] ||= Package.new
    package.prev = package.curr
    package.curr = Info.new $2, filename, size
  end
end

print <<"+"
setup-timestamp: #{Time.now.to_i}

+

packages.keys.sort.each do |name|
  package = packages[name]
  print <<"+"
@ #{name}
category: Ruby
+
  for type in [:prev, :curr, :test]
    ver = package.send type
    next unless ver
    print <<"+"
[#{type.id2name}]
version: #{ver.version}
install: #{ver.filename} #{ver.size}
+
  end
  print "\n"
end
