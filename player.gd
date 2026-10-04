extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

#lo igualo a falso para que no este muerto
var muerto = false

#esto sirve para saber si esta golpeando
var golpeando = false


func _physics_process(delta: float) -> void:
	#si esta muerto == true se va de esta funcion
	if muerto:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#si pulso punch hago el golpe una vez
	if Input.is_action_just_pressed("punch") and not golpeando:
		golpeando = true
		$AnimatedSprite2D.play("punch")

	move_and_slide()


func _process(_delta):
	if muerto:
		return

	#si esta golpeando dejo que termine la animacion
	if golpeando:
		return

	if is_on_floor():
		if velocity.x > 0:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.play("idle")
	else:
		if velocity.x > 0:
			$AnimatedSprite2D.play("jump")
			$AnimatedSprite2D.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite2D.play("jump")
			$AnimatedSprite2D.flip_h = true


func _on_animated_sprite_2d_animation_finished():
	#cuando termina punch ya puede volver a las otras animaciones
	if $AnimatedSprite2D.animation == "punch":
		golpeando = false


func morir():
	if muerto:
		return

	muerto = true
	
	#vector2 son x y y para que no se mueva si esta muerto
	velocity = Vector2.ZERO

	$AnimatedSprite2D.play("death")

	#esto lo busque por internet el await es para esperar a que la animacion acabe
	await $AnimatedSprite2D.animation_finished

	print("HAS MUERTO")
	print("TOCA PASTO")
	
	#termina la ejecucion del juego
	get_tree().quit()
