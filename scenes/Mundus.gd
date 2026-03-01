extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $"../CharacterBody2D4/AnimatedSprite2D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	 # Replace with function body.
	animated_sprite.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
