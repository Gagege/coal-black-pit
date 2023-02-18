extends KinematicBody

class_name Player

onready var camera = $Pivot/Camera
onready var hand = $Pivot/Hand

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.01  # radians/pixel

var equipped_item: String = ""

var velocity = Vector3()

func get_movement_input() -> Vector3:
	var input_dir = Vector3()
	# desired move in camera direction
	if Input.is_action_pressed("move_forward"):
		input_dir += -global_transform.basis.z
	if Input.is_action_pressed("move_back"):
		input_dir += global_transform.basis.z
	if Input.is_action_pressed("strafe_left"):
		input_dir += -global_transform.basis.x
	if Input.is_action_pressed("strafe_right"):
		input_dir += global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 1.2)
	
	if event.is_action_pressed("use_item"):
		GlobalEvents.emit_signal("player_used_item", equipped_item)

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_movement_input() * max_speed

	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if Input.is_action_pressed("equip_bolt_cutters"):
		equip_item("BoltCutters")
	if Input.is_action_pressed("equip_crowbar"):
		equip_item("Crowbar")
	if Input.is_action_pressed("equip_dynamite"):
		equip_item("Dynamite")

func equip_item(item_name: String):
	var new_item = get_node("Pivot/Hand/%s" % item_name)
	if new_item:
		for item in hand.get_children():
			item.visible = false
		new_item.visible = true
	equipped_item = new_item.name

func _on_PickupArea_body_entered(body: Node):
	if body.is_in_group("pick_up"):
		for item in hand.get_children():
			item.visible = false
		var item: Node = body.get_in_hand_model().duplicate()
		item.visible = true
		item.name = body.name
		hand.add_child(item)
		body.queue_free()
		equipped_item = item.name
