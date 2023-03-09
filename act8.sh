NUMS=()
INT_REGEX='[^0-9]'
PRODUCT=1
SUM=0

echo "Please enter 5 to 10 positive integers"

for i in {1..10}; do
   
   if [ $i -le 5 ]; then
      echo "Please enter integer $i"
      read number
      while [[ $number =~ $INT_REGEX ]]; do
         echo "You did not enter an integer"
         echo "Please enter integer $i"
         read number
      done
      NUMS+=($number)
   fi
   
   if [ $i -gt 5 ]; then
      echo "Would you like to add another number? [y/n]"
      read answer
      if [ $answer == y ]; then
         echo "Please enter integer $i"
         read number
      else 
         break
      fi
      while [[ $number =~ $INT_REGEX ]]; do
         echo "You did not enter an integer"
         echo "Please enter integer $i"
         read number
      done
      NUMS+=($number)
   fi
done
  
MAX=${NUMS[0]}
MIN=${NUMS[0]}
 
for i in "${NUMS[@]}"; do
  (( PRODUCT*=$i ))
  (( SUM+=$i ))
   
  if [ $i -gt $MAX ]; then
      MAX=$i;
  fi
  
  if [ $i -lt $MIN ]; then
      MIN=$i;
  fi    
done

AVERAGE=$(awk -v sum="$SUM" -v len="${#NUMS[@]}" 'BEGIN {print sum/len}')

echo "Your numbers are ${NUMS[*]}"
echo "Product: $PRODUCT"
echo "Sum: $SUM"
echo "Average: $AVERAGE"
echo "Max Value: $MAX"
echo "Min Value: $MIN"
