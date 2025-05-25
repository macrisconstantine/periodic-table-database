PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"



if [[ $1 == "" ]]
then
  echo "Please provide an element as an argument."
else
  echo ""
fi