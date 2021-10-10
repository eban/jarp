#
# Just another Ruby hacker,
#
#---------- 1
print %%Just another Ruby hacker,%
#---------- 2
print ',rekcah ybuR rehtona tsuJ'.reverse
#---------- 3
print *%q/92G5S="!A;F]T:&5R(%)U8GD@:&%C:V5R+```/.unpack('u')
#---------- 4
print *%q/SnVzdCBhbm90aGVyIFJ1YnkgaGFja2VyLA==/.unpack('m')
#---------- 5
print 'Whfg nabgure Ehol unpxre,'.tr('A-Za-z', 'N-ZA-Mn-za-m')
#---------- 6
[2,15,13,14,0,4,10,11,14,8,7,12,0,3,15,5,16,0,8,4,6,9,7,12,1].each do |i|
  print ' ,JRabcehknorstuy'[i, 1]
end
#---------- 7
print [
   74, 117, 115, 116,  32,  97, 110,
  111, 116, 104, 101, 114,  32,  82,
  117,  98, 121,  32, 104,  97,  99,
  107, 101, 114,  44
].pack('c*')
#---------- 8
print({'ruby' => 'Just another Ruby hacker,'}['ruby'])
#---------- 9
print 'jUsT aNoThEr '.capitalize, 'RuBy HaCkEr,'.capitalize
#---------- 10
print ['Just another Ruby hacker,'][0]
#---------- 11
print *['hacker,', 'Ruby ', 'another ', 'Just '].reverse
#---------- 12
proc {print 'Just another Ruby hacker,'}.call
#---------- 13
def pri() print 'Just another Ruby hacker,' end; pri
#---------- 14
for i in ['Just another Ruby hacker,'] do print i end
#---------- 14 15
print `echo -n Just another Ruby hacker,`
#---------- 16
print *'Just another Ruby hacker,'.split('')
#---------- 17
print 'JQust aQnotQher RQuby hQackQer,'.delete('Q')
#---------- 18
'Just another Ruby hacker,'.scan(/(.)/) {print $1}
#---------- 19
print 'Just ' + 'another ' + 'Ruby ' + 'hacker,'
#---------- 20
print ['4a75737420616e6f746865722052756279206861636b65722c'].pack('H*')
#---------- 21
print *'Just another Ruby hacker,'.split(/(.)/)
#---------- 22
print %w(Just another Ruby hacker,).join(' ')
#---------- 23
#[ruby-list:6532]
class String; def -(x) end end; %-
#{print "Just another Ruby hacker,"}
-- 
"Just another Ruby hacker,"
#---------- 24
def (lang = "").org() 1 end
eval <<'-- '
def eban(x) print 'Just another Ruby hacker,' end
@ruby = 1

-- 
eban@ruby-lang.org
#---------- 25
print *{'another '=>'Just ', 'hacker,'=>'Ruby '}.invert.sort.join
#---------- 26
$><<<<'<'.chomp
Just another Ruby hacker,
<
#---------- 27
print eval(%-eval %: %|Just another Ruby hacker,| :-)
#---+----+--- 28
#;eval %qPprint eval %-eval %:'Just another Ruby hacker,' :-P
#---------- 29
print *'4a75737420616e6f746865722052756279206861636b65722c'.
gsub(/../, '=\&').unpack('M')
#---------- 30
print Hash.new('Just another Ruby hacker,')[:Ruby]
#---------- 31
print ['Just ', ['another ', ['Ruby ', ['hacker,']]]].join
#---------- 32
print Struct.new(*%w|Ruby Just another Ruby hacker,|)[*[0]*4].members*' '
#---------- 33
print Time.now.strftime('Just another Ruby hacker,')
#---------- 34
print "   Just another Ruby hacker,    \r\n".strip
#---------- 35
print *['Just ', nil, 'another ', nil, 'Ruby ', nil, 'hacker,'].compact
#---------- 36
['hacker,', 'Ruby ', 'another ', 'Just '].reverse_each do |x| print x end
#---------- 37
/Just another Ruby hacker,/.source.display
#---------- 38
send :print, 'Just another Ruby hacker,'
#---------- 39
print *(['Just ', 'another ', 'Ruby '] | ['another ', 'Ruby ', 'hacker,'])
#---------- 40
print *(['Just ', 'another ', 'Perl', 'Ruby ', 'hacker,'] - ['Perl'])
#---------- 41
print *[['', 'Just another Ruby hacker,']].assoc('')
#---------- 42
print ['Just another Ruby hacker,'].pack('a*')
#---------- 43
print *'Just another Ruby hacker,'.unpack('a*')
#---------- 44
print [['Just another Ruby hacker,'].pop].sort.shift
#---------- 45
print *[['Just another Ruby hacker,', '']].rassoc('')
#---------- 46
{'Just another ' => 'Ruby hacker,'}.to_a.join.display
#---------- 47
def method_missing(x) print "Just another Ruby #{x.id2name}," end; hacker; undef method_missing
#---------- 48
print 'Just another Ruby hackeq,'.succ
#---------- 49
print 'jUST ANOTHER rUBY HACKER,'.swapcase
#---------- 50
print ['Just another Ruby hacker,'].find {|x| x}
#---------- 51
print %w(Just another Ruby hacker,).find_all {|x| x}.join(' ')
#---------- 52
print %w(Just another Ruby hacker,).grep(/./).join(' ')
#---------- 53
Ruby = 'Just another Ruby hacker,' and print Object.const_get(:Ruby)
#---------- 54
Proc.new {print 'Just another Ruby hacker,'}[]
#---------- 55
print 'JJuusstt  aannootthheerr  RRuubbyy  hhaacckkeerr,,'.squeeze
#---------- 56
print [1249211252, 543256175, 1952998770, 542274914, 2032167009, 1667982706].pack('N*'), ','
#---------- 57
$> << 'Just ' << 'another ' << 'Ruby ' << 'hacker,'
#---------- 58
{}.fetch(:Ruby, 'Just another Ruby hacker,').display
#---------- 59
<<'-- '.split.each do |x| print((x.to_f ** 2).to_i.chr) end
8.60233 10.81666 10.72381 10.77033 5.65686 9.84886 10.48809 10.53566
10.77033 10.19804 10.04988 10.67708 5.65686 9.05539 10.81666 9.8995
11 5.65686 10.19804 9.84887 9.94988 10.34409 10.04988 10.67708 6.63325
-- 
#---------- 60
i='0';s='';<<'+'.each_byte{|x|x-=48;0<x&&(s<<i*x;i[0]=(i.unpack("c")[0]^1).chr)};print [s].pack("B*")
1121112311111322131141624112132214131132114221111321316
111212311111231242121621142411232121112122111132131122
+
#---------- 61
5.times do|i|'Jaebcunrykso  ettRhr hua,'.scan(/.{5}/) do print $&[i,1] end end
#---------- 62
a=',rekcah ybuR rehtona tsuJ'.split('');print a.pop while not a.empty?
#---------- 63
print ',Pr-eok,c"a$h! kypbquuRA %roeqhbtaoon;ab rtesbujJ&'.gsub(/(.)./, '\1').reverse
#---------- 64
print /.*/.match('Just another Ruby hacker,')
#---------- 65
print $& if /.*/ === 'Just another Ruby hacker,'
#---------- 66
case 'Just another Ruby hacker,' when /.*/; print $~[0] end
#---------- 67
print Marshal.load(Marshal.dump("Just another Ruby hacker,"))
#---------- 68
'Just another Ruby hacker,'.each_byte do |x| print x.chr end
#---------- 69
print *'/hacker,/another /Ruby /Just '.split('/').sort.values_at(1,3,2,4)
#---------- 70
print 'Just another Perl hacker,'.sub('Perl', 'Ruby')
#---------- 71
$><<'RbyckJust another,'.split('').values_at(5..16,9,0,6,1,2,9,14,10,3,4,15..17)*""
#---------- 72
a=0;[74,63,6,7,84,65,15,1,27,28,13,23,82,114,39,23,27,89,72,9,2,8,14,23,94].
each do|x|printf"%c",a^=x end
#---------- 73
[<<':-)'.tr(" \n", '0').gsub(/:-\)/, '1')].pack('B*').display
 :-)  :-) :-)  :-):-):-) :-) :-) :-):-):-)  :-):-) :-):-):-) :-)    :-)
     :-):-)    :-) :-):-) :-):-):-)  :-):-) :-):-):-):-) :-):-):-) :-)
  :-):-) :-)    :-):-)  :-) :-) :-):-):-)  :-)   :-)      :-) :-)  :-)
 :-):-):-) :-) :-) :-):-)   :-)  :-):-):-):-)  :-)  :-)      :-):-) :-)
   :-):-)    :-) :-):-)   :-):-) :-):-) :-) :-):-) :-):-)  :-) :-) :-):-):-)
 :-)   :-) :-):-)

:-)
#---------- 74
('a'..'y').to_a.join.tr('a-y','Just another Ruby hacker,').display
#---------- 75
begin print 'Just another ' ensure print 'Ruby hacker,' end
#---------- 76
'112165163164040141156157164150145162040122165142171040150141143153145162054'.
scan(/.../) do print $&.oct.chr end
#---------- 77
'J,ursetk caanho tyhbeurR  Rruebhyt ohnaac ktesru,J'.scan(/.(.)/).reverse.join.display
#---------- 78
'J,ursetk caanho tyhbeurR  Rruebhyt ohnaac ktesru,J'.gsub(/(.)./,'\1').display
#---------- 79
a='J,ursetk caanho tyhbeurR ';0.step(24,2){|i|print a[i,1]};23.step(1,-2){|i|print a[i,1]}
#---------- 80
a=*"Js nte uyhce,rka bRrhoatu".chars;12.times{print a.shift,a.pop};print *a
#---------- 81
a='Js nte uyhce,rka bRrhoatu';begin a.sub!(/^(.)(.*)(.)$/){print $1,$3;$2}end while$1;print a
#---------- 82
a='J Ruby hacker,ust another';11.times{a.sub!(/^(.)(.*)(.)$/,'\1\3\2')};print a
#---------- 83
print 'Just. another! -Ruby? $hacker,'.tr_s('-.!?$ ', ' ')
#---------- 84
' e m r,yJaRnafatbpcuekewhjhskvngohrlrxsctdtiubuoyq'.
scan(/(.)(.)/).collect!{|x|[x[1],x[0]]}.sort.collect!{|x|x[1]}.join.display
#---------- 85
'e m r y,aJnRfatapbuckewejhshvkgnholrxrcsdtitbuouqy'.
scan(/../).sort.collect!{|x|x[1,1]}.join.display
#---------- 86
'4a75737420616e6f746865722052756279206861636b65722c'.
scan(/../){print $&.hex.chr}
#---------- 87
print *['Just another Perl hacker,'].fill('Just another Ruby hacker,')
#---------- 88
$><<{1=>'Just ',2=>'another ',3=>'Ruby ',4=>'hacker,'}.sort.join.delete('1-4')
#---------- 89
Kernel.print %q<Just another Ruby hacker,>
#---------- 90
class Just_another_Ruby_hackerq;end;print Just_another_Ruby_hackerq.to_s.tr('_q',' ,')
#---------- 91
class Just_another_Ruby_hackerq;end;class Foo<Just_another_Ruby_hackerq;end
print Foo.superclass.to_s.tr('_q',' ,')
#---------- 92
Kust_another_Ruby_hacker=0;print Module.constants.grep(/Kust/)[0].to_s.tr('K_','J '), ','
#---------- 93
module Lust_another_Ruby_hackerq; print name.tr('L_q', 'J ,') end
#---------- 94
class Bar; print 'Just another Ruby hacker,' end
#---------- 95
class Baz; def initialize() print 'Just another Ruby hacker,' end end; Baz.new
#---------- 96
eval "A<')I;G0@)TIU<W0@86YO=&AE<B!2=6)Y(&AA8VME<BPG".unpack('u')[0]
#---------- 97
eval "cHJpbnQgJ0p1c3QgYW5vdGhlciBSdWJ5IGhhY2tlciwn".unpack('m')[0]
#---------- 98
$stdout.write 'Just another Ruby hacker,'
#---------- 99
"Just \nanother \nRuby \nhacker,\n".each_line do |x| print x.chomp end
#---------- 100
print $' if /\n/x === "\nJust another Ruby hacker,"
#---------- 101
def Object.method_added(x) send x, x.id2name end
def Just(x) print x, ' ' end
def another(x) print x, ' ' end
def Ruby(x) print x, ' ' end
def hacker(x) print x, ',' end
#---------- 102
def Object.method_added(x) print x.id2name, send(x) end
def Just() ' ' end
def another() ' ' end
def Ruby() ' ' end
def hacker() ',' end
def Object.method_added(x) nil end
#---------- 103
raise 'Just another Ruby hacker,' rescue print $!
#---------- 104
print File.basename('~/Just another Ruby hacker,.rb','.*')
#---------- 105
proc{|x|x['Just another Ruby hacker,']}[proc{|x|print x}]
#---------- 106
method(:print)['Just another Ruby hacker,']
#---------- 107
'Just another Ruby hacker,'.method(:display)[]
#---------- 108
print ''.replace('Just another Ruby hacker,')
#---------- 109
instance_eval do print 'Just another Ruby hacker,' end
#---------- 110
Kernel.module_eval do print 'Just another Ruby hacker,' end
#---------- 111
print %%\%s%%%%Just another Ruby hacker,%%%%%%%%%
#---------- 112
print !?????:???%?Just another Ruby hacker,?:??
#---------- 113
{}.default='Just another Ruby hacker,'.display
#---------- 114
print Hash['Just another ', 'Ruby hacker,'].to_a*""
#---------- 115
print 'Just ' 'another ' 'Ruby ' 'hacker,'
#---------- 116
#include <stdio.h>
#if 0
=begin
=end
def main() yield end
<<sub
=cut
sub
#endif
main(){ printf("Just another Ruby hacker,"); }
#if 0
=begin
=end
<<main
=cut
main
#endif
#---------- 117
#include <stdio.h>
#include <stdlib.h>
#define sub int
#if 0
eval "def main; yield end" if $.;
#endif
sub main(){ printf("Just another Ruby hacker,"); exit(0); }
#if 0
main
#endif
#---------- 118
print File.dirname('Just another Ruby hacker,/Just another Ruby porter,')
#---------- 119
def $_.singleton_method_added(*) print 'Just another Ruby hacker,' end
#---------- 120
print ['Just another Ruby hacker,'].delete_at(0)
#---------- 121
print '%s %s %s %s' % %w[Just another Ruby hacker,]
#---------- 122
'cker,by haer RuanothJust '.scan(/.{5}/).reverse.join.display
#---------- 123
(97..121).to_a.pack('c*').tr('a-y','Just another Ruby hacker,').display
#---------- 124
'abcdefghijklmnopqrstuvwxy'.tr('a-y','Just another Ruby hacker,').display
#---------- 125
',rekcah ybuR rehtona tsuJ'.scan(/.{1}/).reverse.join.display
#---------- 126
print 'Just another Ruby hacker,'%%; (^_^;;;
#---------- 127
print('Just another Ruby hacker,'% %- ;-)
#---------- 128
'r,keac hbyRur heotant usJ'.scan(/.{1,2}/).reverse.join.display
#---------- 129
print 'Just another Ruby hacker,' * ('Just another Ruby hacker,' =~ /u/)
#---------- 130
print 'uJtsa onhtreR bu yahkcre,'.unpack('v12c').pack('n12c')
#---------- 131
print 'uJtsa onhtreR bu yahkcre,'.gsub(/(.)(.?)/, '\2\1')
#---------- 132
'uJtsa onhtreR bu yahkcre,'.scan(/(.)(.?)/){|x,y| print y+x}
#---------- 133
print 'Just another Ruby hacker,'['Just another Ruby hacker,']
#---------- 134
print 'Just another Ruby hacker,'[/.*/]
#---------- 135
print *[].push('Just ', 'another ', 'Ruby ', 'hacker,')
#---------- 136
morse=eval <<'+'.unpack("m")[0]
SGFzaFsqJXcoLi0gYQotLi4uIGIKLS4tLiBjCi0uLiBkCi4gZQouLi0uIGYK
LS0uIGcKLi4uLiBoCi4uIGkKLi0tLSBqCi0uLSBrCi4tLi4gbAotLSBtCi0u
IG4KLS0tIG8KLi0tLiBwCi0tLi0gcQouLS4gcgouLi4gcwotIHQKLi4tIHUK
Li4uLSB2Ci4tLSB3Ci0uLi0geAotLi0tIHkKLS0uLiB6CnwgXCAKKV0K
+
<<'+'.split.map{|x|morse[x]||x}.join.gsub(/\b[jr]/){|x|x.upcase}.display
.--- ..- ... - | .- -. --- - .... . .-. | .-. ..- -... -.-- | .... .- -.-. -.- . .-. ,
+
#---------- 137
print 'Just another Ruby hacker,'[0..-1]
#---------- 138
print 'Just another Ruby hacker,'.instance_eval{self}
#---------- 139
class String; def +@() print self end; +'Just another Ruby hacker,' end
#---------- 140
print '1J2u3s4t5 6a7n8o9t0h1e2r3 4R5u6b7y8 9h0a1c2k3e4r5,'.delete('0-9')
#---------- 141
'Jaubsctd eafngohtihjekrl mRnuobpyq rhsatcukvewrx,y'.gsub(/(.)./, '\1').display
#---------- 142
$><<{'Just another Ruby hacker,'=>''}.tap{|x|x.default=0}.to_a.join
#---------- 143
print eval('Just another Ruby hacker,'.dump)
#---------- 144
print 'Just another Ruby hacker'.concat(?,)
#---------- 145
print 'Just another Ruby hacker,'.intern.to_s
#---------- 146
print 'Just another Ruby hacker,'.dump[1..-2]
#---------- 147
'Just another Ruby hacker,'.each_line do |x| print x end
#---------- 148
['JUST ANOTHER ', 'RUBY HACKER,'].each do |x| print x.capitalize end
#---------- 149
printf '%.25s', 'Just another Ruby hacker,JARH'
#---------- 150
print 'Just another Ruby hacker,'.split(/Z/)[0]
#---------- 151
print *'Just another Ruby hacker,'.split(//)
#---------- 152
print *%w.J u s t \ a n o t h e r \ R u b y \ h a c k e r ,.
#---------- 153
print String([%[Just another Ruby hacker,]]*"")
#---------- 154
print catch(:x){throw :x, 'Just another Ruby hacker,'}
#---------- 155
r,w = IO::pipe;w.print 'Just another Ruby hacker,';w.close;print r.gets
#---------- 156
print sprintf('%s', format('%s' % '%s', 'Just another Ruby hacker,'))
#---------- 157
print eval('Just another Ruby hacker,'.inspect)
#---------- 158
/#{print 'Just another Ruby hacker,'}/
#---------- 159
print 'Just another Ruby hacker,'.scan(/./).map{|x|x.unpack("c")[0]}.pack('U*')
#---------- 160
print [<<'+'.delete("\n").gsub(/./){format'%02b',$&.unpack("c")[0]-65}].pack('B*')
BACCBDBBBDADBDBAACAABCABBCDCBCDDBDBABCCABCBBBDACAC
AABBACBDBBBCACBDCBACAABCCABCABBCADBCCDBCBBBDACACDA
+
#---------- 161
print 'Just another Ruby hacker,'.scan(/./).pack('a'*25)
#---------- 162
'Just another Ruby hacker,'.send 'yalpsid'.reverse.intern
#---------- 163
print %w.Just another Ruby Ruby Ruby hacker,..uniq.join(' ')
#---------- 164
{}.fetch(:x){'Just another Ruby hacker,'}.display
#---------- 165
{}.delete(:x){'Just another Ruby hacker,'}.display
#---------- 166
print *[:x].map{'Just another Ruby hacker,'}
#---------- 167
{'Ruby hacker,'=>'Just another'}.each{|x|print x.reverse*" "}
#---------- 168
print [].unshift('Ruby hacker,').unshift('Just another')*" "
#---------- 169
{3=>'Ruby ',2=>'another ',4=>'hacker,',1=>'Just '}.values_at(1,2,3,4).join.display
#---------- 170
class Symbol; def -(x)end end
def M(*)print'Just another Ruby hacker,'end
M:I-2
#---------- 171
print [[0,'Just another Ruby hacker,'],1].first.last
#---------- 172
{''=>'JARH'}.update(''=>'Just another Ruby hacker,').to_a.join.display
#---------- 173
{:JARH => 'Just another Ruby hacker,'}.values.join.display
#---------- 174
{'Just another Ruby hacker,'=>:JARH}.invert[:JARH].display
#---------- 175
print *['Just another Ruby hacker,'=>:JARH][0].keys
#---------- 176
print [{}].slice(0..0)[0].store('', 'Just another Ruby hacker,')
#---------- 177
print 'Just another Ruby hacker,'.split.join(' ')
#---------- 178
trace_var(:$.){print 'Just another Ruby hacker,'};$.=$.
#---------- 179
begin print 'Just another Ruby hacker,' end while false
#---------- 180
begin rescue then else print 'Just another Ruby hacker,' end
#---------- 181
print //.match('Just another Ruby hacker,').string
#---------- 182
#callcc{print 'Just another Ruby hacker,'}
#---------- 183
class Foo
  def foo() print 'Just another Ruby hacker,' end
  instance_method(:foo).bind(new)[]
end
#---------- 184
Thread.start{print'Just another Ruby hacker,'}.join
#---------- 185
print [<<'+'.chomp,<<'+'.chomp,<<'+'.chomp,<<'+'.chomp].join(' ')
Just
+
another
+
Ruby
+
hacker,
+
#---------- 186
('JARH'..'Just another Ruby hacker,').end.display
#---------- 187
('Just another'..'Ruby hacker,').to_s.tr_s('.', ' ').display
#---------- 188
unless true then else 'Just another Ruby hacker,' end.display
#---------- 189
loop do print 'Just another Ruby hacker,'; break end
#---------- 190
class String
  def coerce x
    print self
    [0, 0]
  end
  1 + 'Just another Ruby hacker,'
  remove_method :coerce
end
#---------- 191
1.times do print 'Just another Ruby hacker,' end
#---------- 192
0.upto(0) do print 'Just another Ruby hacker,' end
#---------- 193
0.downto(0) do print 'Just another Ruby hacker,' end
#---------- 194
#print Struct.new('Just another Ruby hacker,').to_s.split(':')[2]
print Struct.new('Just_another_Ruby_hacker').to_s.split(':')[2].tr('_',' '),','
#---------- 195
def (x='Just another Ruby hacker,').foo() print self end; x.foo
#---------- 196
begin print 'Just another Ruby hacker,' end until true
#---------- 197
for i in %w[Just\  another\  Ruby\  hacker,] do print i end
#---------- 198
'Just another Ruby hacker,'.each_byte do |x| putc x end
#---------- 199
',rekcah ybuR rehtona tsuJ'.scan(/./).reverse_each do |x| putc x end
#---------- 200
print Regexp.quote('Just another Ruby hacker,').delete('\\')
#---------- 201
print true ? "Just another Ruby hacker," :-P
#---------- 202
print true ? "Just another Ruby hacker," :-D
#---------- 203
print *("Just another Ruby hacker,".."Just another Ruby hacker,").to_a
#---------- 204
print eval(%<%%Just another Ruby hacker,%>)
#---------- 205
print case when true then "Just another Ruby hacker," end
#---------- 206
print %w[Just another Ruby hacker,] * " "
#---------- 207
begin end if print "Just another Ruby hacker,"
#---------- 208
print begin "Just another Ruby hacker," end
#---------- 209
print "Just another Ruby hacker,".center(10000).strip
#---------- 210
print "Just " or print "another " or print "Ruby " or print "hacker,"
#---------- 211
print :"Just another Ruby hacker,"
#---------- 212
print DATA.gets.chomp
__END__
Just another Ruby hacker,
