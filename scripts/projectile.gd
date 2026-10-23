extends Area2D

@export var speed: float = 500.0

var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta):
	global_position += direction * speed * delta

# Create signal if the arrow is ready to be reloaded
signal reload_arrow

func _on_body_entered(body: Node2D) -> void:
	#print(body.is_in_group("arrow_border"))
	#queue_free()
	
	if body.is_in_group("arrow_border"):
		print("arrow border touched")
		reload_arrow.emit()
		queue_free()
