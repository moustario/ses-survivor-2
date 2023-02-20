extends KinematicBody2D

export var mob_speed := 150 setget set_mob_speed

func _ready(): 
	position = get_parent().get_node("Player").position + Vector2(1000, 0).rotated(rand_range(0, 2*PI))
func _physics_process(delta): 
	var move = (get_parent().get_node("Player").position - position).normalized() * $AnimatedSprite.speed_scale / delta;
	move_and_slide(move)

func set_mob_speed(speed):
	mob_speed = speed

