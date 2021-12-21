extends Node

class_name RPGData

var hp := 10
var hp_max := 10

# Previene que muera más de una vez. Esto hace que el player
# no pueda ganar/perder vida/energía cuando esta muerto.
# Para revivirlo se debe utilizar revive().
# El character si puede ganar experiencia cuando esta muerto,
# la razón es que a veces se da experiencia al jugador cuando
# no se esta en la pantalla de juego. 
var is_dead = false

signal drop_xp(amount)
# El amount es la cantidad que se añadió, no siempre es la
# cantidad enviada por medio de "add_hp(amount)"
signal add_hp(amount)
signal remove_hp(amount)
signal full_hp()
signal dead()
signal revive()

# Restaura una cantidad de hp (No supera la cantidad maxima)
func add_hp(_hp):
	if is_dead:
		print("add_hp(): El character esta muerto requiere ser revivido")
		return
		
	if hp + _hp < hp_max:
		hp += _hp
		emit_signal("add_hp", _hp)
	# Significa que se esta añadiendo más hp de lo que se podría
	else: 
		if hp == hp_max:
			.debug("No se puede añadir mas HP ya que esta lleno.")
			emit_signal("full_hp")
			return
		
		emit_signal("add_hp", _hp - (_hp - hp))
		hp = hp_max
		emit_signal("full_hp")
	
