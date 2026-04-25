extends Area2D

var speed = 200

func _physics_process(delta: float):
	global_position.y += speed*delta


	

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		area.player_take_damage(1)
		queue_free()
