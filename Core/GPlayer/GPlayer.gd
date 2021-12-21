extends Node2D

class_name GPlayer

var input_vec := Vector2.ZERO

func _input(event):
	input_vec.x = int(event.is_action_pressed("ui_right")) - int(event.is_action_pressed("ui_left")) 
	input_vec.y = int(event.is_action_pressed("ui_bottom")) - int(event.is_action_pressed("ui_top"))
	
	$Movement.interpolate_property(
		self,
		"global_position",
		global_position,
		(global_position + input_vec) * 8,
		0.4,
		Tween.TRANS_CIRC,
		Tween.EASE_IN_OUT,
		0.1
	)
	$Movement.start()
	
	
