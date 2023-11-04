extends Sprite2D

@export var frequency: float = 0.1

@export var sizes: Array[int] = [5, 15, 20]

@onready var timer := Timer.new()

var size: int
var limit_size: int

func _init():
	limit_size = sizes.pick_random()

func _ready():
	for _i in range(limit_size / 2):
		increase()
	
	timer.autostart = true
	timer.wait_time = frequency
	
	timer.connect("timeout", _tail)
	
	add_child(timer)

func _tail():
	if (size + 1) >= limit_size:
		timer.stop()
	
	increase()
	
	size += 1

func increase():
	position.y -= 1
	
	scale.y += 0.5
