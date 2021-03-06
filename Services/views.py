from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt

from General.models import Box
from General.models import Entity
from General.models import Instance
from General.models import BoxStock
from General.models import BoxAssociation

# Specific worm imports
from WormRepository.models import WormStrain

# General python packages
import csv
import re
import sys


def editBox(request, boxId, entityId):
	pass;
	

def updateBoxes(request, entityId):
	entityId = int(entityId)
	# Get all boxes
	allBoxes = Box.objects.all();
	entityBoxes = [];
	if (entityId != -1):
		# Get Boxes that contain this entity.
		currentEntity = Entity.objects.filter(id=entityId)[0]
		allInstances = currentEntity.instance_set

		for instance in allInstances.all():
			entityBoxes.append(instance.boxAssociation.box)

		# Getting rid of duplicates

			
		print("Before: " + str(entityBoxes))
		entityBoxes = list(set(entityBoxes))
		print("After: " + str(entityBoxes))

	return render_to_response('updateBoxes.html',{'entityBoxes' : entityBoxes, 'allBoxes' : allBoxes, 'entityId' : entityId});

@csrf_exempt
def submitBox(request, boxId, entityId):
	# First we fetch the box to see its measurements.
	currentBox = Box.objects.filter(id=boxId)[0];

	# We iterate over all the cells that have changes
	cellsChangesDict = request.POST;	
	print(cellsChangesDict)

	# Regular expression for cell name
	pat = re.compile('cell(\d+)');


	for cellName in cellsChangesDict.keys():
		print(cellName)
		cellIndexNumber = pat.match(cellName).group(1)
		
		cellRowPos = int(cellIndexNumber) / currentBox.columns
		cellColumnsPos = int(cellIndexNumber) % currentBox.columns

		print("Cords: " + str(cellRowPos) + "," + str(cellColumnsPos))
		# Getting current instance at the given cell.
		currentBoxAssociation = BoxAssociation.objects.filter(box__id=boxId,instance__entity__id=entityId, row=cellRowPos,column=cellColumnsPos)
		print("Found: " + str(currentBoxAssociation))
		if (cellsChangesDict[cellName] == '0'):
			if (len(currentBoxAssociation) == 1):
				currentBoxAssociation[0].instance.delete()
				currentBoxAssociation[0].delete()
			elif (len(currentBoxAssociation) > 1):
				print("Error: duplicated candidate for deletion in box association.")

		elif (cellsChangesDict[cellName] == '1'):
			if (len(currentBoxAssociation) == 0):
				# Creating a new box association
				newBa = BoxAssociation();
				newBa.box_id = int(boxId);
				newBa.row = cellRowPos;
				newBa.column = cellColumnsPos;
				newBa.save()
				print("Created a new BoxAssociation: " + str(newBa));
				print(str(newBa.id))

				# Creating a new instance
				print("newIns params: " + str(newBa.id) + " , " + str(entityId))
				newIns = Instance() 
				newIns.boxAssociation_id = newBa.id
				newIns.entity_id = int(entityId)
				newIns.save()
				#print("Created a new BoxAssociation: " + str(newIns));				

	return HttpResponse("Hey");

def createCsvByBoxIds(boxIds,response):
    for boxId in boxIds: 	
	    # Get Box object for box name
	    currentBox = Box.objects.filter(id=boxId)[0];
	
	    # Get Box Matrix
	    boxMatrix = getBoxMatrix(boxId)

	    writer = csv.writer(response)
	    writer.writerow([currentBox.box_name, ''])		
	    for tubesRow in boxMatrix:
		azNumbers = []
		for tube in tubesRow: 
			tubeId = tube[0]
		
			if (tubeId != -1):
				entity = WormStrain.objects.filter(entity_ptr_id = int(tube[0]))[0]
				azNumbers.append('AZ' + str(entity.azNumber))
			else:
				azNumbers.append('__')
		
	    	writer.writerow(azNumbers)

	    writer.writerow([])
	    writer.writerow([])

    return response
	

def exportWormBox(request,boxId):
    try:
	    response = HttpResponse(content_type='text/csv')
	    response['Content-Disposition'] = 'attachment; filename=box' + str(boxId) + '.csv'

	    response = createCsvByBoxIds([boxId],response)	
    except:
    	print("Unexpected error:", sys.exc_info()[0])
    	raise

    return response

def exportAllWormBoxes(request):
    
    try:
	    response = HttpResponse(content_type='text/csv') 
	    response['Content-Disposition'] = 'attachment; filename=allWormBoxes.csv'
	
	    allBoxes = Box.objects.all();
	    allBoxesIds = [b.id for b in allBoxes]
	    response = createCsvByBoxIds(allBoxesIds,response)	
    except:
    	print("Unexpected error:", sys.exc_info()[0])
    	raise

    return response
	

def translateEntityIdToName(entityId):
	return Entity.objects.filter(id=entityId)[0].name;
	

def getBoxMatrix(boxId):
	currentBox = Box.objects.filter(id=boxId)[0];
	
	rows = currentBox.rows
	columns = currentBox.columns

	boxMatrix = [[ [-1,"Empty","   ", "cell"+str(c+r*columns)] for c in xrange(columns)] for r in xrange(rows)]

	# Getting all the associations.
	currentAssociations = BoxAssociation.objects.filter(box__id=boxId)

	for bAss in currentAssociations:
		boxMatrix[bAss.row][bAss.column][0] = bAss.instance.entity.id
		boxMatrix[bAss.row][bAss.column][1] = translateEntityIdToName(bAss.instance.entity.id)

		wormStrain = WormStrain.objects.filter(entity_ptr__id=bAss.instance.entity.id)[0]
		boxMatrix[bAss.row][bAss.column][2] = "AZ" + str(wormStrain.azNumber);

	return boxMatrix;
	


def updateBox(request,boxId, entityId):
	currentEntity = Entity.objects.filter(id=entityId)[0];
	
	boxMatrix = getBoxMatrix(boxId);
			
	
	return render_to_response('updateBox.html',
				  {'boxMatrix' : boxMatrix,'entityId' : int(entityId),'entityName' :currentEntity.name });


# This 
def getBoxesList(request,entityId):
	entityId = int(entityId)
	# Get all boxes
	boxes = []
	if (entityId == -1):
		boxes = allBoxes = Box.objects.all();
	else:
		# Get Boxes that contain this entity.
		currentEntity = Entity.objects.filter(id=entityId)[0]
		allInstances = currentEntity.instance_set
	
		for instance in allInstances.all():
			boxes.append(instance.boxAssociation.box)

	jsonStr = ""
	for box in boxes:
		jsonStr = jsonStr + "{'" + box.box_name + "':'" + str(box.id) + "'},"

	return HttpResponse("[" + jsonStr + "]")

def showInitializeStrain(reqeust, entityId):
	boxStocks = BoxStock.objects.all()
	entity = Entity.objects.filter(id=entityId)[0]
	
	# Stocks names
	stocksNames = [bs.name for bs in boxStocks]
	stocksIds = [bs.id for bs in boxStocks]

	print(stocksNames)
	print(stocksIds)

	# Getting the number of boxes in each stock
	boxsInStocks = [];
	for id in stocksIds:
		currentBoxsInStocks = [b.box_name for b in Box.objects.filter(stock_id=id)]
		boxsInStocks.append(tuple(currentBoxsInStocks));
	

	data = zip(stocksIds, stocksNames,boxsInStocks);
	print(data);
	
	return render_to_response('initializeStrain.html', {'data' : data, 'entityId' : entityId,'entityName':entity.name});
	
@csrf_exempt
def initializeWormStrain(request,entityId):
	print("Dict:" + str(request.POST))
	results = [];

	persumedBoxSize = 100
	persumedRows = 10
	persumedColumns = 10

	# Stock dictionary
	stocksDic = request.POST;

	# First we get the AZNum
	wormStrain = WormStrain.objects.filter(entity_ptr__id=entityId)[0];
	
	# Get the AZ number.
	azNum = wormStrain.azNumber - 1;

	print('AzNum:' +str(azNum))

	for stockId in stocksDic.keys():
		boxesInStock = Box.objects.filter(stock__id=stockId).order_by("created_on_date")
		currentStock = BoxStock.objects.filter(id=stockId)[0]

		if (len(boxesInStock) == 0):
			continue;

		print("StockDic" + str(stocksDic))
		if (stocksDic[stockId] == '0'):
			continue;

		# Getting the first stock.
		currentStock = BoxStock.objects.filter(id=stockId)[0];
	
		# Positioning of the tubes
		startPoint = azNum * int(currentStock.tubesAtATime)
		print("Test: " + str(stocksDic[stockId]))
		tubesRange = xrange(startPoint,(startPoint + currentStock.tubesAtATime))

		# Getting the box number (Persumes there are 10x10 cells in a box).
		for pos in tubesRange:
			print("Inside stocks loop")

			boxNum = pos / persumedBoxSize;
			
			
			if ((boxNum + 1) > len(boxesInStock)):
				err = "Error: no place for tube %d in stock %d. Add boxes." % (pos-startPoint + 1, int(stockId) + 1,)
				results.append(err)
				continue
			
			placeInBox = pos % persumedBoxSize;
			row = placeInBox / persumedColumns
			col = placeInBox % persumedColumns

			# Checking if the position is already taken.
			tubePlaces=BoxAssociation.objects.filter(box__id=boxesInStock[boxNum].id,row=row,column=col)


			if (len(tubePlaces) > 0):
				print(tubePlaces)
				results.append("Error: There's a tube in box pos %d in box %d of stock %d" %  (pos + 1, boxNum + 1,int(stockId) + 1))
				continue
			
			# Adding the tube.
			# Creating a new box association
			newBa = BoxAssociation();
			newBa.box_id = int(boxesInStock[boxNum].id);
			newBa.row = row;
			newBa.column = col;
			newBa.save()
			print("Created a new BoxAssociation: " + str(newBa));
			print(str(newBa.id))

			# Creating a new instance
			print("newIns params: " + str(newBa.id) + " , " + str(entityId))
			newIns = Instance() 
			newIns.boxAssociation_id = newBa.id
			newIns.entity_id = int(entityId)
			newIns.save()		
		
		
	results.append("Done.")
	print(results);
	return HttpResponse("<BR>".join(results));
	
		
	
