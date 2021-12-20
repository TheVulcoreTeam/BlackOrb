extends TileMap

const BOARD_SIZE = Vector2(16, 16)

var rec_regen = preload("res://Game/Places/Regen/Regen.tscn")
var rec_player = preload("res://Game/Players/Soldier/Soldier.tscn")


func _ready():
	create_map()


func create_map():
	randomize()
	create_place(Vector2(randi() % 16, randi() % 16), rec_regen.instance())
	create_place(Vector2(randi() % 16, randi() % 16), rec_regen.instance())
	create_place(Vector2(randi() % 16, randi() % 16), rec_regen.instance())
	
	create_player(Vector2(randi() % 16, randi() % 16), rec_player.instance())


func create_place(cell_pos : Vector2, object : GPlace):
	var obj_pos = _get_pos_in_board(cell_pos)
	object.global_position = obj_pos
	
	add_child(object)


func create_player(cell_pos : Vector2, object : GPlayer):
	var obj_pos = _get_pos_in_board(cell_pos)
	object.global_position = obj_pos
	
	add_child(object)


func _get_pos_in_board(cell_pos : Vector2):
	return map_to_world(cell_pos + Vector2(10, 2)) + Vector2(8, 8)

