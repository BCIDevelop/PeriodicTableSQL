#!/bin/bash
if [[ $1 ]]
then

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"
ELEMENT=$($PSQL "SELECT E.atomic_number,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol FROM elements E INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE E.atomic_number=$1 OR symbol='$1' OR name='$1'")

if [[ -z $ELEMENT ]]
then
 echo -e "\nI could not find that element in the database."
else
 
 IFS='|' read ID NAME TYPE ATOMIC_MASS MELTING BOILING SYMBOL <<< $ELEMENT
 echo "The element with atomic number 1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
fi
else 
  echo Please provide an element as an argument.
fi