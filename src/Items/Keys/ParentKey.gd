extends Item
class_name ParentKey

func _ready():
	pass

func _on_Item_body_entered(_body):#When player collides with key
	if(self.get_parent().get_name()!="Player"):#Player can't pick up their held item
		globalVars.addToInventory(get_name(),get_ID())
		queue_free()
