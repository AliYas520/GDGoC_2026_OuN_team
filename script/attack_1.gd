extends State

var attack_range = get_owner().attack_1_range

func enter():
	super.enter()

func transition():
	if owner.direction.length() > attack_range:
		get_parent().change_state("follow")
