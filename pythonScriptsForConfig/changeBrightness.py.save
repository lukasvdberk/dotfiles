#We hebben de maximale nodig zodat het we het percentage kunnen berekenen en dat dan vanuit onze config kunnen roepen
#Om de brightness te veranderen moet je eigenaar zijn van de brightness file standaard is dat root.
#chown past de wijzigingen alleen aan in de current session dus je moet de permissie veranderen op boot in de boot file
#In ubuntu is dat in /etc/rc.local

import sys
maxbBrightness = 416
percentageToAdd = 0
#Argument van de commandline en daar het percentage vandaan halen
if len(sys.argv) > 0:
	numberStr = sys.argv[1]
	if numberStr[0] == '-':
		percentageToAdd=int(numberStr[1:len(numberStr)])
	if numberStr[0] == '+':
		percentageToAdd=int(numberStr[1:len(numberStr)])

brightnessFile = open("/sys/class/backlight/intel_backlight/brightness", "rt")
brightness=int(brightnessFile.read())

if len(sys.argv) > 0:
	numberStr = sys.argv[1]
	percentageToAdd=int(numberStr[1:len(numberStr)])

	brightnessToAdd = 416/100*percentageToAdd

	if numberStr[0] == '-':
		brightness = brightness - brightnessToAdd

	if numberStr[0] == '+':
		brightness = brightness + brightnessToAdd

#Als de brightness hoger dan het max is wil laat intel_backlight het niet schrijven
if brightness > 416:
	brightness = 416

brightnessStr = str(int(brightness))

with open("/sys/class/backlight/intel_backlight/brightness","wt") as write:
	write.write(brightnessStr)
