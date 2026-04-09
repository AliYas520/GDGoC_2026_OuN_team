extends State

@onready var collision = $"../../PlayerDetectionArea/CollisionShape2D"
@onready var healthbar = $"../../healthbar"

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
		healthbar.set_deferred("visible", value)



func transition():
	if player_entered:
		get_parent().change_state("follow")

func _on_player_detection_area_body_entered(_body):
	player_entered = true
