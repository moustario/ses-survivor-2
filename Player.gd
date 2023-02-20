extends Node2D
export var player_speed := 200 setget set_player_speed

func _physics_process(delta): 
	var input = Vector2()
	if Input.is_key_pressed(KEY_RIGHT): 
		input.x += 1 
	if Input.is_key_pressed(KEY_LEFT): 
		input.x -= 1 
	if Input.is_key_pressed(KEY_DOWN):
		input.y += 1 
	if Input.is_key_pressed(KEY_UP):
		input.y -= 1 
	input = input.normalized() * $AnimatedSprite.speed_scale * player_speed * delta
	
	# Move the player 

	position += input

func shoot(): 
	add_child(load("res://Bullet.tscn").instance())

func spawn(): 
	get_parent().add_child(load("res://Enemy.tscn").instance())

func enemyContact(enemyHitbox): 
	$DeathAnimationPlayer.play("Death")
	# wait for death animation to finish
	yield($DeathAnimationPlayer, "animation_finished")
	# reload the scene
	get_tree().reload_current_scene() 

func set_player_speed(new_speed): 
	player_speed = new_speed
