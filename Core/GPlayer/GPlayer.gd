extends Node2D

class_name GPlayer

var input_vec := Vector2.ZERO
var dest

func _input(event):
	if Turns.current_turn != Turns.Turn.PLAYER_1:
		return
	
	input_vec.x = int(event.is_action_pressed("ui_right")) - int(event.is_action_pressed("ui_left")) 
	input_vec.y = int(event.is_action_pressed("ui_down")) - int(event.is_action_pressed("ui_up"))
	
	if input_vec != Vector2.ZERO:
		dest = global_position + (input_vec * 16)

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
		Turns.next_turn()
	
	input_vec = Vector2.ZERO
