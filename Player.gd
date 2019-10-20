extends Area2D

# Adding some signals.
signal hit

# Declare member variables here.
export var speed = 400
var velocity = Vector2() # The player's movement vector.
var killed_by
var target = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func start(pos):
	position = pos
	target = pos
	show()
	$CollisionShape2D.disabled = false


func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		target = event.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.distance_to(target) > 10:
		velocity = (target - position).normalized() * speed
	else:
		velocity = Vector2()
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	
	if $Sprite.rotation_degrees < 360:
		$Sprite.rotation_degrees += 2
	else:
		$Sprite.rotation_degrees = 1


func _on_Player_body_entered(body):
	hide()
	killed_by = body.get_node("AnimatedSprite").get_animation()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
