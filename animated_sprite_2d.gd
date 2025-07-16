# PlayerMovement.gd
extends AnimatedSprite2D

@export var move_speed: float = 200.0

func _process(delta: float) -> void:
	var direction := Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	direction = direction.normalized()
	position += direction * move_speed * delta

	if direction != Vector2.ZERO:
		# Choose animation based on horizontal direction
		if direction.x < 0:
			# Moving left
			if animation != "flipped":
				play("flipped")
		elif direction.x > 0:
			# Moving right
			if animation != "regular":
				play("regular")
		else:
			# If moving only vertically, keep current animation or choose one
			if animation != "regular":
				play("regular") # or "flipped", depending on last horizontal dir
	else:
		stop()
