for file in tests/*;
	do if test -f "$file"
	then
		mv $file $file.$(date '+%Y%m%d')
	fi	
done;
