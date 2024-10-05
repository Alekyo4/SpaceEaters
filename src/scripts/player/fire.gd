extends CPUParticles2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if self.owner.enable_fire != self.emitting:
		self.emitting = self.owner.enable_fire

func _physics_process(_delta: float) -> void:
	if self.amount != self.owner.status_fire:
		self.amount = self.owner.status_fire
