extends Enemy

var GLUP_CAT_HEALTH = 100
var GLUP_CAT_ATTACK_DAMAGE = 5
var GLUP_CAT_ATTACK_COOLDOWN = 10
@onready var GLUP_CAT_HIT_ANIMATION = $TakeDamageAnimation
@onready var GLUP_CAT_HEALTH_BAR = $HealthBar
@onready var GLUP_CAT_SPRITE = $GlupCatSprite
@onready var GLUP_CAT_DEATH_TEXT = $DeathText
@onready var GLUP_CAT_HIT_SOUND_EFFECT = $HitSoundEffect
@onready var GLUP_CAT_DEAD_SOUND_EFFECT = $DeadSoundEffect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_max_health(GLUP_CAT_HEALTH)
	set_hit_animation(GLUP_CAT_HIT_ANIMATION)
	set_health_bar(GLUP_CAT_HEALTH_BAR)
	set_sprite(GLUP_CAT_SPRITE)
	set_death_text(GLUP_CAT_DEATH_TEXT)
	set_hit_sound_effect(GLUP_CAT_HIT_SOUND_EFFECT)
	set_dead_sound_effect(GLUP_CAT_DEAD_SOUND_EFFECT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
