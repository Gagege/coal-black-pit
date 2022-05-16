extends Node

export(Array) var _highlightable_meshes: Array
export(float, 0.0, 4.0) var _highlight_amount: float = 0.0 setget _set_highlight_amount
export(bool) var highlighting: bool = false setget _set_highlighting

var highlight_material: ShaderMaterial = preload("res://resources/outline_material.tres")

func _ready():
	for path in _highlightable_meshes:
		var highlightable_mesh: MeshInstance = get_node(path)
		var material: SpatialMaterial = highlightable_mesh.mesh.surface_get_material(0)
		material.next_pass = highlight_material

func _set_highlighting(value: bool):
	if value:
		if !highlighting:
			$AnimationPlayer.play("Highlight Mesh")
	else:
		if highlighting:
			$AnimationPlayer.play("RESET")
	highlighting = value

func _set_highlight_amount(amount: float):
	highlight_material.set_shader_param("depth_coef", amount)
