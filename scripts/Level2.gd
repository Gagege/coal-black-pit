extends Spatial

var player: Player = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$SpawnPoint.add_child(player)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
