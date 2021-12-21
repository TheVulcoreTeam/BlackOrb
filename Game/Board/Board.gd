extends TileMap

const BOARD_SIZE = Vector2(16, 16)

var rec_regen = preload("res://Game/Places/Regen/Regen.tscn")
var rec_fire = preload("res://Game/Places/Fire/Fire.tscn");
var rec_player = preload("res://Game/Players/Soldier/Soldier.tscn")
var free_cells = range(BOARD_SIZE.x * BOARD_SIZE.y)

func _ready():
	create_map()


func create_map():
	randomize()
	create_player(_get_free_rand_cell(true), rec_player.instance())
	# Generar los places especiales de manera aleatoria
	_generate_places( 150 , rec_regen)
	_generate_places( 150 , rec_fire)
	

func _generate_places( cant , place):
	
	for a in range(cant):
		if len(free_cells) > 0:
			var pos = _get_free_rand_cell(true)
			create_place(pos, place.instance())			
		else: break

func _get_free_rand_cell(removecell: bool):
	var i = randi() % len(free_cells)
	var cell = free_cells[i];
	var _x = cell % int(BOARD_SIZE.x)
	var _y = floor(cell / BOARD_SIZE.x)
	if(removecell): free_cells.remove(i);
	return Vector2(_x,_y)

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

