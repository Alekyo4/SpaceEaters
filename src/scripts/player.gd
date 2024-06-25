extends CharacterBody2D

@export var toggle_move: bool = true
@export var toggle_shoot: bool = true

var last_touch: Vector2

var is_move: bool = false
var is_shoot: bool = false

var direction: bool = false

var limit: Array[Vector2]

func _ready() -> void:
	limit = [$Collision.shape.size, get_viewport_rect().size - $Collision.shape.size]

func _physics_process(_delta) -> void:
	_move()

func _move() -> void:
	if is_move:
		for dx in ["x", "y"]:
			var oy: int = 0 if dx == "x" else -2 # Origin Y in Touch
			
			global_position[dx] = clamp(lerp(global_position[dx] + oy, last_touch[dx], 0.05), limit[0][dx], limit[1][dx])
	
		$Texture.frame = 2 if direction else 1
		$Fire.position.x = 0.5
	else:
		$Texture.frame = 0
		$Fire.position.x = 0

func _input(event):
	if toggle_move:
		var mouse_pos: Vector2 = get_global_mouse_position()
		
		if event is InputEventScreenDrag:
			direction = mouse_pos.x > last_touch.x
		
			last_touch = mouse_pos
		
		if event is InputEventScreenTouch:
			if event.pressed:
				is_move = true
				
				last_touch = mouse_pos
			else:
				is_move = false
