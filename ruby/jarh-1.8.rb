#
# Just another Ruby hacker,
#
unless [].respond_to? :values_at
  class Array
    alias values_at indexes
  end
end
unless {}.respond_to? :values_at
  class Hash
    alias values_at indexes
  end
end

print %%Just another Ruby hacker,%
#----------
print ',rekcah ybuR rehtona tsuJ'.reverse
#----------
print %q/92G5S="!A;F]T:&5R(%)U8GD@:&%C:V5R+```/.unpack('u')
#----------
print %q/SnVzdCBhbm90aGVyIFJ1YnkgaGFja2VyLA==/.unpack('m')
#----------
print 'Whfg nabgure Ehol unpxre,'.tr('A-Za-z', 'N-ZA-Mn-za-m')
#----------
[2,15,13,14,0,4,10,11,14,8,7,12,0,3,15,5,16,0,8,4,6,9,7,12,1].each do |i|
  print ' ,JRabcehknorstuy'[i, 1]
end
#----------
print [
   74, 117, 115, 116,  32,  97, 110,
  111, 116, 104, 101, 114,  32,  82,
  117,  98, 121,  32, 104,  97,  99,
  107, 101, 114,  44
].pack('c*')
#----------
print({'ruby' => 'Just another Ruby hacker,'}['ruby'])
#----------
print 'jUsT aNoThEr '.capitalize, 'RuBy HaCkEr,'.capitalize
#----------
print ['Just another Ruby hacker,'][0]
#----------
print ['hacker,', 'Ruby ', 'another ', 'Just '].reverse
#----------
proc {print 'Just another Ruby hacker,'}.call
#----------
def pri() print 'Just another Ruby hacker,' end; pri
#----------
for i in 'Just another Ruby hacker,' do print i end
#----------
print `echo -n Just another Ruby hacker,`
#----------
print 'Just another Ruby hacker,'.split('')
#----------
print 'JQust aQnotQher RQuby hQackQer,'.delete('Q')
#----------
'Just another Ruby hacker,'.scan(/(.)/) {print $1}
#----------
print 'Just ' + 'another ' + 'Ruby ' + 'hacker,'
#----------
print ['4a75737420616e6f746865722052756279206861636b65722c'].pack('H*')
#----------
print 'Just another Ruby hacker,'.split(/(.)/)
#----------
print %w(Just another Ruby hacker,).join(' ')
#----------
#[ruby-list:6532]
class String; def -(x) end end; %-
#{print "Just another Ruby hacker,"}
-- 
"Just another Ruby hacker,"
#----------
def (lang = "").org() 1 end
eval <<'-- '
def eban(x) print 'Just another Ruby hacker,' end
@ruby = 1

-- 
eban@ruby-lang.org
#----------
print({'another '=>'Just ', 'hacker,'=>'Ruby '}.invert.sort)
#----------
$><<<<'<'.chomp
Just another Ruby hacker,
<
#----------
print eval(%-eval %: %|Just another Ruby hacker,| :-)
#----------
#;eval %qPprint eval %-eval %:'Just another Ruby hacker,' :-P
#----------
STDOUT << '4a75737420616e6f746865722052756279206861636b65722c'.
gsub(/../, '=\&').unpack('M')
#----------
print Hash.new('Just another Ruby hacker,')[:Ruby]
#----------
print ['Just ', ['another ', ['Ruby ', ['hacker,']]]].flatten
#----------
print Struct.new(*%w|Ruby Just another Ruby hacker,|)[*[0]*4].members.join(' ')
#----------
print Time.now.strftime('Just another Ruby hacker,')
#----------
print "   Just another Ruby hacker,    \r\n".strip
#----------
print ['Just ', nil, 'another ', nil, 'Ruby ', nil, 'hacker,'].compact
#----------
['hacker,', 'Ruby ', 'another ', 'Just '].reverse_each do |x| print x end
#----------
/Just another Ruby hacker,/.source.display
#----------
send :print, 'Just another Ruby hacker,'
#----------
print ['Just ', 'another ', 'Ruby '] | ['another ', 'Ruby ', 'hacker,']
#----------
print ['Just ', 'another ', 'Perl', 'Ruby ', 'hacker,'] - ['Perl']
#----------
print [['', 'Just another Ruby hacker,']].assoc('')
#----------
print ['Just another Ruby hacker,'].pack('a*')
#----------
print 'Just another Ruby hacker,'.unpack('a*')
#----------
print [['Just another Ruby hacker,'].pop].sort.shift
#----------
print [['Just another Ruby hacker,', '']].rassoc('')
#----------
{'Just another ' => 'Ruby hacker,'}.to_a.display
#----------
def method_missing(x) print "Just another Ruby #{x.id2name}," end; hacker
#----------
print 'Just another Ruby hackeq,'.succ
#----------
print 'jUST ANOTHER rUBY HACKER,'.swapcase
#----------
print ['Just another Ruby hacker,'].find {|x| x}
#----------
print %w(Just another Ruby hacker,).find_all {|x| x}.join(' ')
#----------
print %w(Just another Ruby hacker,).grep(/./).join(' ')
#----------
Ruby = 'Just another Ruby hacker,' and print Object.const_get(:Ruby)
#----------
Proc.new {print 'Just another Ruby hacker,'}[]
#----------
print 'JJuusstt  aannootthheerr  RRuubbyy  hhaacckkeerr,,'.squeeze
#----------
print [1249211252, 543256175, 1952998770, 542274914, 2032167009, 1667982706].pack('N*'), ','
#----------
$> << 'Just ' << 'another ' << 'Ruby ' << 'hacker,'
#----------
{}.fetch(:Ruby, 'Just another Ruby hacker,').display
#----------
<<'-- '.split.each do |x| print((x.to_f ** 2).to_i.chr) end
8.60233 10.81666 10.72381 10.77033 5.65686 9.84886 10.48809 10.53566
10.77033 10.19804 10.04988 10.67708 5.65686 9.05539 10.81666 9.8995
11 5.65686 10.19804 9.84887 9.94988 10.34409 10.04988 10.67708 6.63325
-- 
#----------
i='0';s='';<<'+'.each_byte{|x|x-=48;0<x&&(s<<i*x;i[0]^=1)};print [s].pack("B*")
1121112311111322131141624112132214131132114221111321316
111212311111231242121621142411232121112122111132131122
+
#----------
5.times do|i|'Jaebcunrykso  ettRhr hua,'.scan(/.{5}/) do print $&[i,1] end end
#----------
a=',rekcah ybuR rehtona tsuJ'.split('');print a.pop while not a.empty?
#----------
print ',Pr-eok,c"a$h! kypbquuRA %roeqhbtaoon;ab rtesbujJ&'.gsub(/(.)./, '\1').reverse
#----------
print /.*/.match('Just another Ruby hacker,')
#----------
print $& if /.*/ === 'Just another Ruby hacker,'
#----------
case 'Just another Ruby hacker,' when /.*/; print $~[0] end
#----------
print Marshal.load(Marshal.dump("Just another Ruby hacker,"))
#----------
'Just another Ruby hacker,'.each_byte do |x| print x.chr end
#----------
print '/hacker,/another /Ruby /Just '.split('/').sort.values_at(1,3,2,4)
#----------
print 'Just another Perl hacker,'.sub('Perl', 'Ruby')
#----------
#$><<'RbyckJust another,'.split('').values_at(5..16,9,0,6,1,2,9,14,10,3,4,15..17)
#----------
a=0;[74,63,6,7,84,65,15,1,27,28,13,23,82,114,39,23,27,89,72,9,2,8,14,23,94].
each do|x|printf"%c",a^=x end
#----------
[<<':-)'.tr(" \n", '0').gsub(/:-\)/, '1')].pack('B*').display
 :-)  :-) :-)  :-):-):-) :-) :-) :-):-):-)  :-):-) :-):-):-) :-)    :-)
     :-):-)    :-) :-):-) :-):-):-)  :-):-) :-):-):-):-) :-):-):-) :-)
  :-):-) :-)    :-):-)  :-) :-) :-):-):-)  :-)   :-)      :-) :-)  :-)
 :-):-):-) :-) :-) :-):-)   :-)  :-):-):-):-)  :-)  :-)      :-):-) :-)
   :-):-)    :-) :-):-)   :-):-) :-):-) :-) :-):-) :-):-)  :-) :-) :-):-):-)
 :-)   :-) :-):-)

:-)
#----------
('a'..'y').to_a.join.tr('a-y','Just another Ruby hacker,').display
#----------
begin print 'Just another ' ensure print 'Ruby hacker,' end
#----------
'112165163164040141156157164150145162040122165142171040150141143153145162054'.
scan(/.../) do print $&.oct.chr end
#----------
'J,ursetk caanho tyhbeurR  Rruebhyt ohnaac ktesru,J'.scan(/.(.)/).reverse.display
#----------
'J,ursetk caanho tyhbeurR  Rruebhyt ohnaac ktesru,J'.gsub(/(.)./,'\1').display
#----------
a='J,ursetk caanho tyhbeurR ';0.step(24,2){|i|print a[i,1]};23.step(1,-2){|i|print a[i,1]}
#----------
a='Js nte uyhce,rka bRrhoatu'.split('');12.times{print a.shift,a.pop};print a
#----------
a='Js nte uyhce,rka bRrhoatu';begin a.sub!(/^(.)(.*)(.)$/){print $1,$3;$2}end while$1;print a
#----------
a='J Ruby hacker,ust another';11.times{a.sub!(/^(.)(.*)(.)$/,'\1\3\2')};print a
#----------
print 'Just. another! -Ruby? $hacker,'.tr_s('-.!?$ ', ' ')
#----------
' e m r,yJaRnafatbpcuekewhjhskvngohrlrxsctdtiubuoyq'.
scan(/(.)(.)/).collect!{|x|[x[1],x[0]]}.sort.collect!{|x|x[1]}.display
#----------
'e m r y,aJnRfatapbuckewejhshvkgnholrxrcsdtitbuouqy'.
scan(/../).sort.collect!{|x|x[1,1]}.display
#----------
'4a75737420616e6f746865722052756279206861636b65722c'.
scan(/../){print $&.hex.chr}
#----------
print ['Just another Perl hacker,'].fill('Just another Ruby hacker,')
#----------
$><<{1=>'Just ',2=>'another ',3=>'Ruby ',4=>'hacker,'}.sort.to_s.delete('1-4')
#----------
Kernel.print %q<Just another Ruby hacker,>
#----------
class Just_another_Ruby_hackerq;end;print Just_another_Ruby_hackerq.to_s.tr('_q',' ,')
#----------
class Just_another_Ruby_hackerq;end;class Foo<Just_another_Ruby_hackerq;end
print Foo.superclass.to_s.tr('_q',' ,')
#----------
Kust_another_Ruby_hacker=0;print Module.constants.grep(/Kust/)[0].tr('K_','J '), ','
#----------
module Lust_another_Ruby_hackerq; print name.tr('L_q', 'J ,') end
#----------
class Bar; print 'Just another Ruby hacker,' end
#----------
class Baz; def initialize() print 'Just another Ruby hacker,' end end; Baz.new
#----------
eval "A<')I;G0@)TIU<W0@86YO=&AE<B!2=6)Y(&AA8VME<BPG".unpack('u')[0]
#----------
eval "cHJpbnQgJ0p1c3QgYW5vdGhlciBSdWJ5IGhhY2tlciwn".unpack('m')[0]
#----------
$stdout.write 'Just another Ruby hacker,'
#----------
"Just \nanother \nRuby \nhacker,\n".each do |x| print x.chomp end
#----------
print $' if /\n/x === "\nJust another Ruby hacker,"
#----------
def Object.method_added(x) send x, x.id2name end
def Just(x) print x, ' ' end
def another(x) print x, ' ' end
def Ruby(x) print x, ' ' end
def hacker(x) print x, ',' end
#----------
def Object.method_added(x) print x.id2name, send(x) end
def Just() ' ' end
def another() ' ' end
def Ruby() ' ' end
def hacker() ',' end
def Object.method_added(x) nil end
#----------
raise 'Just another Ruby hacker,' rescue print $!
#----------
print File.basename('~/Just another Ruby hacker,.rb','.*')
#----------
proc{|x|x['Just another Ruby hacker,']}[proc{|x|print x}]
#----------
method(:print)['Just another Ruby hacker,']
#----------
'Just another Ruby hacker,'.method(:display)[]
#----------
print ''.replace('Just another Ruby hacker,')
#----------
instance_eval do print 'Just another Ruby hacker,' end
#----------
Kernel.module_eval do print 'Just another Ruby hacker,' end
#----------
print %%\%s%%%%Just another Ruby hacker,%%%%%%%%%
#----------
print !?????:???%?Just another Ruby hacker,?:??
#----------
#({}.default='Just another Ruby hacker,')[0].display
#----------
print Hash['Just another ', 'Ruby hacker,']
#----------
print 'Just ' 'another ' 'Ruby ' 'hacker,'
#----------
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
#----------
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
#----------
print File.dirname('Just another Ruby hacker,/Just another Ruby porter,')
#----------
def $_.singleton_method_added(*) print 'Just another Ruby hacker,' end
#----------
print ['Just another Ruby hacker,'].delete_at(0)
#----------
print '%s %s %s %s' % %w[Just another Ruby hacker,]
#----------
'cker,by haer RuanothJust '.scan(/.{5}/).reverse.display
#----------
(97..121).to_a.pack('c*').tr('a-y','Just another Ruby hacker,').display
#----------
'abcdefghijklmnopqrstuvwxy'.tr('a-y','Just another Ruby hacker,').display
#----------
',rekcah ybuR rehtona tsuJ'.scan(/.{1}/).reverse.display
#----------
print 'Just another Ruby hacker,'%%; (^_^;;;
#----------
print('Just another Ruby hacker,'% %- ;-)
#----------
'r,keac hbyRur heotant usJ'.scan(/.{1,2}/).reverse.display
#----------
print 'Just another Ruby hacker,' * ('Just another Ruby hacker,' =~ /u/)
#----------
print 'uJtsa onhtreR bu yahkcre,'.unpack('v12c').pack('n12c')
#----------
print 'uJtsa onhtreR bu yahkcre,'.gsub(/(.)(.?)/, '\2\1')
#----------
'uJtsa onhtreR bu yahkcre,'.scan(/(.)(.?)/){|x,y| print y+x}
#----------
print 'Just another Ruby hacker,'['Just another Ruby hacker,']
#----------
print 'Just another Ruby hacker,'[/.*/]
#----------
print [].push('Just ', 'another ', 'Ruby ', 'hacker,')
#----------
morse=eval <<'+'.unpack("m")[0]
SGFzaFsqJXcoLi0gYQotLi4uIGIKLS4tLiBjCi0uLiBkCi4gZQouLi0uIGYK
LS0uIGcKLi4uLiBoCi4uIGkKLi0tLSBqCi0uLSBrCi4tLi4gbAotLSBtCi0u
IG4KLS0tIG8KLi0tLiBwCi0tLi0gcQouLS4gcgouLi4gcwotIHQKLi4tIHUK
Li4uLSB2Ci4tLSB3Ci0uLi0geAotLi0tIHkKLS0uLiB6CnwgXCAKKV0K
+
<<'+'.split.map{|x|morse[x]||x}.join.gsub(/\b[jr]/){|x|x.upcase}.display
.--- ..- ... - | .- -. --- - .... . .-. | .-. ..- -... -.-- | .... .- -.-. -.- . .-. ,
+
#----------
print 'Just another Ruby hacker,'[0..-1]
#----------
print 'Just another Ruby hacker,'.instance_eval{self}
#----------
class String; def +@() print self end; +'Just another Ruby hacker,' end
#----------
print '1J2u3s4t5 6a7n8o9t0h1e2r3 4R5u6b7y8 9h0a1c2k3e4r5,'.delete('0-9')
#----------
'Jaubsctd eafngohtihjekrl mRnuobpyq rhsatcukvewrx,y'.gsub(/(.)./, '\1').display
#----------
#$><<{'Just another Ruby hacker,'=>''}.default=0
#----------
print eval('Just another Ruby hacker,'.dump)
#----------
print 'Just another Ruby hacker'.concat(?,)
#----------
print 'Just another Ruby hacker,'.intern.to_s
#----------
print 'Just another Ruby hacker,'.dump[1..-2]
#----------
'Just another Ruby hacker,'.each_line do |x| print x end
#----------
['JUST ANOTHER ', 'RUBY HACKER,'].each do |x| print x.capitalize end
#----------
printf '%.25s', 'Just another Ruby hacker,JARH'
#----------
print 'Just another Ruby hacker,'.split(/Z/)[0]
#----------
print 'Just another Ruby hacker,'.split(//)
#----------
print %w.J u s t \ a n o t h e r \ R u b y \ h a c k e r ,.
#----------
print String([%[Just another Ruby hacker,]])
#----------
print catch(:x){throw :x, 'Just another Ruby hacker,'}
#----------
r,w = IO::pipe;w.print 'Just another Ruby hacker,';w.close;print r.gets
#----------
print sprintf('%s', format('%s' % '%s', 'Just another Ruby hacker,'))
#----------
print eval('Just another Ruby hacker,'.inspect)
#----------
/#{print 'Just another Ruby hacker,'}/
#----------
print 'Just another Ruby hacker,'.scan(/./).collect{|x|x[0]}.pack('U*')
#----------
print [<<'+'.delete("\n").gsub(/./){format'%02b',$&[0]-?A}].pack('B*')
BACCBDBBBDADBDBAACAABCABBCDCBCDDBDBABCCABCBBBDACAC
AABBACBDBBBCACBDCBACAABCCABCABBCADBCCDBCBBBDACACDA
+
#----------
print 'Just another Ruby hacker,'.scan(/./).pack('a'*25)
#----------
'Just another Ruby hacker,'.send 'yalpsid'.reverse.intern
#----------
print %w.Just another Ruby Ruby Ruby hacker,..uniq.join(' ')
#----------
{}.fetch(:x){'Just another Ruby hacker,'}.display
#----------
{}.delete(:x){'Just another Ruby hacker,'}.display
#----------
print [:x].map{'Just another Ruby hacker,'}
#----------
{'Ruby hacker,'=>'Just another'}.each{|*x|print x.reverse.join(' ')}
#----------
print [].unshift('Ruby hacker,').unshift('Just another').join(' ')
#----------
{3=>'Ruby ',2=>'another ',4=>'hacker,',1=>'Just '}.values_at(1,2,3,4).display
#----------
class Symbol; def -(x)end end
def M(*)print'Just another Ruby hacker,'end
M:I-2
#----------
print [[0,'Just another Ruby hacker,'],1].first.last
#----------
{''=>'JARH'}.update(''=>'Just another Ruby hacker,').display
#----------
{:JARH => 'Just another Ruby hacker,'}.values.display
#----------
{'Just another Ruby hacker,'=>:JARH}.invert[:JARH].display
#----------
print ['Just another Ruby hacker,'=>:JARH][0].keys
#----------
print [{}].slice(0..0)[0].store('', 'Just another Ruby hacker,')
#----------
print 'Just another Ruby hacker,'.split.join(' ')
#----------
trace_var(:$KCODE){print 'Just another Ruby hacker,'};$KCODE=$KCODE
#----------
begin print 'Just another Ruby hacker,' end while false
#----------
begin rescue then else print 'Just another Ruby hacker,' end
#----------
print //.match('Just another Ruby hacker,').string
#----------
callcc{print 'Just another Ruby hacker,'}
#----------
class Foo
  def foo() print 'Just another Ruby hacker,' end
  instance_method(:foo).bind(new)[]
end
#----------
Thread.start{print'Just another Ruby hacker,'}.join
#----------
print [<<'+'.chomp,<<'+'.chomp,<<'+'.chomp,<<'+'.chomp].join(' ')
Just
+
another
+
Ruby
+
hacker,
+
#----------
('JARH'..'Just another Ruby hacker,').end.display
#----------
('Just another'..'Ruby hacker,').to_s.tr_s('.', ' ').display
#----------
unless true then else 'Just another Ruby hacker,' end.display
#----------
loop do print 'Just another Ruby hacker,'; break end
#----------
class String
  def coerce x
    print self
    [0, 0]
  end
  1 + 'Just another Ruby hacker,'
  remove_method :coerce
end
#----------
1.times do print 'Just another Ruby hacker,' end
#----------
0.upto(0) do print 'Just another Ruby hacker,' end
#----------
0.downto(0) do print 'Just another Ruby hacker,' end
#----------
#print Struct.new('Just another Ruby hacker,').to_s.split(':')[2]
print Struct.new('Just_another_Ruby_hacker').to_s.split(':')[2].tr('_',' '),','
#----------
def (x='Just another Ruby hacker,').foo() print self end; x.foo
#----------
begin print 'Just another Ruby hacker,' end until true
#----------
for i in %w[Just\  another\  Ruby\  hacker,] do print i end
#----------
'Just another Ruby hacker,'.each_byte do |x| putc x end
#----------
',rekcah ybuR rehtona tsuJ'.scan(/./).reverse_each do |x| putc x end
#----------
print Regexp.quote('Just another Ruby hacker,').delete('\\')
#----------
print true ? "Just another Ruby hacker," :-P
#----------
print true ? "Just another Ruby hacker," :-D
#----------
print *("Just another Ruby hacker,".."Just another Ruby hacker,").to_a
#----------
print eval(%<%%Just another Ruby hacker,%>)
#----------
print case when true then "Just another Ruby hacker," end
#----------
print %w[Just another Ruby hacker,] * " "
#----------
begin end if print "Just another Ruby hacker,"
#----------
print begin "Just another Ruby hacker," end
#----------
print "Just another Ruby hacker,".center(10000).strip
#----------
print "Just " or print "another " or print "Ruby " or print "hacker,"
#----------
print :"Just another Ruby hacker,"
#----------
print DATA.gets.chomp
__END__
Just another Ruby hacker,
