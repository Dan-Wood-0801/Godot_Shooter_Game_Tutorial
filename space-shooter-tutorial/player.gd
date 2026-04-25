extends Area2D
class_name Player
var speed = 300
var input_vector = Vector2.ZERO
var hp = 10
signal spawn_laser(location)
@onready var player_muzzle = $PlayerMuzzle

func _physics_process(delta: float):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	global_position += input_vector * speed * delta
	
	if Input.is_action_just_pressed("shoot"):
		shoot_player_laser()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func player_take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

func shoot_player_laser():
	emit_signal("spawn_laser", player_muzzle.global_position)


func _on_area_entered(area: Area2D):
	if area.is_in_group("Enemies"):
		area.enemy_take_damage(1) #enemy doesn't die when player crashes into enemy
		player_take_damage(1) 
	if area.is_in_group("Enemy Laser"):
		player_take_damage(1)
