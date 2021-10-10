#!/usr/local/bin/ruby

OBJEXT = 'obj'

def header_print(obj, h)
  line = obj + '$(OBJEXT)' + ":"
  for i in h
    if ((line + i).length > 64)
      print line, " \\\n"
      line = ' '
    end
    line.concat " $(vpath)" + i
  end
  print line, "\n"
end

headers = nil
obj = nil

print <<"+"
vpath = {$(srcdir);$(srcdir)/missing}
OBJEXT = #{OBJEXT}
+

while line = gets
  line.chomp!
  next if line.empty?
  if /^(\w+\.)\w+\s*:(.*?)\\?$/ =~ line
    header_print obj, headers if headers
    headers = []
    headers.concat $2.split
    obj = $1
  else
    headers.concat line.sub(/\\$/, '').strip.split
  end
end

header_print obj, headers
