#!/bin/sh

trap 'rm -f btest.[cho] btest btest.exe' 0 1 2 15

srcdir=`expr $0 : '\(.*\)/.*' '|' .`

# check option
for option
do
  case "$option" in
  --*=*)
    eval "`echo \"$option\" | sed 's/--\(.*\)=\(.*\)/\1=\"\2\"/'`";;
  --*)
    eval "`expr \"$option\" : '--\(.*\)'`=yes";;
  esac
done

# check true srcdir
if test -f ${srcdir}/inits.c; then
  :
else
  echo "run `basename $0` with --srcdir"
  exit 1
fi

# test only
case "$test" in
on|yes|1)
  sed "s/miniruby/bareruby/;s:Dir\[\":Dir[\"${srcdir}/:" ${srcdir}/sample/test.rb >test.rb
  ./bareruby test.rb >test.log
  exit $?;;
esac

# execute yacc
if test -n "${yacc}"; then
  ${yacc} ${srcdir}/parse.y
  mv y.tab.c parse.c
fi

# check gcc
if test -z "${CC}"; then
  echo 'main(){}' >btest.c
  if gcc -c btest.c -o btest.o; then
    CC=gcc
  else
    CC=cc
  fi
fi

: ${CPP="${CC} -E"}
: ${LIBS=-lm}

cat >btest.h <<'+'
#define RUBY_PLATFORM "unknown-unknown"

#define DLEXT ".so"
#define GETGROUPS_T int
#define TOKEN_PASTE(x,y) x##y
#define RETSIGTYPE void

#define HAVE_GETCWD 1
#define HAVE_MKDIR 1

#define RUBY_SITE_LIB2 ""
#define RUBY_SITE_ARCHLIB ""
#define RUBY_SITE_LIB ""
#define RUBY_LIB ""
#define RUBY_ARCHLIB ""

#define __CHECKER__ 1
+

cat >btest.c <<'+'
int
main()
{
  if (-1==(-1>>1))
    return 0;
  return 1;
}
+
${CC} ${CFLAGS} -o btest btest.c
if test x"$RSHIFT_SIGN" = xyes || ./btest; then
  echo '#define RSHIFT(x,y) ((x)>>(int)y)' >>btest.h
else
  echo '#define RSHIFT(x,y) (((x)<0) ? ~((~(x))>>y) : (x)>>y)' >>btest.h
fi

cat >btest.c <<'+'
#ifndef __MINGW32__
 #error not support MinGW
#endif
+
if ${CPP} ${CPPFLAGS} btest.c >/dev/null 2>&1; then
  mingw=1
  cat >>btest.h <<'+'
#define NT 1
#define HAVE_WAITPID 1
#define HAVE_STDARG_PROTOTYPES
+
fi

headers='
direct
dirent
fcntl
ndir
stdlib
string
unistd
sys/dir
sys/ndir
sys/param
sys/time
'
for i in ${headers}
do
  echo "#include <${i}.h>" >btest.c
  if ${CPP} ${CPPFLAGS} btest.c >/dev/null 2>&1; then
    echo Found "<${i}.h>"
    echo "#define HAVE_`echo ${i} |tr 'a-z/' 'A-Z_'`_H 1" >>btest.h
  fi
done

types='
int
short
long/long
long
__int64
void*
float
double
'

for i in ${types}
do
  i=`echo ${i} | tr / ' '`
  name=SIZEOF_`echo "${i}" |tr 'a-z* ' 'A-ZP_'`
  eval "size=`echo '$''{'${name}-unset'}'`"
  if test ${size} != unset; then
    echo "#define ${name} ${size}" >>btest.h
    echo "sizeof(${i}): (cached) ${size}"
  else
    echo "main(){printf(\"%d\\n\", sizeof(${i}));}" >btest.c
    size=0
    if ${CC} ${CFLAGS} -o btest btest.c >/dev/null 2>&1;then
      size=`./btest 2>/dev/null`
    fi
    echo "#define ${name} ${size}" >>btest.h
    echo "sizeof(${i}): ${size}"
  fi
done

echo '#define HAVE_STDARG_PROTOTYPES 1' >>btest.h
echo '#define WNOHANG 1' >>btest.h
echo '#ifdef __OpenBSD__' >>btest.h
echo '#define HAVE_OFF_T 1' >>btest.h
echo '#endif' >>btest.h

if cmp config.h btest.h >/dev/null 2>&1; then
  :
else
  echo Replaced config.h
  mv btest.h config.h
fi

cp ${srcdir}/inits.c btest.c
cat >>btest.c <<'+'
int ReadDataPending(){ return 0; }
int sigmask(){ return 0; }
int sigsetmask(){ return 0; }
int sigblock(){ return 0; }
/*int strftime(){ return 0; }*/
+

if cmp bareinits.c btest.c >/dev/null 2>&1; then
  :
else
  echo Replaced bareinits.c
  mv btest.c bareinits.c
fi

if test -f bgc.c; then
  :
else
  sed 's/^# define STACK_LEVEL_MAX 655300/# define STACK_LEVEL_MAX 0x10000/' ${srcdir}/gc.c >bgc.c
fi

sources='
array
bignum
class
compar
dir
dln
dmyext
enum
error
eval
file
bgc
hash
bareinits
io
main
marshal
math
numeric
object
pack
parse
prec
process
random
range
re
regex
ruby
signal
sprintf
st
string
struct
time
util
variable
version 
'

missing=`cd ${srcdir}/missing; ls *.c |egrep -v 'mkdir|os2|strftime|x68.c' |sed 's/\.c$//'`

if test x${mingw} = x1; then
  sources="${sources} win32"
  CPPFLAGS="${CPPFLAGS} -I${srcdir}/win32"
  LIBS=-lwsock32
fi

objects=`echo ${sources} ${missing} |sed 's/\([^ ][^ ]*\)/_\1.o/g'`

for i in ${sources} ${missing}
do
  if test -f ${i}.c; then
    src=${i}
  elif test -f ${srcdir}/${i}.c; then
    src=${srcdir}/${i}
  elif test -f ${srcdir}/missing/${i}.c; then
    src=${srcdir}/missing/${i}
  elif test -f ${srcdir}/win32/${i}.c; then
    src=${srcdir}/win32/${i}
  else
    echo "${i}.c not found"
    exit 1
  fi

  if ls -t ${src}.c _${i}.o config.h 2>&1 |head -1 |grep -qv '\.o$'; then
    cmd="${CC} -I. -I${srcdir} ${CPPFLAGS} ${CFLAGS} -c -o _${i}.o ${src}.c"
    echo ${cmd}
    ${cmd} || exit $?
  fi
  src=''
done

if test $? = 0; then
  cmd="${CC} ${CFLAGS} -o bareruby ${objects} ${LIBS}"
  echo ${cmd}
  $cmd
fi
