#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��=keRootfsDownload.sh ��OkA���x��f'�&���PP�P�<H��l���3��IR�b��j�-=D(��*� �%�4���[�ٕR/vn��>��{o�����jP&nU�(��ܻ#��5�S�>#��gd(��Ĩ�*��[�Uu&�е*y��>�FÓ�x ��p�Kp��w�`|��?E�H����Ϣ݇�B�X���sr$o�T1�Uν��pu���z�����J��W��¢�U�<�xi�x���a��`|p�'���
�vG�`��3�GO�em>!�U�#'^�x�Q��}J��'#kԘRиeFՠ��{�)��?D�����iڌ��2�׏�s� ������E����h��*�������e�KW
إq(������2�6|'1��[�p ��H���҆'�r���l��;��Z�ԋ�� ���eK�<6KZ%MD�[����ݜ��r<嚺nÜ��.Y�+{�K���	^�e�5\訨  