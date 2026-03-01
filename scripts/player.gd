extends CharacterBody2D
signal gameover
signal gamewon


const SPEED = 130.0
const JUMP_VELOCITY = -450.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
func death():
	animated_sprite.play("Death")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Attack"):
		animated_sprite.play("Sword")
	if not Input.is_action_just_pressed("Attack"):
		animated_sprite.play("Idle")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions
	
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	if is_on_floor():
		if direction == 0 and not Input.is_action_just_pressed("Attack"):
			animated_sprite.play("Idle")
		elif direction and not Input.is_action_just_pressed("Attack"):
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jumping")
		velocity += get_gravity() * delta
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_killzone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
