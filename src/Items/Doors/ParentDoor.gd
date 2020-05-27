extends Item
class_name ParentDoor

var open=false#State of the door
var openSprite#Sprite for the open door
var closedSprite#Sprite for the closed door

func _ready():
	pass

func getOpen():
	return(open)
	
func setOpen(o):#Changing state and sprite
	open=o
	setSprite()
	
func setSprite():#Swaping the door's state
	if(open):#Set sprite to open
		Sprite.set_texture=openSprite
	else:#Set sprite to close
		Sprite.set_texture=closedSprite
