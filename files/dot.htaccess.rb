#! /usr/bin/env ruby

PACKAGE_DIR = ARGV[0] || '~ftp/pub/ruby/binaries/cygwin/1.8/ext'

Package = Struct.new :url, :name

namesmap = {}
namesmap.default =
  Package.new 'http://raa.ruby-lang.org/', nil

while line = DATA.gets
  f = *line.chomp.split(/,/)
  namesmap[f[2]] = Package.new f[0], f[1]
end

Dir.chdir(File.expand_path(PACKAGE_DIR))

packages = {}

files = Dir['*-i386-cygwin.tar.gz'].sort do |a,b|
  a.sub(/-i386-cygwin\.tar\.gz/, '') <=> b.sub(/-i386-cygwin\.tar\.gz/, '')
end
for filename in files
  size = File.size(filename)
  case filename
  when /^(http-access2|win32ole|rdoc|kakasi|termios)/, /([\-\w]+)-(\d[\-\w.]+-)/
    packages[File.basename($1)] = true
  end
end

print <<'+'
#Header set Last-Modified "Sub, 28 Jan 2001 15:32:50 GMT"
IndexOptions NameWidth=* FancyIndexing SuppressHTMLPreamble
IndexOptions DescriptionWidth=* TrackModified
IndexOrderDefault Descending Date
HeaderName HEAD.html
ReadmeName README.html
IndexIgnore README.html HEAD.html ? *~ *.bak i386-* cygwin1-1.1.8-2* cygwin-1.1.8-2* *-1.tar.gz ruby-binaries *.timestamp
<Files .htaccess>
    Order allow,deny
    allow from all
</Files>

+

packages.keys.sort.each do |filename|
  package = namesmap[filename]
  prefix = /^http:/ =~ package.url ? '' :
    'http://raa.ruby-lang.org/list.rhtml?name='
  name = package.name || filename
  print <<"+"
AddDescription "<a href=#{prefix}#{package.url}>#{name}</a>" #{filename}-*-i386-*.tar.gz
+
end

print <<'+'
AddDescription "Extention Libraries" ext
AddDescription "Old binaries" old
AddDescription "<a href=http://www.xcf.berkeley.edu/~jmacd/xdelta.html>xdelta</a>" xdelta.exe
AddDescription "Delta from Current Release" *.xdelta
AddDescription "<a href=http://www.ruby-lang.org/en/download.html>Current Release</a>" ruby-1.6.8-?-i386-*.tar.gz
AddDescription "<a href=http://www.ruby-lang.org/~knu/cgi-bin/cvsweb.cgi/ruby/?only_with_tag=ruby_1_6>CVS Snapshot</a>" ruby-1.6.[^-]*-*-i386-*.tar.gz
AddDescription "<a href=http://www.ruby-lang.org/en/download.html>Old Release</a>" ruby-1.6.[2-7]-i386-*.tar.gz
AddDescription "Headers and Import Library" ruby-devel-[^-]*-i386-*.tar.gz
AddDescription "<a href=http://www.ruby-lang.org/en/download.html>Current Release</a>" ruby-[^-]*-i386-*.tar.gz
AddDescription "bmingw package" bmingw-*.tar.gz
AddDescription "bmingw package" bmingw
AddDescription "Forwarding DLL for ProgPrag Ruby" mingw32-ruby*-to-mswin32-ruby*
AddDescription "<a href=http://cygwin.com/snapshots/>Cygwin DLL</a>" cygwin1*.dll
AddDescription "<a href=http://www.gimp.org/~tml/gimp/win32/>GTk+ and GIMP for Windows</a>" gtk-dlls*.tar.gz
AddDescription "<a href=http://cygwin.com/>Cygwin Home</a>" cygwin
AddDescription "<a href=http://www.mingw.org/>MinGW Home</a>" mingw
AddDescription "<a href=http://delorie.com/djgpp/>DJGPP Home</a>" djgpp
AddDescription "Ruby Binaries" binaries
+
#url,name,filename
__END__
xml-rpc,XML-RPC,xmlrpc4r
perfctr,PerfCtr,perfctr
aspectr,AspectR,aspectr
log4r,Log4r,log4r
rdoc,RDoc,rdoc
rexml,REXML,rexml
nqxml,NQXML,nqxml
mmap,Mmap,mmap
lapidary,Lapidary,lapidary
html-parser,html-parser,html-parser
devel-which,Devel::Which,devel-which
devel-logger,Lightweight logging utility,devel-logger
rubyzip,rubyzip,rubyzip
webrick,WEBrick,webrick
progressbar,Ruby/ProgressBar,ruby-progressbar
narray,NArray,narray
mutexm,MutexM,mutexm
forwardable,forwardable,forwardable
bdb,bdb,bdb
erb,ERB,erb
druby,druby - distributed ruby,drb
ruby-zlib,zlib extension,ruby-zlib
ruby-termios,simple wrapper for termios(3),ruby-termios
ruby-termios,simple wrapper for termios(3),termios
ruby-kakasi,Ruby/KAKASI,kakasi
ri,ri,ri
ruby-gd,Ruby/GD,ruby-GD
vruby,VRuby,vruby
xmlparser,XMLParser,xmlparser
swin,SWin,vrswin
ruby-gtk,Ruby/GTK,ruby-gtk
ruby-libglade,Ruby/LibGlade,ruby-libglade
tmail,TMail,tmail
iconv,iconv,iconv
uconv,Uconv,uconv
rdtool,RDtool,rdtool
optionparser,OptionParser,optparse
eruby,eruby,eruby
strscan,strscan,strscan
racc,Racc,racc
rubyunit,RubyUnit,rubyunit
rubywin,RubyWin,rubywin
win32ole,Win32OLE,win32ole
date2,date2,date2
testunit,Test::Unit,testunit
benchmark,Benchmark,benchmark
http-access2,http-access2,http-access2
soap4r,SOAP4R,soap4r
ruby-google,Ruby/Google,ruby-google
bz2,BZ2,bz2
yaml,yaml.rb,yamlrb
bigfloat,BigFloat,bigfloat
csv,CSV format parser / generator,csv
import_module,Import Module,import-module
ruby-gettext,Ruby GetText Package,ruby-gettext-package
ruby-sqlite,Ruby-SQLite,ruby-sqlite
xmlscan,pure Ruby XML parser,xmlscan
rubymail,RubyMail - email message library,rubymail
win32serial,Win32Serial,win32serial
amrita,amrita,amrita
misen,misen - Amrita power for any text,misen
bitvector,BitVector,bitvector
strongtyping,strongtyping,strongtyping
ruby-serialport,Ruby/SerialPort,ruby-serialport
openssl,OpenSSL,ossl
xml-configfile,Easy handling of XML configuration files,xmlconfigfile
nkf192-ruby,Ruby Interface for NKF 1.92,nkf192-ruby
ruby-js,Ruby/JS,rubyjs
xtemplate,XML Template Engine,xtemplate
oocp,a copy command and a library,oocp
bruby,bRuby,bruby
