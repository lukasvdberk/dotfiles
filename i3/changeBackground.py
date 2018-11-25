import random
import os
from time import sleep

while True:
	picNumber = random.randint(100,600)
	os.system("feh --bg-scale https://picsum.photos/1920/1080/?image={}".format(str(picNumber)))
	sleep(60)
