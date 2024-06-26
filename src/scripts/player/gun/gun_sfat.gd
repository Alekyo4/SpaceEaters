extends Projectile

func _init() -> void:
	self.origin.x = 1
	
	self.speed = 400
	self.frequency = 0.3

func _physics_process(delta: float) -> void:
	self.global_position.y -= self.speed * delta
