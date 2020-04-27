# *** FOR LOPP *** 
for ((i=1; i<100; i+=2));
do
    echo "$i"
done

# *** WHILE LOOP ***
i=1
while [ $i -lt 100 ]
do
    echo "$i"
    i=$(( i+2 ))
done

# *** UNTIL LOOP ***
i=1
until [ ! $i -lt 100 ]
do
    echo "$i"
    i=$(( i+2 ))
done