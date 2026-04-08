extends State

var attack_1_range = owner.attack_1_range

func enter():
	super.enter()
	owner.set_physics_process(true)

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():
	var distance = owner.direction.length()
	
	if distance < attack_1_range: #attack distance
		get_parent().change_state("attack_1")
