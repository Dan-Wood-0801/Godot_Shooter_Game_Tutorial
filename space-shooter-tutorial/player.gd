extends Area2D
class_name Player
var speed = 300
var input_vector = Vector2.ZERO
var hp = 3
signal spawn_laser(location)
@onready var muzzle = $Muzzle

func _physics_process(delta: float):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	global_position += input_vector * speed * delta
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()


func _on_Player_area_entered(area):
	if area.is_in_group("Enemies"):
		area.take_damage(1)

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)
