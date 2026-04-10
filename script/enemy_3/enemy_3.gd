extends CharacterBody2D

@onready var player = get_parent().find_child("player")
@onready var sprite = $AnimatedSprite2D
@onready var hpbar = $ProgressBar
@onready var attack_1 = $AnimatedSprite2D/attack_hitbox/attack_hitbox
@onready var dash_attack = $AnimatedSprite2D/dash_hitbox/dash_hitbox
@export var movement_speed = 120

var direction : Vector2

var health = 160:
	set(value):
		health = value
		hpbar.value = value
		if value <= 0:
			hpbar.visible = false
			find_child("FiniteStateMachine").change_state("death")

func _ready():
	set_physics_process(false)
	attack_1.set_deferred("disabled", true)
	dash_attack.set_deferred("disabled", true)

func _process(_delta):
	direction = player.position - position
	sprite.play("idle")
	
	if direction.x < 0:
		sprite.flip_h = true
		attack_1.position.x = -abs(attack_1.position.x)
	else:
		sprite.flip_h = false
		attack_1.position.x = abs(attack_1.position.x)

func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * movement_speed
	move_and_collide(velocity * delta)

func _take_damage(amount: int):
	health -= amount
