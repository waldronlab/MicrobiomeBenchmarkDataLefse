## Script for running lefse

lefse_format_input.py gingivalplaque.txt gingivalplaque.in -c 1 -s -1 -u 2 -o 1000000 
#lefse_format_input.py gingivalplaque.txt gingivalplaque.in -c 1 -s 2 -u 3 -o 1000000 
## -c which row use for class labels (conditions)
## -s Which row use for subclass labels (cofounder)
## -u which row use for subject labels (samples)

i=1
ath=0.01
wth=0.01
ldath=3

rm -rf *res

while [ "$i" -le 10 ]
do
    bp=$(( 30 + ("$i" * 10 )))
    echo Running iteration "$i" with bootstrap "$bp"...
    lefse_run.py -a "$ath" -w "$wth" -l "$ldath" -b "$bp" gingivalplaque.in gingivalplaque\_a"$ath"\_w"$wth"\_lda"$ldath"\_it"$i"\_bp"$bp".res
    i=$(( $i + 1 ))
done
