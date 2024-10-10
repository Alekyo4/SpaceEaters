extends Node2D

var qtaps: int = 0

var allowed: bool = false

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		if $Timer.time_left == 0:
			$Timer.start()

		self.qtaps += 1

func _on_timeout():
	if self.qtaps >= 2 and allowed:
		self.owner.get_node("Animation").play("game")
	
	self.qtaps = 0

func _on_animation_player_finished(anim_name):
	pass # Replace with function body.
