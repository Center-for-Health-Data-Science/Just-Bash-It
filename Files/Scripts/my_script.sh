head -n 1 patients.txt > herlev.dat
grep 'Herlev' patients.txt | sort -n -k 5 -t ',' >> herlev.dat
