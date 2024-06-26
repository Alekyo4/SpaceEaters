class_name Projectile extends Node2D

@onready var rng := RandomNumberGenerator.new()

@onready var texture: Sprite2D = get_node("Texture")

var origin := Vector2.ZERO

var speed: int = 0
var spread: int = 0

var frequency: float = 0

func _ready() -> void:
	spread = rng.randi_range(-spread, spread)
	
	self.rotation_degrees = spread

func _process(_delta) -> void:
	if self.global_position.y <= -texture.get_rect().size.y:
		queue_free()
