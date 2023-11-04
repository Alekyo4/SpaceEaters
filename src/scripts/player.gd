extends CharacterBody2D

@export var toggle_move: bool = true

var last_touch: Vector2

var is_move: bool = false
var direction: bool = false

func _ready() -> void:
	pass

func _physics_process(_delta) -> void:
	_move()

func _move() -> void:
	if is_move:
		global_position.x = lerp(global_position.x, get_global_mouse_position().x, 0.1)
		global_position.y = lerp(global_position.y - 3, get_global_mouse_position().y, 0.1)
	
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
