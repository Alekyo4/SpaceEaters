extends Node2D

var taps: int = 0

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		if $Timer.time_left == 0:
			$Timer.start()

		self.taps += 1

func _on_timeout():
	if self.taps >= 2:
		self.owner.get_node("Animation").play("game")
	
	self.taps = 0
