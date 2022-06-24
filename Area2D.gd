extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == 'player':
		global.unlockedLevels += 1 # Unlock the next level after completing the present one
