PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
      ATOMIC_NUMBER_RESULT=$($PSQL "SELECT * FROM Elements LEFT OUTER JOIN Properties USING (atomic_number) WHERE atomic_number = $1")
      echo "$ATOMIC_NUMBER_RESULT" | WHILE read ATOMIC_NUMBER BAR SYMBOL BAR ELEMENT_NAME BAR ATOMIC_MASS BAR 
  else
    echo "argument is a string"
  fi
else
  echo "Please provide an element as an argument."
fi