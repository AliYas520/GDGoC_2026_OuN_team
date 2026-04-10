extends State

func enter():
	super.enter()
	owner.set_physics_process(true)

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():
	var distance = owner.direction.length()
	
	if distance < 100: #attack distance
		get_parent().change_state("attack")
		
	if distance > 220:
		var chance = randi() % 5
		match chance:
			0:
				get_parent().change_state("dash")
			1:
				get_parent().change_state("superdash")
			2: pass
			3: pass
			4: pass
