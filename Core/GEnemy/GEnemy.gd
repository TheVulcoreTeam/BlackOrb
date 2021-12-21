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
	
	pos = Vector2(pos.x + movimiento.x,pos.y + movimiento.y)
	if(pos.x < 0): pos.x = 0
	if(pos.y < 0): pos.y = 0
	if(pos.x > 15): pos.x = 15
	if(pos.y > 15): pos.y = 15
	var dest = pos - board_position
	self.global_position += (dest) * 16
	board_position = pos
	print(board_position)
	#self.global_position = Board._get_pos_in_board(pos)
	Turns.next_turn()
	pass
