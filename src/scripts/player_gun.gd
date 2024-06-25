extends Node2D

@export var equipped := Projectiles.SFAT

@onready var timer := Timer.new()

var inst: PackedScene

enum Projectiles { SFAT, FAT, BOOM, MBOOM, SLASER, LASER }

func _ready() -> void:
	timer.connect("timeout", _on_fire)
	
	add_child(timer, true)
	
	_change_projectile(equipped)

func _change_projectile(prjt: Projectiles) -> void:
	inst = load("res://src/objects/gun/gun_prj_%s.tscn" % prjt)

	if timer.time_left != 0:
		timer.stop()
	
	var prjx: Node2D = inst.instantiate()

	timer.wait_time = prjx.frequency
	
	timer.start()
	prjx.queue_free()

func _on_fire() -> void:
	if owner.toggle_shoot:
		var prj: Node2D = inst.instantiate()
		
		prj.position = $Point.global_position + prj.origin
		
		get_tree().root.add_child(prj, true)
