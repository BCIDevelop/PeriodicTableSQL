#!/bin/bash
echo -e "\nPlease provide an element as an argument.\n"
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

read USER_INPUT

ELEMENT=$($PSQL "SELECT E.atomic_number,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements E INNER JOIN properties USING(atomic_nunber) INNER JOIN types USING(type_id) WHERE E.atomic_number=$USER_INPUT OR symbol='$USER_INPUT' OR name='$USER_INPUT'")
echo $ELEMENT