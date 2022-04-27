
initial=1
times=20
sleepTime=5

echo "This script will vote $times times"

while [ $initial -le $times ]
do
  echo "****************************** S T A R T *************************************"

  echo "scroll to the top of the screen"
  adb shell input swipe 200 200 400 500

  echo "voting $initial number will start now"

  echo "wait for loading 1"
  sleep $(( RANDOM % (10 - 5 + 1 ) + 5 ))

  echo "selecting Scooby Doo"
  adb shell input tap 300 2094

  echo "wait for loading 2"
  sleep $sleepTime

  adb shell input swipe 500 1000 300 300

  echo "wait for loading 3"
  sleep 3

  echo "Pretending, I am not a Robot, Stupid Machine haha"
  adb shell input tap 217 671

  echo "wait for loading 4"
  sleep 8

  echo "scroll screen to the top after voting"
  adb shell input swipe 200 200 400 500

  echo "wait for loading 5"
  sleep $sleepTime

  echo "save screenshot"
  (( t = ${EPOCHREALTIME/./} / 1000 ))
  adb exec-out screencap -p > screen_$t.png

  echo "Click on Vote Again"
  adb shell input tap 539 910

  echo "wait for loading 6"
  sleep 3

  initial=$(( initial+1 ))
  echo "******************************* E N D **************************************"
done
