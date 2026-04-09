extends State

var sprite = get_owner().sprite

func enter():
	super.enter()
	sprite.play("attack")

func transition():
	if owner.direction.length() > 50:
		get_parent().change_state("follow")
