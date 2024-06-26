extends Node2D

@export var equipped: Projectiles

@onready var timer := Timer.new()

var inst: PackedScene

enum Projectiles { SFAT, FAT, BOOM, MBOOM, SLASER, LASER }

func _ready() -> void:
	timer.connect("timeout", _on_fire)
	
	self.add_child(timer, true)
	
	_change_projectile(equipped)

func _change_projectile(prjt: Projectiles) -> void:
	var prj: String = Projectiles.find_key(prjt).to_lower()
	
	inst = load("res://src/objects/gun/gun_prj_%s.tscn" % prj)

	if timer.time_left != 0:
		timer.stop()
	
	var prjx: Node2D = inst.instantiate()

	timer.wait_time = prjx.frequency
	
	timer.start()
	prjx.queue_free()

func _on_fire() -> void:
	if self.owner.toggle_shoot:
		var prj: Node2D = inst.instantiate()
		
		prj.position = $Point.global_position + prj.origin
		
		get_tree().current_scene.add_child(prj, true)
