extends State

func enter():
	super.enter()
	get_owner().sprite.play("attack")

func transition():
	if owner.direction.length() > 50:
		get_parent().change_state("follow")
