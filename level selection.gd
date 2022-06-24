extends Control

func _ready():
	pass

func _on_1_pressed():
	get_tree().change_scene("res://Level1.tscn")


func _on_2_pressed():
	get_tree().change_scene("res://level2.tscn")


func _on_Button3_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_3_pressed():
	get_tree().change_scene("res://level3.tscn")
