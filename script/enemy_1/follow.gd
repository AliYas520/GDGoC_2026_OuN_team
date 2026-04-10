extends State

@onready var _sprite = get_owner().find_child("AnimatedSprite2D")

func enter():
	super.enter()
	owner.set_physics_process(true)

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():
	var distance = owner.direction.length()
	
	if distance < 50: #attack distance
		var chance = randi() % 2
		match chance:
			0:
				get_parent().change_state("attack_1")
				_sprite.play("attack")
			1:
				get_parent().change_state("attack_2")
