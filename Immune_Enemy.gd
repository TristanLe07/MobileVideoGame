extends KinematicBody2D

var speed = 150
var velocity = Vector2()
export var direction = -1
export var detects_cliff = true


func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliff
	if detects_cliff:
		set_modulate(Color(1.2,0.5,1))
	
func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliff and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_side_checker_body_entered(body):
	print("ouch")
	body.ouch(position.x)

func _on_Timer_timeout():
	queue_free()
