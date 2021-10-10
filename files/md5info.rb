#! /usr/bin/ruby

require 'digest/md5'

md5info = []
while line = gets
  case line
  when /^X-Ruby-CVS-MD5Info: (.+), (.+), (.+)$/
    md5info << {:file=>$1, :rev=>$2, :md5=>$3}
  when /^X-Ruby-CVS-Template: (.+)/
    t = $1
    ARGF.close
  end
end

for m in md5info
  cmd = format t, 'cvs', m[:rev], m[:file]
  raise "Dangerous charcters contained." if /[;\|<>*?&$()`\n]/ =~ cmd
  print m[:file], Digest::MD5.hexdigest(`#{cmd}`) == m[:md5] ?
    ": OK\n" :
    ": NG\n"
end
