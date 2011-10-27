#!/bin/sh
# flycheck_latex.sh
# Created Thu May 22 2008 by IKEGAMI Daisuke ikegami@madscientist.jp

real_file_name=$@
file_name=`basename "$real_file_name"`
tmp_file=`mktemp`
tmp_dir=`mktemp -d`
fake_name="$tmp_dir/$file_name"

# assumed that the source code has EUC-JP encoding
cat "$real_file_name" | nkf -e | kakasi -ieuc -Ha -Ka -Ja -Ea -ka > "$tmp_file"

mkdir -p $tmp_dir
cp $tmp_file $fake_name
chktex -g0 -r -l ~/.chktexrc -I1 -q -v0 $fake_name

# clean up
rm -fr "$tmp_file"
rm -fr "$tmp_dir"
