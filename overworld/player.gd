extends CharacterBody2D

@export var speed = 100.0


@onready var anim = $AnimatedSprite2D
@onready var stopped_moving: bool = false
@onready var was_moving: bool = false
@onready var direction = Vector2()
@onready var prev_direction = Vector2()


func _ready():
	pass


func _physics_process(delta):
	prev_direction = direction
	direction = Input.get_vector("left", "right", "up", "down")
	if direction.length() > 1.0:
		direction = direction.normalized()

	velocity = direction * speed

	update_animation()

	move_and_slide()


func update_animation():
	if direction.length() > 0.2:
		was_moving = true
		anim.flip_h = direction.x < -0.5
		if direction.y > 0.8:
			anim.play("front_walk")
		if direction.y < -0.8:
			anim.play("back_walk")
		if abs(direction.x) > 0.5:
			anim.play("side_walk")
	else:
		if was_moving:
			if prev_direction.y > 0.8:
				anim.play("front_idle")
			if prev_direction.y < -0.8:
				anim.play("back_idle")
			if abs(prev_direction.x) > 0.5:
				anim.play("side_idle")
		was_moving = false
