extends GPlace

var _area_obj
var _damage_points = 2

func _ready():
	Signals.connect("end_turn",self,"_on_end_turn")

func _on_end_turn(enum_turn):
	if _area_obj != null:
		# add function Damage
		_area_obj.data.damage(_damage_points)

func _on_Place_area_entered(area):
	_area_obj = area.get_parent().get_parent()

func _on_Place_area_exited(area):
	_area_obj = null
