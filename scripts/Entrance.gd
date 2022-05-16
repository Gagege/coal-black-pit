extends Spatial

var player: Player = null
var initial_spawn = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if initial_spawn:
		$InitialSpawnPoint.add_child(player)
	else:
		$SpawnPoint.add_child(player)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
