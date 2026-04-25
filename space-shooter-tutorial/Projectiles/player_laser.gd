extends Area2D
var speed = 1000

func _physics_process(delta: float):
	global_position.y += -speed*delta


func _on_PlayerLaser_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemies"):
		area.enemy_take_damage(1)
		queue_free()
