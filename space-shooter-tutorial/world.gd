extends Node2D
var PlayerLaser = preload("res://Projectiles/player_laser.tscn")
var EnemyLaser = preload("res://Enemy_Laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_spawn_laser(location):
	var pl = PlayerLaser.instantiate()
	pl.global_position = location
	add_child(pl)

func _on_enemy_spawn_laser(location):
	var el = EnemyLaser.instantiate()
	el.global_position = location
	add_child(el)
