extends State
class_name idle_state

func transition():
	var raycast = $"../../RayCast2D"
	
	if raycast.is_colliding():
		get_parent().change_state("attack")
