extends Area2D

var direction = Vector2.RIGHT
var bullet_speed = 400

func _physics_process(_delta):
	position += direction * bullet_speed + _delta

func screen_exited() -> void:
	queue_free()
