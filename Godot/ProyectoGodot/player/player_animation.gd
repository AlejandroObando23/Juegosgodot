extends AnimatedSprite2D


func _on_player_animates(motion):
	if motion.y <0:
		play("Jump")
	elif motion.x <0:
		play("Walk")
		flip_h=true
	elif motion.x >0:
		play("Walk")
		flip_h=false
		
	else:
		play("Stand")
