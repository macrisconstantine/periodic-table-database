PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER_RESULT=$($PSQL "SELECT * FROM Elements LEFT OUTER JOIN Properties USING (atomic_number) LEFT OUTER JOIN Types USING (type_id) WHERE atomic_number = $1")
    if [[ -z "$ATOMIC_NUMBER_RESULT" ]]
    then
      echo "I could not find that element in the database."
      exit 0
    fi
  elif [[ ${#1} -gt 2 ]]
  then
    ATOMIC_NUMBER_RESULT=$($PSQL "SELECT * FROM Elements LEFT OUTER JOIN Properties USING (atomic_number) LEFT OUTER JOIN Types USING (type_id) WHERE name = '$1'")
    if [[ -z "$ATOMIC_NUMBER_RESULT" ]]
    then
      echo "I could not find that element in the database."
      exit 0
    fi
  else
    ATOMIC_NUMBER_RESULT=$($PSQL "SELECT * FROM Elements LEFT OUTER JOIN Properties USING (atomic_number) LEFT OUTER JOIN Types USING (type_id) WHERE symbol = '$1'")
    if [[ -z "$ATOMIC_NUMBER_RESULT" ]]
    then
      echo "I could not find that element in the database."
      exit 0
    fi
  fi
      echo "$ATOMIC_NUMBER_RESULT" | while read Blah Blah ATOMIC_NUMBER BAR SYMBOL BAR ELEMENT_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
      do 
       echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
else
  echo "Please provide an element as an argument."
fi