extends Node2D

var golpeando = false


func _ready():
	#al principio el puño esta desactivado
	$CharacterBody2D/Area2D/CollisionShape2D.disabled = true
	$CharacterBody2D/AnimatedSprite2D.play("idle")


func _physics_process(_delta: float) -> void:

	#si esta golpeando no empieza otro golpe
	if golpeando:
		return

	#si detecta al Player por la derecha
	if $CharacterBody2D/RayCastDerecha2D.is_colliding():
		var objetivo = $CharacterBody2D/RayCastDerecha2D.get_collider()

		if objetivo.name == "Player":
			$CharacterBody2D/AnimatedSprite2D.flip_h = false
			golpear()

	#si detecta al Player por la izquierda
	elif $CharacterBody2D/RayCastIzquierda2D.is_colliding():
		var objetivo = $CharacterBody2D/RayCastIzquierda2D.get_collider()

		if objetivo.name == "Player":
			$CharacterBody2D/AnimatedSprite2D.flip_h = true
			golpear()


func golpear():
	#digo que esta golpeando
	golpeando = true

	#pongo la animacion de puñetazo
	$CharacterBody2D/AnimatedSprite2D.play("punch")


func _on_animated_sprite_2d_frame_changed():
	#compruebo que la animacion sea la de punch
	if $CharacterBody2D/AnimatedSprite2D.animation == "punch":

		#estas son las frames en las que el puñetazo hace daño
		if $CharacterBody2D/AnimatedSprite2D.frame == 3 or $CharacterBody2D/AnimatedSprite2D.frame == 4:
			$CharacterBody2D/Area2D/CollisionShape2D.disabled = false
		else:
			$CharacterBody2D/Area2D/CollisionShape2D.disabled = true


func _on_animated_sprite_2d_animation_finished():
	#si termina la animacion de punch
	if $CharacterBody2D/AnimatedSprite2D.animation == "punch":

		#dejo de estar golpeando
		golpeando = false

		#desactivo el puño
		$CharacterBody2D/Area2D/CollisionShape2D.disabled = true


func _on_area_2d_body_entered(body: Node2D) -> void:

	#si el puño toca al Player
	if body.name == "Player":
		body.morir()
