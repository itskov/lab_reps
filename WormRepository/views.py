from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render_to_response

from WormRepository.models import WormStrain

# General python packages
import csv


# Create your views here.
def createCsvFileOfStrains(wormStrains):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=allWormStrains.csv'

    writer = csv.writer(response,delimiter=",")
    writer.writerow(['Name','Official Name','AzNumber','Origin','Made by','Is Thawed','Description'])
	
    for strain in wormStrains: 	
	strainRow = []

	print str(strain)
	strainRow.append(str(strain.name))
	strainRow.append(str(strain.officialName))
	strainRow.append(str(strain.azNumber))
	strainRow.append(str(strain.origin))
	strainRow.append(str(strain.madeBy))
	strainRow.append(str(strain.isChecked))
	strainRow.append(str(strain.description.encode('ascii','ignore')))
	
	print strainRow	
	writer.writerow(strainRow)

    return response



def exportWormStrains(request): 
    wormStrains = WormStrain.objects.order_by("azNumber")
    return createCsvFileOfStrains(wormStrains)




