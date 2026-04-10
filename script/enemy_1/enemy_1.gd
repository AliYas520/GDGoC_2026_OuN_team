extends CharacterBody2D

@onready var player = get_parent().find_child("player")
@onready var sprite = $AnimatedSprite2D
@onready var hpbar = $healthbar

@export var movement_speed = 60

var direction : Vector2

var health = 100:
	set(value):
		health = value
		hpbar.value = value
		if value <= 0:
			hpbar.visible = false
			find_child("FiniteStateMachine").change_state("death")

func _ready():
	set_physics_process(false)

func _process(_delta):
	direction = player.position - position
	sprite.play("idle")
	
	if direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * movement_speed
	move_and_collide(velocity * delta)

func _take_damage(amount: int):
	health -= amount
