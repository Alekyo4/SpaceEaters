extends CharacterBody2D

@export var toggle_move: bool = true
@export var toggle_shoot: bool = true

@export var enable_fire: bool = true

@export var status_fire: StatusFire

@onready var fire: int

var last_touch: Vector2

var is_move: bool = false
var is_shoot: bool = false

var direction: bool = false

var limit: Array[Vector2]

enum StatusFire {
	Normal = 2,
	Blast = 4
}

func _ready() -> void:
	self.limit = [$Collision.shape.size, get_viewport_rect().size - $Collision.shape.size]
	
	self.limit[0].y += 50 # UI Texture

func _physics_process(_delta: float) -> void:
	self._move()

func _move() -> void:
	if is_move:
		for dx in ["x", "y"]:
			var oy: int = 0 if dx == "x" else -4 # Origin Y in Touch
			
			self.global_position[dx] = clamp(lerp(self.global_position[dx] + oy, self.last_touch[dx], 0.1), self.limit[0][dx], self.limit[1][dx])
	
		$Texture.frame = 2 if self.direction else 1
		$Fire.position.x = 0.5
	else:
		$Texture.frame = 0
		$Fire.position.x = 0

func _input(event: InputEvent) -> void:
	if self.toggle_move:
		var mouse_pos: Vector2 = get_global_mouse_position()
		
		if event is InputEventScreenDrag:
			self.direction = mouse_pos.x > last_touch.x
			self.last_touch = mouse_pos
		
		if event is InputEventScreenTouch:
			if event.pressed:
				self.is_move = true
				self.last_touch = mouse_pos
			else:
				self.is_move = false
