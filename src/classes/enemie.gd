class_name Enemie extends Node2D

var speed: int = 0
var life: int = 0

var direction := Vector2.DOWN

signal projectile_collided(damage: int)

func _ready() -> void:
	pass

func _physics_process(delta) -> void:
	global_position.y += speed * delta
