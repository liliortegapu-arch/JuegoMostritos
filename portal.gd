extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		
		print ("Has ganado el nivel 1")
		
		get_tree().quit()
