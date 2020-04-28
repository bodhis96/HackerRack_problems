read expression
value=$(echo "scale = 4; $expression" | bc)
printf "%.3f" $value