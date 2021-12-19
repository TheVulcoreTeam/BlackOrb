extends GPlace

var area_obj
var heal_points = 2

func _ready():
	Signals.connect("end_turn",self,"_on_end_turn")

func _on_end_turn(enum_turn):
	if area_obj != null:
		area_obj.data.heal(heal_points)

func _on_Place_area_entered(area):
	area_obj = area.get_parent().get_parent()

func _on_Place_area_exited(area):
	area_obj = null
