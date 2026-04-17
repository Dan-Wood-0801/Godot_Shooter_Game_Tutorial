extends Node2D
var Laser = preload("res://player_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_spawn_laser(location):
	var l = Laser.instance()
	l.global_position = location
	add_child(l)
