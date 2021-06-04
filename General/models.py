from django.contrib.auth.models import User
from django.db import models
from datetime import datetime
from django.utils import timezone

# Validators for range of integer.
from django.core.validators import MinValueValidator, MaxValueValidator

# Fridge class.
class Fridge(models.Model):
	fridge_name = models.CharField('Fridge Name', max_length=256)
	
	def __unicode__(self):
		return self.fridge_name


# General Entity, everything frozen should extend this.
class Entity(models.Model):
	name = models.CharField('Name', max_length=256)
	created_on_date = models.DateTimeField('Date Added', auto_now_add=True)
	user = models.ForeignKey(User)

	def __unicode__(self):
		return self.name


class BoxStock(models.Model):
	name = models.CharField('name', max_length=256)
	tubesAtATime = 	models.IntegerField('Number of tubes to add at a time')

	def __unicode__(self):
		return  self.name


class Box(models.Model):
	box_name = models.CharField('Box_name', max_length=256)
	created_on_date = models.DateTimeField('Date Added', auto_now_add=True)
	description = models.TextField('Description')
	fridge = models.ForeignKey(Fridge)
	columns = models.IntegerField('Number of columns')
	rows = models.IntegerField('Number of rows')

	stock = models.ForeignKey('BoxStock', null=True,blank=True)

	def __unicode__(self):
		return self.box_name


# Box association
class BoxAssociation(models.Model):
	box = models.ForeignKey('Box')
	
	row = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(10)])
	column = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(10)])
	


	def __unicode__(self):
		return  self.box.box_name + ": " + str(self.row) + "," + str(self.column)



class Instance(models.Model):
	frozen_on_date = models.DateTimeField('Date Frozen', auto_now_add=True)
	boxAssociation = models.OneToOneField('BoxAssociation')
	entity = models.ForeignKey('Entity')

	def __unicode__(self):
		return str(self.entity) + " tube"
	
'''
class Box(models.Model):
	box_name1 = models.CharField('Box Name1', max_length=256)
	stock = models.ForeignKey(BoxStock)
	created_on_date = models.DateTimeField('Date Added', default=timezone.now())
	description = models.TextField('Description')
	fridge = models.ForeignKey(Fridge)
	columns = models.IntegerField('Number of columns', default=10)
	rows = models.IntegerField('Number of rows', default=10)
	

	def toDict(self):
		return {'name' : self.box_name,'id' : self.id}




# 10x10 CryoBox
#class CryoBox(Box):
#	pass;
'''


	 





