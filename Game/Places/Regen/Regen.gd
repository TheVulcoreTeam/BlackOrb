extends GPlace

var area_obj
var heal_points = 2

func _ready():
	# Signals.connect("",self, "_heal_active")
	# add _heal_active to endturn event
	pass

func _heal_active():
	if area_obj != null:
		area_obj.data.heal(heal_points)

func _on_Place_area_entered(area):
	area_obj = area.get_parent().get_parent()

func _on_Place_area_exited(area):
	area_obj = null
