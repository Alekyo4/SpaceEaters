extends Node2D

@export var equipped: Projectiles

@onready var timer := Timer.new()

var inst: PackedScene

enum Projectiles { SFAT, FAT, BOOM, MBOOM, SLASER, LASER }

func _ready() -> void:
	self.timer.connect("timeout", _on_fire)
	
	self.add_child(timer, true)
	
	self._change_projectile(equipped)

func _change_projectile(prjt: Projectiles) -> void:
	var prj: String = Projectiles.find_key(prjt).to_lower()
	
	inst = load("res://src/objects/gun/prj_%s.tscn" % prj)

	if self.timer.time_left != 0:
		self.timer.stop()
	
	var prjx: Node2D = inst.instantiate()

	self.timer.wait_time = prjx.frequency
	
	prjx.queue_free()
	self.timer.start()

func _on_fire() -> void:
	if self.owner.toggle_shoot:
		var prj: Node2D = self.inst.instantiate()
		
		prj.position = $Point.global_position + prj.origin
		
		self.get_tree().current_scene.add_child(prj, true)
