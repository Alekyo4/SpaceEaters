extends Node

@onready var stream := AudioStreamPlayer.new()

@onready var file: AudioStreamWAV = preload("res://src/sound/music.wav")

func _ready():
	self.stream.volume_db = -8
	self.stream.autoplay = true
	
	self.file.loop_mode = AudioStreamWAV.LOOP_DISABLED
	
	self.stream.set_stream(file)

	self.add_child(self.stream)
