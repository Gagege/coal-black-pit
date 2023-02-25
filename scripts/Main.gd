extends Spatial

var _current_level: Spatial = null

var _entrance_level: PackedScene = preload("res://scenes/Entrance.tscn")
var _level_1: PackedScene = preload("res://scenes/Level1.tscn")
var _level_2: PackedScene = preload("res://scenes/Level2.tscn")
var _level_3: PackedScene = preload("res://scenes/Level3.tscn")

onready var _player: Player = $Player

func _ready():
	var _err0 = GlobalEvents.connect("player_exited_level", self, "_on_player_exited_level")
	var _err1 = GlobalEvents.connect("player_died", self, "_on_player_died")
	var _err2 = GlobalEvents.connect("win_game", self, "_on_win_game")
	_current_level = _entrance_level.instance()
	_current_level.initial_spawn = true
	_current_level.player = _player
	add_child(_current_level)

func _on_player_exited_level():
	$AnimationPlayer.play("FadeOutToMap")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_player_died():
	$AnimationPlayer.play("FadeOutToDead")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_win_game():
	$AnimationPlayer.play("FadeOutToWinGame")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func exit_current_level():
	_current_level.queue_free()

func _on_GoToEntrance_pressed():
	$AnimationPlayer.play("FadeMapToBlack")
	yield($AnimationPlayer, "animation_finished")
	_current_level = _entrance_level.instance()
	_current_level.player = _player
	add_child(_current_level)
	$AnimationPlayer.play("FadeBlackToLevel")


func _on_GoToLevel1_pressed():
	$AnimationPlayer.play("FadeMapToBlack")
	yield($AnimationPlayer, "animation_finished")
	_current_level = _level_1.instance()
	_current_level.player = _player
	add_child(_current_level)
	$AnimationPlayer.play("FadeBlackToLevel")


func _on_GoToLevel2_pressed():
	$AnimationPlayer.play("FadeMapToBlack")
	yield($AnimationPlayer, "animation_finished")
	_current_level = _level_2.instance()
	_current_level.player = _player
	add_child(_current_level)
	$AnimationPlayer.play("FadeBlackToLevel")


func _on_GoToLevel3_pressed():
	$AnimationPlayer.play("FadeMapToBlack")
	yield($AnimationPlayer, "animation_finished")
	_current_level = _level_3.instance()
	_current_level.player = _player
	add_child(_current_level)
	$AnimationPlayer.play("FadeBlackToLevel")
