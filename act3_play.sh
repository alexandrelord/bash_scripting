# run generator number
# prompt user to enter 5 nums and 1 bonus num
# check if users' nums match gen lottery nums

# run script to generate random lotto numbers
./act3_gen.sh

WINNING_NUMS=lotto_numbers.$(date '+%Y%m%d')
MATCH_COUNT=0


echo "Welcome to your local lotto!!"
echo "You will choose 5 numbers and a bonus one"
# cat $WINNING_NUMS

for i in {1..6}; do
   if [ $i == 6 ]; then
      echo "Please choose your bonus number"
      read number
      MATCH=$(tail -1 $WINNING_NUMS  | grep -cw $number)
   else
      echo "Please choose your #$i choice"
      read number
      MATCH=$(head -5 $WINNING_NUMS  | grep -cw $number)  
   fi
   
   if [ $MATCH == 1 ]; then
      (( MATCH_COUNT++ ))
   fi
done

echo "You have $MATCH_COUNT matches!"
echo "The winning numbers were" $(cat $WINNING_NUMS)
