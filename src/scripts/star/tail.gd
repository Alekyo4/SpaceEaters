extends Sprite2D

@export var sizes: Array[int] = [5, 15, 20]

var size: int
var limit_size: int

func _init() -> void:
	self.limit_size = self.sizes.pick_random()

func _ready() -> void:
	for _i in range(self.limit_size / 2):
		self.increase()

func increase() -> void:
	self.position.y -= 1
	self.scale.y += 0.5

func _on_tail() -> void:
	if (self.size + 1) >= self.limit_size:
		$Timer.stop()
	
	self.size += 1
	
	self.increase()
