from django.db import models
from django.contrib.auth.models import User
from datetime import datetime

from General.models import Entity
from General.models import Instance
from General.models import Box

# Create your models here.


ORIGIN = (
	(0, 'Lab'),
	(1, 'CGC'),
	(2, 'SterenbergLab'),
	(3, 'Other')
	)


class WormStrain(Entity):
	origin = models.IntegerField('Origin of strain',choices=ORIGIN)
	azNumber = models.IntegerField('AZNum', unique=True, blank=True)
	madeBy = models.CharField('Made By', max_length=256, blank=True)
	officialName = models.CharField('Official Name', max_length=256, blank=True)
	isChecked = models.BooleanField('Is Thawed')
	description = models.TextField('Description')
	




class WormStrainInstance(Instance):
	def __unicode__(self):
		return str(self.entity) + " tube"
	


	


