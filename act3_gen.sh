# lottery numbers btween 1 and 50
# bonus number between 1 and 10
# script should pick 5 numbers and 1 bonus number
# no repeating numbers (except for bonus)
# output the numbers to a file that has the date in its name

LOTTO_FILE=lotto_numbers.$(date '+%Y%m%d')

shuf -i 1-50 -n 5 -o $LOTTO_FILE
shuf -i 1-10 -n 1 >> $LOTTO_FILE

