#!/bin/bash
set -e


usage(){
 echo "Error $errcode $errorcode at line ${BASH_LINENO[0]} while executing: $BASH_COMMAND"
 exit $errorcode  
}
trap usage ERR

for i in $(svn ls -R .); do
	file="$i"

	if [ -d $file ]
	then
		continue
	fi

	[ -f "$file" ] # must be a file


	url=$(svn info "$file" | grep '^URL' | awk  '{print $2}')
	root=$(svn info "$file" | grep '^Working Copy Root' | awk -F':' '{print $2}')
	rev=$(svn info "$file" | grep '^Revision' | awk -F':' '{print $2}')

	name="$(basename $url)"
	dir="$(dirname $url)"

	tmp="$(mktemp -d .tmp.XXX)"


	#echo "Doing fresh checkout for: $name"
	#echo "     URL: $dir"
	#echo "    dest: $tmp"
	#echo "     rev: $rev"

	svn co -N -r $rev "$dir" "$tmp" >> /dev/null
	hash=$(cd "$tmp" && sha1sum "$name" | awk '{print $1}')
	corrupt=$(find ${root}/.svn/pristine -name $hash.svn-base)
	svnbase=$(find ${tmp}/.svn/pristine -name $hash.svn-base) 

	corrupt_sum=$(md5sum "$corrupt" | awk '{print $1}')
	svnbase_sum=$(md5sum "$svnbase" | awk '{print $1}')

	if [[ "$corrupt_sum" != "$svnbase_sum" ]]
	then
	  echo "$file is corrupt"
	fi 

	rm -rf "$tmp"
done
