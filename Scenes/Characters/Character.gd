extends KinematicBody2D
class_name Character

const FRICTION = 0.25
export (int) var hp = 3 setget set_hp
signal hp_changed(new_hp)

export var acceleration = 35
export var max_speed = 70

onready var state_machine = $FiniteStateMachine
#onready var animated_sprite = $AnimatedSprited

var mov_direction = Vector2.ZERO
var velocity = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

func move():
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * acceleration
	velocity = velocity.clamped(max_speed)

func take_damage(dam, dir, force):
	self.hp -= dam
	if hp > 0:
		state_machine.set_state(state_machine.states.hurt)
	else:
		state_machine.set_state(state_machine.states.dead)

func set_hp(new_hp):
	hp = new_hp
	emit_signal("hp_changed", new_hp)
