#!/bin/bash
echo -e "\nPlease provide an element as an argument.\n"
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

ELEMENT=$($PSQL "SELECT E.atomic_number,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements E INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE E.atomic_number=$1 OR symbol='$1' OR name='$1'")

if [[ -z $ELEMENT ]]
then
 echo -e "\nI could not find that element in the database."
else
 echo $ELEMENT
fi