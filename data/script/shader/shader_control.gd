extends CanvasLayer

func _on_visibility_changed():
	var canvas_layer = get_tree().current_scene.get_node("ShaderLayer")
	canvas_layer.offset.x = 0
	canvas_layer.offset.y = 0
	
	var sizeX = 1152
	var sizeY = 648
	
	var mesh_instance = canvas_layer.get_node("MeshInstance2D")
	var quad_mesh = mesh_instance.mesh as QuadMesh
	
	quad_mesh.size = Vector2(sizeX, sizeY)
	quad_mesh.center_offset = Vector3(sizeX/2, sizeY/2, 0.0)
	
	var material = mesh_instance as CanvasItem
	material = material.material
