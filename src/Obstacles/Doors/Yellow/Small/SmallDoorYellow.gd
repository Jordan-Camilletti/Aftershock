extends ParentDoor

func _ready():
	key=102#Yellow key
	openSprite=load("res://assets/Doors/Yellow/Small/open.png")
	closedSprite=load("res://assets/Doors/Yellow/Small/closed.png")
	itemName="SmallDoorYellow"
	itemID=206
	setSprite()
