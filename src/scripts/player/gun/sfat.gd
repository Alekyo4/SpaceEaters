extends Projectile

func _init() -> void:
	self.origin.x = 1
	
	self.damage = 5
	
	self.speed = 400
	self.frequency = 0.3

func _physics_process(delta: float) -> void:
	self.global_position.y -= self.speed * delta

func _on_collide(area: Area2D):
	var node: Node2D = area.get_owner()
	
	if not node.is_in_group("enemies"):
		return
	
	node.emit_signal("projectile_collided", self.damage)
