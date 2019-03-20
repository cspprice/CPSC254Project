extends KinematicBody2D

var direction = Vector2()

const TOP = Vector2(0, -1)
const RIGHT = Vector2(1, 0)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)

var speed = 0
const MAX_SPEED = 400

var velocity = Vector2()

export(int) var cellSize = 32

func _ready():
	
	pass

func _process(delta):
	var is_moving = Input.is_action_pressed('up') or Input.is_action_pressed('right') or Input.is_action_pressed('down') or Input.is_action_pressed('left')
	
	direction =  Vector2()
	if is_moving :
		speed = MAX_SPEED
		
		if Input.is_action_pressed('up'):
			direction += TOP
		elif Input.is_action_pressed('right'):
			direction += RIGHT
		if Input.is_action_pressed('down'):
			direction += DOWN
		elif Input.is_action_pressed('left'):
			direction += LEFT
	
	else:
		speed = 0
		
	velocity = speed * direction * delta
	
	move_and_collide(velocity)
