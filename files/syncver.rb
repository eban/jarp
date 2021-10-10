#! /usr/bin/env ruby

formats = {
  'DATE' => [/".+"/, '"%Y-%m-%d"'],
  'CODE' => [/\d+/, '%Y%m%d'],
  'YEAR' => [/\d+/, '%Y'],
  'MONTH' => [/\d+/, '%m'],
  'DAY' => [/\d+/, '%d']
}

now = Time.now

ARGV.replace ["version.h"]
#$-i = '~'

while line = gets
  if /RUBY_RELEASE_(#{formats.keys.join('|')})/o =~ line
    format = formats[$1]
    line.sub!(format[0]) do
      now.strftime(format[1]).sub(/^0/, '')
    end
  end
  print line
end
