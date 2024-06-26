extends Control

var game_scene: PackedScene = preload("res://src/scenes/game.tscn")

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		$Animation.play("game")

func _on_animation_finished(anim_name: String) -> void:
	if anim_name != "game":
		return
	
	get_tree().change_scene_to_packed(game_scene)
