extends CanvasLayer

func _on_visibility_changed():
	var sizeX = get_viewport().size.x
	var sizeY = get_viewport().size.y
	
	var quad_mesh = $MeshInstance2D.mesh as QuadMesh
	
	quad_mesh.size = Vector2(sizeX, sizeY)
	quad_mesh.center_offset = Vector3(sizeX/2, sizeY/2, 0.0)
