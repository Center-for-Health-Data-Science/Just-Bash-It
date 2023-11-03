#A script to cut out a specified column
#Usage: cut_col.sh [file_name] [column_number]

cut -d ',' -f $2 $1