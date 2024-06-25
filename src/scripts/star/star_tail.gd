extends Sprite2D

@export var sizes: Array[int] = [5, 15, 20]

var size: int
var limit_size: int

func _init():
	limit_size = sizes.pick_random()

func _ready():
	for _i in range(limit_size / 2):
		increase()

func increase():
	position.y -= 1
	scale.y += 0.5

func _on_tail():
	if (size + 1) >= limit_size:
		$Timer.stop()
	
	size += 1
	
	increase()
