extends CharacterBody2D

@onready var player = get_parent().find_child("player")
@onready var sprite = $AnimatedSprite2D

var attack_1_range = 70
@export var movement_speed = 80

var direction : Vector2

func _ready():
	set_physics_process(false)

func _process(_delta):
	direction = player.position - position
	
	if direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * movement_speed
	move_and_collide(velocity * delta)
