import urllib2
from time import sleep

pictureVal = 0
ip_of_rovio = '192.168.10.18'
save_file_path = 'C:\Rovio\\'
delay_between_image = 50 #ms

def downloadImage(pictureName):
    global ip_of_rovio
    global save_file_path
    url = 'http://'+ip_of_rovio+'/Jpeg/CamImg0000.jpg'
    request = urllib2.Request(url)
    pic = urllib2.urlopen(request)
    filePath = save_file_path + str(pictureName) + '.jpg'
    with open(filePath, 'wb') as localFile:
        localFile.write(pic.read())

def main():
    global pictureVal
    global delay_between_image
    pictureVal += 1
    downloadImage(pictureVal)
    sleep(delay_between_image/1000)

while True:
    main()