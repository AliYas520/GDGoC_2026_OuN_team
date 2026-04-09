extends State

func enter():
	super.enter()

func transition():
	if owner.direction.length() > 50:
		get_parent().change_state("follow")
