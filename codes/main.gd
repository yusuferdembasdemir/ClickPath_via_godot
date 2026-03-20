extends Node2D
#welcome there!!
func _ready():
	update_label()
	# Apply background visibility based on global status
	if global.bg_unlocked == true:
		$BGLayer/Bg.visible = true
	else:
		$BGLayer/Bg.visible = false
		
func _on_button_pressed():
	# Store the digit count before incrementing
	var previous_digit_count = str(global.click_count).length()
	
	global.click_count += 1
	update_label()
	
	# Check if the number of digits increased
	var current_digit_count = str(global.click_count).length()
	
	if current_digit_count > previous_digit_count:
		$Label.position.x -= 15
		
func update_label():
	$Label.text = "Clicks: " + str(global.click_count)

func _on_shopbutton_pressed() -> void:
	# Switch to shop scene
	get_tree().change_scene_to_file("res://scenes/shopsceene.tscn")
