read x
read y
read z
if [[ x -eq y ]] && [[ y -eq z ]]
then
    echo "EQUILATERAL"
elif [[ x -ne y ]] && [[ y -ne z ]] && [[ z -ne x ]]
then
    echo "SCALENE"
else
    echo "ISOSCELES"
fi