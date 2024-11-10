extends CanvasLayer

func changeSceneByTransition(sceneName):
	$AnimationPlayer.play("zone_transition_fade")
	await $AnimationPlayer.animation_finished
	get_tree().call_deferred("change_scene_to_file", sceneName)
	$AnimationPlayer.play_backwards("zone_transition_fade")
