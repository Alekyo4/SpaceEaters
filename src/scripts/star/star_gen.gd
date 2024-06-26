extends Node2D

@export var spawns: int = 4
@export var distancy: int = 64

@export var is_super: bool = false

@export var frequency: float = 0.2

@onready var star_scene: PackedScene = preload("res://src/objects/star.tscn")

@onready var area_x: float = get_viewport_rect().size.x

@onready var timer := Timer.new()
@onready var rng := RandomNumberGenerator.new()

func _ready() -> void:
	timer.autostart = true
	timer.wait_time = frequency

	timer.connect("timeout", _on_spawn)
	
	self.add_child(timer)

func _on_spawn() -> void:
	for _i in range(spawns):
		var star: Sprite2D = star_scene.instantiate()

		@warning_ignore("narrowing_conversion")
		var pos_x: int = rng.randi_range(0, area_x - 4)
		var pos_y: int = rng.randi_range(-8, -distancy)
		
		star.position.x = pos_x
		star.position.y = pos_y

		star.is_super = is_super
		
		self.add_child(star)
