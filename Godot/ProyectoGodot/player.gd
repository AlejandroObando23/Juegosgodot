extends CharacterBody2D



var speed = 1800
const gravity = 400
const world_limit= 4000

var UP=Vector2(0,-1)
var motion=Vector2(0,-1)
var Jump_speed =10000
@onready var animacion=$PlayerAnimation
signal animates


var lives= 3

func _physics_process(delta):
	apply_gravity()
	velocity=motion
	jump()
	move()
	animate()
	velocity = velocity.normalized()*speed
	move_and_slide()
func jump():
	velocity=motion
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -=Jump_speed
		velocity=UP
func move():
		if Input.is_action_pressed("left") :
			motion.x = speed
		elif Input.is_action_pressed("right") :
			motion.x = -speed
		else:
			motion.x=0
	
func apply_gravity():
	if position.y > world_limit:
		end_game()
	if(is_on_floor()):
		motion.y=0
	elif is_on_ceiling():
		motion.y=1
	else:
		motion.y +=gravity
	
	
	
func animate():
	emit_signal("animates",motion)
	
func end_game():
	get_tree().change_scene_to_file("res://Scenes/Levels/end_game.tscn")
func hurt():
	motion.y -= Jump_speed
	lives -= 1
	if lives < 0:
		end_game()
