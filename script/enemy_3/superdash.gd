extends State

@onready var superdash = $"../../AnimatedSprite2D/dash_hitbox/dash_hitbox"
var can_transition: bool = false

func enter():
	super.enter()
	await dash()
	superdash.set_deferred("disabled",true)
	can_transition = true

func dash():
	var tween = create_tween()
	superdash.set_deferred("disabled", false)
	tween.tween_property(owner, "position", player.position, 0.4)
	await tween.finished

func transition():
	if can_transition:
		can_transition = false
		
		get_parent().change_state("follow")
