extends Node2D

var taps: int = 0

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		if $Timer.time_left == 0:
			$Timer.start()

		taps += 1

func _on_timeout():
	if taps >= 2:
		owner.get_child(0).play("game") # AnimationPlayer Node
	
	taps = 0
