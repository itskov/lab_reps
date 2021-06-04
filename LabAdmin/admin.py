from django.contrib import admin
from django.contrib.auth.models import User
from django.db.models import Max

from General.models import Fridge
from General.models import Box
from General.models import BoxStock
from General.models import Instance
from General.models import BoxAssociation
from WormRepository.models import WormStrain
from WormRepository.models import WormStrainInstance

from WormRepository.views import createCsvFileOfStrains

class WormStrainAdmin(admin.ModelAdmin):
	list_display = ('name','origin','formattedAZnum','created_on_date','isChecked','instancesCount','instances',)
	list_filter = ('created_on_date','user','isChecked','origin')
	search_fields = ('name','azNumber','description','officialName')
	ordering = ('azNumber',)
	list_per_page = 20

	def save_model(self, request, obj, form, change):
	        # custom stuff
        	obj.save()

	def instances(self, obj):
		print(obj.entity_ptr );
		print(obj.entity_ptr.id );
		url1 = "../../../services/updateBoxes/" + str(obj.entity_ptr.id);
		url2 = "../../../services/showInitializeStrain/" + str(obj.entity_ptr.id);
		
		return '<button onclick="window.open(\'' + url1 +'\')">Change tubes</button> \
			<button onclick="window.open(\'' + url2 +'\')">Initialize tubes</button>'
        	
	instances.allow_tags = True
        instances.short_description = 'Instances'

	def instancesCount(self,obj):
		insList = Instance.objects.filter(entity__id=obj.id);
		return len(insList);

	instancesCount.short_description="Number of tubes"

	def formattedAZnum(self,obj):
		return "AZ" + str(obj.azNumber);
	
	formattedAZnum.short_description="AZNum"

	def save_model(self, request, obj, form, change):
        	# custom stmptyuff here
		if (obj.azNumber == None):
			maxAgg = WormStrain.objects.all().aggregate(Max('azNumber'));
			obj.azNumber = (maxAgg['azNumber__max'] + 1) if (maxAgg['azNumber__max'] != None) else 1;

        	obj.save()


	# New printint action
	def printStrains(modeladmin, requset, queryset):
		return createCsvFileOfStrains(queryset.all());

	printStrains.short_description = "Print marked strains"

	# Setting the printing action
	actions = [printStrains]



# Register your models here.
admin.site.register(WormStrain,WormStrainAdmin)
admin.site.register(Fridge)
admin.site.register(Instance)
admin.site.register(Box)
admin.site.register(WormStrainInstance)
admin.site.register(BoxAssociation)
admin.site.register(BoxStock)
