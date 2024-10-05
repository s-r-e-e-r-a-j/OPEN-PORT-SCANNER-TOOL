
echo ""
echo ""

GREEN='\033[0;32m'  # Green
RED='\033[0;31m'    # Red
NC='\033[0m'        # No Color (reset to default)


echo -e "$GREEN ########################$NC"
echo -e "$GREEN ########################$NC"
echo -e "$RED OPEN PORT SCANNER TOOL $NC"
echo -e "$GREEN ########################$NC"
echo -e "$GREEN ########################$NC"

echo ""
echo ""

echo "Enter the ip address"
read ipaddress
result_array=();
count=1




for port in {1..6000}
do

timeout 1  bash -c "echo > /dev/tcp/$ipaddress/$port" &> /dev/null

if [ $? -eq 0 ]; then

echo -e  "$GREEN $port is open at host $ipaddress$NC"
result_array[$count]="$port is open at host $ipaddress" 
((count++))
else

echo -e "$RED $port is closed at host $ipaddress$NC"

fi


done

echo ""
echo ""
echo ""

i=1

while((i<$count))
do

echo -e "$GREEN${result_array[$i]}$NC"

((i++))

done

