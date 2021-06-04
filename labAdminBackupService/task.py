import smtplib, os
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email.Utils import COMMASPACE, formatdate
from email import Encoders
from subprocess import call



import sys
import os
import urllib2
from datetime import date




allBoxUrl = "http://132.64.59.3:8000/services/exportAllWormBoxes/"
allStrainsUrl = "http://132.64.59.3:8000/wormrep/exportWormStrains/"

def main():
	currentDay = str(date.today())
	response = urllib2.urlopen(allBoxUrl)
	
	currentBoxesFileName = 'AllBoxesBackup-' + currentDay  + ".csv"
	allBoxexFile = open(currentBoxesFileName ,'w')
	allBoxexFile.write(response.read())
	allBoxexFile.close();	


	
	response = urllib2.urlopen(allStrainsUrl)


	currentStrainFileName = "Strains-" + currentDay + ".csv"
	allStrainsFile = open(currentStrainFileName ,'w')
	allStrainsFile.write(response.read())
	allStrainsFile.close();

	currentDbBUFileName = "DBBackup-" + currentDay + ".sql"
	print("mysqldump" + " -u root -pPassword1 lab_admin > " + currentDbBUFileName);
	os.system("mysqldump" + " -u root lab_admin -pPassword1 > " + currentDbBUFileName);

	subject = "Zaslaver's Lab Strain Backup";
	text = "Automatic weekly backup of Worms Strain directory."

	send_mail("Eyal.Itskovits@mail.huji.ac.il",["itskov@gmail.com","Yifat.Eliezer@mail.huji.ac.il ","alonzas@gmail.com"],subject,text,[currentBoxesFileName,currentStrainFileName,currentDbBUFileName],'outmail.huji.ac.il')


def send_mail(send_from, send_to, subject, text, files=[], server="localhost"):
    assert isinstance(send_to, list)
    assert isinstance(files, list)

    msg = MIMEMultipart()
    msg['From'] = send_from
    msg['To'] = COMMASPACE.join(send_to)
    msg['Date'] = formatdate(localtime=True)
    msg['Subject'] = subject

    msg.attach( MIMEText(text) )

    for f in files:
        part = MIMEBase('application', "octet-stream")
        part.set_payload( open(f,"rb").read() )
        Encoders.encode_base64(part)
        part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(f))
        msg.attach(part)

    smtp = smtplib.SMTP(server)
    smtp.sendmail(send_from, send_to, msg.as_string())
    smtp.close()


if (__name__ == '__main__'):
	main()
