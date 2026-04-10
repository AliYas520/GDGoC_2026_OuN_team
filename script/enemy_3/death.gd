extends State

func  enter():
	super.enter()
	AnimatedSprite2D.flip_v
	queue_free()
