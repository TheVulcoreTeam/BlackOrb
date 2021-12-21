extends Node


enum Turn {
	PLAYER_1,
	CPU
}
var current_turn = Turn.PLAYER_1


func next_turn():
	Turns.current_turn = (current_turn + 1) % Turn.values().size()
	Signals.emit_signal("end_turn", Turns.current_turn)
