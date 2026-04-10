extends State

@onready var attack = $"../../AnimatedSprite2D/attack_hitbox/attack_hitbox"

func enter():
	super.enter()
	attack.set_deferred("disabled", false)

func transition():
	if owner.direction.length() > 100:
		attack.set_deferred("disabled", true)
		get_parent().change_state("follow")
