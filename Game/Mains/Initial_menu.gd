extends main_menu

onready var credits = $container/credits
onready var play = $container/play
onready var exit = $container/exit

func _ready():
	credits.connect("pressed",self,"change_scene",["res://Game/Mains/Credits.tscn"])
	play.connect("pressed",self,"change_scene",["res://Game/Board/Board.tscn"])
	exit.connect("pressed",get_tree(),"quit")
