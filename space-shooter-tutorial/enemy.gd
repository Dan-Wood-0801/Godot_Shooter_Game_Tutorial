extends Area2D

@onready var timer:Timer = $HMoveTimer
var EnemyLaser = preload("res://Enemy_Laser.tscn")
var laser_spawn_position = null
var hp = 1
var v_speed = 5
var h_speed = 3.5

func _physics_process(_delta) -> void:
	global_position.y += v_speed
	global_position.x += h_speed
	var enemy_shoot = randf()
	if enemy_shoot > 0.8:
		shoot_enemy_laser()

func horizontal_movement():
	var h_movement = randf()
	if h_movement > 0.5:
		h_speed *= -1

func shoot_enemy_laser():
	var enemy_laser = EnemyLaser.instantiate()
	enemy_laser.global_position = $EnemyMuzzle.global_position
	add_child(enemy_laser)

func enemy_take_damage(damage):
	print_debug("enemy damage")
	hp -= damage
	if hp <= 0:
		queue_free()

func _on_Enemy_area_entered(area):
	if area is Player:
		area.player_take_damage(1)


func _on_h_move_timer_timeout() -> void:
	horizontal_movement()
