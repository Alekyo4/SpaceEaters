extends Sprite2D

@export var chance_tail: int = 15

@export var slow_velocity: int = 250
@export var super_velocity: int = 450

@export var velocitys: Array[int] = [150, 180, 230, 300, 350, 450, 450, 500]

@onready var tail_scene := preload("res://src/objects/star/star_tail.tscn")

@onready var limit_y := get_viewport_rect().size.y

var velocity: int

func _init():
	velocity = velocitys.pick_random()

	frame = 0 if velocity >= slow_velocity else 1

func _ready():
	if velocity >= super_velocity:
		_tail_instantiate()

func _physics_process(delta):
	global_position.y += velocity * delta
	
	if global_position.y > limit_y:
		_on_screen_exited()

func _tail_instantiate():
	var tail = tail_scene.instantiate()
	
	limit_y += (tail.limit_size + 8)
	
	add_child(tail)

func _on_screen_exited():
	queue_free()
