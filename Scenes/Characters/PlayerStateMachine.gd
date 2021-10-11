extends StateMachine

func _ready():
	add_state("idle")
	add_state("dash")
	add_state("moving")
	call_deferred("set_state", states.idle)

func _state_logic(delta):
	if state == states.idle or state == states.move:
		parent.get_input()
	parent.move()

func _get_transition(delta):
	return null


