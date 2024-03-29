extends RigidBody2D

# Declare member variables here.
export var min_speed = 150 # Minimum speed range.
export var max_speed = 250 # Maximum speed range.
var mob_types = ["crumble", "sim", "engine"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Deletes the mobs when they leave the screen.
func _on_Visibility_screen_exited():
	queue_free()


func _on_start_game():
	queue_free()
