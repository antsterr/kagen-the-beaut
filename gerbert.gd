extends CharacterBody2D# PlayerMovement.gd (Godot 4.x)

@export var move_speed: float = 200.0

func _physics_process(_delta: float) -> void:
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	velocity = input_vector * move_speed
	move_and_slide()
