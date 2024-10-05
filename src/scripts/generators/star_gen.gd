extends Node2D

@export var spawns: int = 4
@export var distancy: int = 64

@export var is_super: bool = false

@export var frequency: float = 0.2

@onready var star_scene: PackedScene = preload("res://src/objects/star/particle.tscn")

@onready var area_x: float = get_viewport_rect().size.x

@onready var timer := Timer.new()
@onready var rng := RandomNumberGenerator.new()

func _ready() -> void:
	self.timer.autostart = true
	self.timer.wait_time = frequency

	self.timer.connect("timeout", _on_spawn)
	
	self.add_child(timer)

func _on_spawn() -> void:
	for _i in range(self.spawns):
		var star: Sprite2D = self.star_scene.instantiate()

		@warning_ignore("narrowing_conversion")
		var pos_x: int = self.rng.randi_range(0, area_x - 4)
		var pos_y: int = self.rng.randi_range(-8, -distancy)
		
		star.position.x = pos_x
		star.position.y = pos_y

		star.is_super = is_super
		
		self.add_child(star)
