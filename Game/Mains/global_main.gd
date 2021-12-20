extends Node

class_name main_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_scene(rut:String):
	if get_tree().change_scene(rut) == OK:pass #Cambia la escena y evitamos la advertencia que retorna un valor (advertencia amarilla)
