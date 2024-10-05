extends Enemie

const speeds: Array[int] = [36, 42]

func _init() -> void:
	self.life = 20
	
	self.connect("projectile_collided", _on_projectile_collided)

func _ready() -> void:
	self.speed = speeds.pick_random()

func _on_projectile_collided(damage: int) -> void:
	self.life -= damage
	
	if (self.life <= 0):
		self.queue_free()
