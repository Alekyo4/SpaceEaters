extends Sprite2D

@export var is_super: bool = false

@export var chance_tail: int = 15

@export var slow_velocity: int = 250
@export var super_velocity: int = 450

@export var velocitys: Array[int] = [150, 180, 230, 300, 350, 450, 450]

@export var svelocitys: Array[int] = [300, 300, 450, 500, 500, 600, 800]

@onready var tail_scene := preload("res://src/objects/star/star_tail.tscn")

@onready var limit_y := get_viewport_rect().size.y

var velocity: int

func _init() -> void:
	frame = 0 if velocity >= slow_velocity else 1

func _ready() -> void:
	velocity = (velocitys if !is_super else svelocitys).pick_random()
	
	if velocity >= super_velocity:
		_tail_instantiate()

func _physics_process(delta: float) -> void:
	self.global_position.y += velocity * delta
	
	if self.global_position.y > limit_y:
		_on_screen_exited()

func _tail_instantiate() -> void:
	var tail = tail_scene.instantiate()
	
	limit_y += (tail.limit_size + 8)
	
	self.add_child(tail)

func _on_screen_exited():
	self.queue_free()
