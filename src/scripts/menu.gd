extends Control

var qtap: int = 0

var allow_start: bool = false

var game_scene: PackedScene = preload("res://src/scenes/game.tscn")

func _ready() -> void:
	pass

func _on_animation_started(anim_name: String) -> void:
	if anim_name != "game":
		return
	
	await get_tree().create_timer(0.6).timeout
	
	$Tap/Audio.play()

func _on_animation_finished(anim_name: String) -> void:
	if anim_name != "game":
		return
	
	get_tree().change_scene_to_packed(game_scene)

func _on_animation_player_finished(anim_name: String):
	if anim_name != "start":
		return
	
	self.allow_start = true
	
	$Tap/Text/Animation.play("loop")
