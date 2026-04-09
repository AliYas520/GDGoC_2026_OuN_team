extends State
class_name attack_bullets

@export var bullet_node : PackedScene
@onready var timer = $Timer

func transition():
	var raycast = $"../../RayCast2D"
	
	if not raycast.is_colliding():
		get_parent().change_state("chase")


func _on_timer_timeout() -> void:
	shoot()

func shoot():
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.direction = (player.global_position -  global_position).normalized()
