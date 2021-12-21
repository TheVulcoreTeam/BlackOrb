extends Node2D

class_name GPlayer

var input_vec := Vector2.ZERO
var dest

func _input(event):
	input_vec.x = int(event.is_action_pressed("ui_right")) - int(event.is_action_pressed("ui_left")) 
	input_vec.y = int(event.is_action_pressed("ui_down")) - int(event.is_action_pressed("ui_up"))
	
	if input_vec != Vector2.ZERO:
		dest = global_position + global_position.direction_to(input_vec).normalized() + Vector2(16, 16)
		print(dest)
		
		$Movement.interpolate_property(
			self,
			"global_position",
			global_position,
			dest,
			.4,
			Tween.TRANS_SINE,
			Tween.EASE_IN_OUT,
			0.1
		)
		$Movement.start()
	
	input_vec = Vector2.ZERO
