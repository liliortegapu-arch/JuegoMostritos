extends CharacterBody2D

const SPEED = 50.0
var velocidad_actual = SPEED

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not $RayCastSueloIzquierda2D.is_colliding():
		velocidad_actual = SPEED
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")

	if not $RayCastSueloDerecha2D.is_colliding():
		velocidad_actual = -SPEED
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")

	velocity.x = velocidad_actual
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
		body.morir()
