extends Node2D
class_name Enemy

@export var max_health: int
var current_health: int
var attack_damage: int
var attack_cooldown: int

# Variables for nodes and shii
var hit_animation: AnimationPlayer
var health_bar: ProgressBar
var death_text: Node2D
var sprite: Sprite2D
var hit_sound_effect: AudioStreamPlayer2D
var dead_sound_effect: AudioStreamPlayer2D

func set_max_health(initial_health):
	max_health = initial_health
	current_health = initial_health

func set_hit_animation(animation_node):
	hit_animation = animation_node

func set_health_bar(progress_bar_node):
	health_bar = progress_bar_node
	health_bar.max_value = max_health
	health_bar.value = max_health

func set_sprite(cat_sprite):
	sprite = cat_sprite
	
func set_death_text(text):
	death_text = text

func set_hit_sound_effect(hit_sfx):
	hit_sound_effect = hit_sfx
	
func set_dead_sound_effect(dead_sfx):
	dead_sound_effect = dead_sfx

func update_health_bar():
	health_bar.value = current_health

func take_damage(att_damage):
	# Decreases the health
	current_health = max(current_health - att_damage, 0)
	
	# Update the progress bar
	update_health_bar()
	
	# Play the hit animation
	hit_animation.play("take_damage")
	
	# Check if the enemy is dead
	if current_health == 0:
		die()
	else:
		# If not dead, play the hit sound effect
		hit_sound_effect.play()
		

func die():
	# Hide the sprite and health bar
	sprite.visible = false
	health_bar.visible = false
	
	# Play the dead sound effect
	dead_sound_effect.play()
	
	# Play the death text animation
	var anim = death_text.get_node("TextAnimation")
	death_text.visible = true
	anim.play("text_float")

	await anim.animation_finished
	queue_free()
