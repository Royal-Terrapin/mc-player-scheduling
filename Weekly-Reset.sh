source config.txt
source dynamic.txt

for PLAYER in ${PLAYERS[@]}
do
  TIMEPLAYED=TIMEPLAYED_$PLAYER
  declare $TIMEPLAYED=0
# the player hasn't played at all this week
  LIMITMET=LIMITMET_$PLAYER
  declare $LIMITMET=0
# the player hasn't met their limit
  declare -p $TIMEPLAYED >> dynamic.txt
  declare -p $LIMITMET >> dynamic.txt
# save these values for later
done
