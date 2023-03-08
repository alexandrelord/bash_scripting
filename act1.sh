

echo "Your username is $USER"
echo "The current date is $(date '+%Y%m%d')"
echo "The current time is $(date '+%T')"
echo "The current working directory is $(pwd)"
echo "You have $(find . -maxdepth 1 -type f | wc -l) files in $(pwd)"
echo "The biggest file in the current directory is $(ls -lSr | grep -v drw | tail -1 | awk '{print$9}')"
