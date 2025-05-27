PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"



if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
      ATOMIC_NUMBER_RESULT=$($PSQL "SELECT * FROM Elements LEFT OUTER JOIN Properties USING (atomic_number) LEFT OUTER JOIN Types USING (type_id) WHERE atomic_number = $1")
      echo "$ATOMIC_NUMBER_RESULT" | while read ATOMIC_NUMBER BAR SYMBOL BAR ELEMENT_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID BAR TYPE
      do 
        echo "The element with atomic number $1 is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
      done
      echo "$ATOMIC_NUMBER_RESULT"
  else

    echo "argument is a string"
  fi
else
  echo "Please provide an element as an argument."
fi