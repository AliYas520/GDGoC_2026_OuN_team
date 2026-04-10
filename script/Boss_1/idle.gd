extends State

@onready var collision = $"../../PlayerDetectionArea/CollisionShape2D"
@onready var healthbar = $"../../Ui/ProgressBar"

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("fa")
