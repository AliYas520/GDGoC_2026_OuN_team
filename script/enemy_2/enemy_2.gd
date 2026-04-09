extends CharacterBody2D

@onready var raycast = $RayCast2D
@onready var player = get_parent().find_child("player")

var direction = Vector2.RIGHT

func _process(_delta):
	direction = (player.position - global_position).normalized()
	raycast.target_position = direction * 250
