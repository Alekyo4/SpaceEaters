extends Node2D

@export var spawns: int = 3
@export var distancy: int = 64

@export var frequency = 0.5

@onready var star_scene := preload("res://src/objects/star/star.tscn")

@onready var area_x := get_viewport_rect().size.x

@onready var timer := Timer.new()
@onready var rng := RandomNumberGenerator.new()

func _ready() -> void:
	timer.autostart = true
	timer.wait_time = frequency

	timer.connect("timeout", _spawn)
	
	add_child(timer)

func _spawn() -> void:
	for _i in range(spawns):
		var star: Sprite2D = star_scene.instantiate()

		var pos_x: int = rng.randi_range(0, area_x - 4)
		var pos_y: int = rng.randi_range(-8, -distancy)
		
		star.position.x = pos_x
		star.position.y = pos_y
		
		add_child(star)
