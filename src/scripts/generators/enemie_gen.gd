extends Node2D

const RESOURCE: Dictionary = {
	"green": [
		{ "name": "one", "probability": 50 }
	]
}

@export var spawns: int = 1

@export var frequency: float = 3

@onready var area_x: float = get_viewport_rect().size.x

@onready var timer := Timer.new()
@onready var rng := RandomNumberGenerator.new()

var allows: Array[String] = ["green"]

func _ready() -> void:
	self.timer.autostart = true
	self.timer.wait_time = frequency
	
	self.timer.connect("timeout", _on_spawn)
	
	self.add_child(timer)

func _on_spawn() -> void:
	for category in allows:
		var summons: Array[Dictionary] = []
		
		var probability: int = self.rng.randi_range(1, 100)
		
		for summon in RESOURCE[category]:
			if summon.probability > probability:
				continue
			
			summons.append(summon)
		
		if summons.is_empty():
			summons.append(RESOURCE[category][0])
	
		for i in range(self.spawns):
			var enemie = load(
				"res://src/objects/enemies/%s/%s.tscn" % [category, summons[i].name]).instantiate()
			
			enemie.position.x = self.rng.randi_range(16, area_x - 16)
			
			self.add_child(enemie)
