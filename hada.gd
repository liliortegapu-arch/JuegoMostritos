extends Node2D

var muerto = false


func _ready():
	$AnimatedSprite2D.play("default")


func _on_area_2d_body_entered(body: Node2D) -> void:

	if muerto:
		return

	if body.name == "Player":
		muerto = true

		#pongo la animacion de muerte del hada
		$AnimatedSprite2D.play("death")

		#pongo la animacion de muerte del fuego
		get_parent().get_node("fuego/AnimatedSprite2D").play("death")

		#espero a que termine la animacion
		await $AnimatedSprite2D.animation_finished

		#elimino el fuego que esta fuera de este nodo
		get_parent().get_node("fuego").queue_free()

		#elimino el hada
		queue_free()
