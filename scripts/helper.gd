extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_mouse_entered() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://scenes/Level 2.tscn")
