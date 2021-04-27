## Made by T. ##


## Instructions: ##
echo '{!} Once you have 3 *different* coordinates, input them on this website and triangulate'
echo 'the targets approximate area: http://geo.javawa.nl/coordcalc/index_en.html'
echo ' '

echo 'Enter IP address: '
read IP
echo ' '

echo '{+} Gathering basic information...'
echo ' '
PROVIDER=$(curl -s 'https://ipapi.co/'$IP'/org/')
echo '{!} Provider found: '$PROVIDER
COUNTRY=$(curl -s 'https://ipapi.co/'$IP'/country/')
echo '{!} Country found: '$COUNTRY
REGION=$(curl -s 'https://ipapi.co/'$IP'/region/')
echo '{!} Region found: '$REGION
CITY=$(curl -s 'https://ipapi.co/'$IP'/city/')
echo '{!} City found: '$CITY
echo ' '
## Records first coordinate data to compare ##
LAT=$(curl -s 'https://ipapi.co/'$IP'/latitude/')
LON=$(curl -s 'https://ipapi.co/'$IP'/longitude/')
TESTLATLON=($LAT', '$LON)
echo '{!} First coordinates found: '$TESTLATLON

## Starts infinite loop of checking coordinate data and compares it to the first check ##
while :
do
	LAT=$(curl -s 'https://ipapi.co/'$IP'/latitude/')
	LON=$(curl -s 'https://ipapi.co/'$IP'/longitude/')
	LATLON=($LAT', '$LON)
	## Compares new data to the first check, if new coordinates have been ##
	## found they are printed to the console.			      ##
	if [ "$LATLON" != "$TESTLATLON" ]; then
		echo '{!} New coordinates found: '$LATLON
		TESTLATLON=$LATLON
		echo $TESTLATLON
		echo 'Retrying in 1 hour...'
	else
		echo 'No new coordinates, retrying in 1 hour...'
	fi
	sleep 1h
done
