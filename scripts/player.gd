extends CharacterBody2D

const BASE_SPEED = 100.0

enum Direction {N, NE, E, SE, S, SW, W, NW}
var direction = Direction.S
var is_moving: bool = false



func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var move_speed = BASE_SPEED
	var anim = $AnimatedSprite2D

	if Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_down"):
			is_moving = false
		elif Input.is_action_pressed("ui_left"):
			is_moving = true
			direction = Direction.NW
		elif Input.is_action_pressed("ui_right"):
			is_moving = true
			direction = Direction.NE
		else:
			is_moving = true
			direction = Direction.N
	elif Input.is_action_pressed("ui_down"):
		is_moving = true
		if Input.is_action_pressed("ui_left"):
			direction = Direction.SW
		elif Input.is_action_pressed("ui_right"):
			direction = Direction.SE
		else:
			direction = Direction.S
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_right"):
			is_moving = false
		else:
			is_moving = true
			direction = Direction.W
	elif Input.is_action_pressed("ui_right"):
		is_moving = true
		direction = Direction.E
	else:
		is_moving = false
	
	match direction:
		Direction.N:
			anim.flip_h = false
			if is_moving:
				anim.play("back_walk")
				velocity.x = 0
				velocity.y = -move_speed
			else:
				anim.play("back_idle")
				velocity.x = 0
				velocity.y = 0
		Direction.S:
			anim.flip_h = false
			if is_moving:
				anim.play("front_walk")
				velocity.x = 0
				velocity.y = move_speed
			else:
				anim.play("front_idle")
				velocity.x = 0
				velocity.y = 0
		Direction.E:
			anim.flip_h = false
			if is_moving:
				anim.play("side_walk")
				velocity.x = move_speed
				velocity.y = 0
			else:
				anim.play("side_idle")
				velocity.x = 0
				velocity.y = 0
		Direction.W:
			anim.flip_h = true
			if is_moving:
				anim.play("side_walk")
				velocity.x = -move_speed
				velocity.y = 0
			else:
				anim.play("side_idle")
				velocity.x = 0
				velocity.y = 0
		Direction.NW:
			if Input.is_action_just_pressed("ui_up"):
				anim.flip_h = false
				if is_moving:
					anim.play("back_walk")
					velocity.x = -70.7107
					velocity.y = -70.7107
				else:
					anim.play("back_idle")
					velocity.x = 0
					velocity.y = 0
			else:
				anim.flip_h = true
				if is_moving:
					anim.play("side_walk")
					velocity.x = -70.7107
					velocity.y = -70.7107
				else:
					anim.play("side_idle")
					velocity.x = 0
					velocity.y = 0
		Direction.NE:
			anim.flip_h = false
			if Input.is_action_just_pressed("ui_up"):
				if is_moving:
					anim.play("back_walk")
					velocity.x = 70.7107
					velocity.y = -70.7107
				else:
					anim.play("back_idle")
					velocity.x = 0
					velocity.y = 0
			else:
				if is_moving:
					anim.play("side_walk")
					velocity.x = 70.7107
					velocity.y = -70.7107
				else:
					anim.play("side_idle")
					velocity.x = 0
					velocity.y = 0
		Direction.SW:
			if Input.is_action_just_pressed("ui_down"):
				anim.flip_h = false
				if is_moving:
					anim.play("front_walk")
					velocity.x = -70.7107
					velocity.y = 70.7107
				else:
					anim.play("front_idle")
					velocity.x = 0
					velocity.y = 0
			else:
				anim.flip_h = true
				if is_moving:
					anim.play("side_walk")
					velocity.x = -70.7107
					velocity.y = 70.7107
				else:
					anim.play("side_idle")
					velocity.x = 0
					velocity.y = 0
		Direction.SE:
			anim.flip_h = false
			if Input.is_action_just_pressed("ui_up"):
				if is_moving:
					anim.play("back_walk")
					velocity.x = 70.7107
					velocity.y = 70.7107
				else:
					anim.play("back_idle")
					velocity.x = 0
					velocity.y = 0
			else:
				if is_moving:
					anim.play("side_walk")
					velocity.x = 70.7107
					velocity.y = 70.7107
				else:
					anim.play("side_idle")
					velocity.x = 0
					velocity.y = 0
	
	move_and_slide()
	

