extends CharacterBody2D

@onready var Sprite = $Sprite2D
@onready var AnimTree = $AnimationTree

var statemachine

var dir = Vector2.ZERO
var speed = 3
var deltamult = 1000

func _ready():
	AnimTree.active = true
	statemachine = AnimTree["parameters/playback"]


func _input(event):
	if event.is_action_pressed("Esc"):
		Manager.ReqQuit()


func _physics_process(delta):
	
	# SPRITE
	if dir.x == -1:
		Sprite.flip_h = true
	elif dir.x == 1:
		Sprite.flip_h = false
	
	if dir != Vector2.ZERO:
		statemachine.travel("Walk")
	else:
		statemachine.travel("Idle")
	
	if Input.is_action_just_pressed("Attack"):
		statemachine.travel("Attack")
	
	if Input.is_action_just_pressed("Interact"):
		pass
	
	if Input.is_action_pressed("Parry"):
		statemachine.travel("Parry")
	
	
	# MOVEMENT
	if Input.is_action_pressed("MoveUp"):
		dir.y = -1
	elif Input.is_action_pressed("MoveDown"):
		dir.y = 1
	else:
		dir.y = 0
	
	if Input.is_action_pressed("MoveLeft"):
		dir.x = -1
	elif Input.is_action_pressed("MoveRight"):
		dir.x = 1
	else:
		dir.x = 0
	
	velocity = dir * speed * delta * deltamult
	move_and_slide()
