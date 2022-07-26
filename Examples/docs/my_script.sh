cut -f 3 -d ',' patients.dat | sort | uniq -c
head -n 1 patients.dat > herlev.dat
grep 'Herlev' patients.dat | sort -n -k 5 -t ',' >> herlev.dat
