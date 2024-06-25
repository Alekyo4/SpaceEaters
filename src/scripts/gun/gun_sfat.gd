extends Projectile

func _init() -> void:
	origin.x = 1
	
	speed = 400
	frequency = 0.3

func _physics_process(delta) -> void:
	global_position.y -= speed * delta
