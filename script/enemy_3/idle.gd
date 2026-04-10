extends State

@onready var collision = $"../../PlayerDetectionArea/CollisionShape2D"
@onready var attack_1 = $"../../attack_hitbox"
@onready var dash_attack = $"../../dash_hitbox"

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)

func transition():
	if player_entered:
		get_parent().change_state("follow")

func _on_player_detection_area_body_entered(_body):
	player_entered = true
