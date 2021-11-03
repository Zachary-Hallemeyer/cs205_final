# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ======= END SUMMARY =======

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

#!/bin/bash

FILE=$1;
NUMBER_OF_POKEMON=$(awk 'BEGIN {sum=0}  {sum+=1} END {print sum-1}'  $FILE);
TOTAL_HP=$(awk 'BEGIN {sum=0}  {sum+=$6} END {print sum}' $FILE);
TOTAL_ATTACK=$(awk 'BEGIN {sum=0}  {sum+=$7} END {print sum}' $FILE);

echo ======= SUMMARY OF POKEMON.DAT ======
echo    Total Pokemon: $NUMBER_OF_POKEMON
echo    Avg. HP: $(awk -v HP=$TOTAL_HP -v numPokemon=$NUMBER_OF_POKEMON 'BEGIN { print  ( HP / numPokemon ) }')
echo    Avg. Attack: $(awk -v attack=$TOTAL_ATTACK -v numPokemon=$NUMBER_OF_POKEMON 'BEGIN { print  ( attack / numPokemon ) }')
echo ======= END SUMMARY =======
