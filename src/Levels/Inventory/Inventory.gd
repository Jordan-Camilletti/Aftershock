extends Node2D

func _ready():
	refreshInventory()

func _input(event):#Inventory Input
	if(event.is_action_pressed("exitGame")):#Quit game
		get_tree().quit()
	if(event.is_action_pressed("openInventory")):#Go back to level
		closeInventory("res://src/Levels/LevelTest.tscn")
	if(event.is_action_pressed("clickItem")):
		var mousePos=get_global_mouse_position()
		var square=getInventorySquare(mousePos.x,mousePos.y)
		if(square>=0 and square<len(globalVars.inventoryIDs)):
			var newName=globalVars.inventoryNames[square]
			var newID=globalVars.inventoryIDs[square]
			globalVars.setHeld(newName,newID)
			globalVars.removeItem(square)
			refreshInventory()
		
func getInventorySquare(xPos,yPos):
	if(xPos>(128-(145/2)) and xPos<=(128+(145/2)) and yPos>(300-(188/2)) and yPos<=(300+(188/2))):
		return(-2)#Currently held square
	var xSquare=roundDown(xPos/256)-1
	var ySquare=roundDown(yPos/200)
	if(xSquare<0 or xSquare>=3 or ySquare<0 or ySquare>=3):
		return(-1)
	return(xSquare+(ySquare*3))
	
func clearInventoryItems():
	var node
	while(self.get_child_count()>11):
		node=self.get_children()[11]
		self.remove_child(node)
		node.queue_free()
	
func refreshInventory():
	#Clearing old items
	clearInventoryItems()
	
	#Adding back new inventory
	var add=""
	for n in range(len(globalVars.inventoryIDs)):
		#Creating a new instance based off link from inventoryID and nodeDict, then adding it to inventory square
		add=load(globalVars.getPath(globalVars.inventoryIDs[n])).instance()
		add.position.x=(256*(n%3))+384
		add.position.y=(200*(n/3))+100
		add_child(add)
	
	#Adding held object
	if(globalVars.heldID!=0):
		add=load(globalVars.getPath(globalVars.heldID)).instance()
		add.position.x=(128)
		add.position.y=(300)
		add_child(add)

func closeInventory(level):#Closing back to level
	globalVars.inventoryOpen=false
	get_tree().change_scene(level)

func roundDown(num):#Rounds down num to the nearest whole number
	var rtn=str(num).split(".")
	return(int(rtn[0]))

#TODO: work on this
func moveItem(itemID, itemName):
	pass