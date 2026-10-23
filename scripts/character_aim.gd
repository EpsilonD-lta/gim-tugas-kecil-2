extends Node2D

@export var radius: float = 50.0

@onready var arrow: Sprite2D = $CharacterAimArrow
@onready var character: Node2D = $CharacterAim

var projectile_scene = preload("res://scenes/projectile.tscn")

# Makes the arrow follow the cursor
func _process(_delta):
	look_at(get_global_mouse_position())
	arrow.position = Vector2(radius, 0)

# Detects if the user wants to shoot
func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

# Wait for the arrow to hit something before shooting again
var can_shoot = true

func shoot():
	if !can_shoot:
		return
	
	# Hides the guide arrow (CharacterAimArrow) and disable shooting
	arrow.visible = false
	can_shoot = false
	
	create_projectile()
	

func create_projectile():
	# Create projectile
	var projectile = projectile_scene.instantiate()
	
	# Add projectile
	get_tree().current_scene.add_child(projectile)
	
	# ???
	projectile.global_position = arrow.global_position

	projectile.direction = Vector2.RIGHT.rotated(global_rotation)

	projectile.rotation = projectile.direction.angle()
	
	# Connect the reload_arrow signal
	projectile.reload_arrow.connect(_on_reload_arrow)
	
func _on_reload_arrow():
	print("arrow reload signal triggered")
	arrow.visible = true
	can_shoot = true
