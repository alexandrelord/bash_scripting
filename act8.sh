NUMS=()
RED='\033[0;31m'
NC='\033[0m'

function prompt_input () {
   read -p "Enter an integer: " num
   while [[ ! $num =~ ^-?[0-9]+$ ]]; do
      echo -e "${RED}Invalid input${NC}"
      read -p "Enter an integer: " num
   done
   NUMS+=($num)
}

function prompt_add_input () {
   read -p "Add integer? [y/n]: " yesno
   if [[ ! $yesno =~ y ]]; then
      return 1
   fi
   prompt_input
} 

for i in {1..10}; do  
   if [ $i -le 5 ]; then
      prompt_input
   fi
   
   if [ $i -gt 5 ]; then
      prompt_add_input || break
   fi
done

PRODUCT=1
SUM=0
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
