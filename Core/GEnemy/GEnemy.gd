extends Node2D

class_name GEnemy

var board_position

func _ready():
	Signals.connect("end_turn",self, "on_cpu_turn")
	pass

func on_cpu_turn(turn):
	if(turn == Turns.Turn.CPU):
		_move_to_player()
	else: return

func _move_to_player():
	randomize()
	var pos = board_position
	var movimiento = Vector2((randi() % 3) - 1 , (randi() % 3) - 1 )
	pos = Vector2(clamp(pos.x + movimiento.x, 0, 15),clamp(pos.y + movimiento.y, 0, 15) )
	board_position = pos
	#self.global_position = Board._get_pos_in_board(pos)
	Turns.next_turn()
	pass
