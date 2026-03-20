extends Node2D

func _ready():
	update_label()
	# Check if the button should exist when entering the shop
	if global.bg_unlocked == true:
		# Using find_child for safety in case the node path is slightly different
		var btn = find_child("BG_Button")
		if btn:
			btn.queue_free()

func _on_button_pressed() -> void:
	# Back to main scene
	get_tree().change_scene_to_file("res://scenes/main.tscn")
		
func update_label():
	$Label.text = "Clicks: " + str(global.click_count)

func _on_bg_button_pressed() -> void:
	# Logic for purchasing the background
	if global.click_count >= 30:
		global.click_count -= 30
		global.bg_unlocked = true # Save the purchase state
		
		# Remove only the button, not the whole scene
		if has_node("BG_Button"):
			$BG_Button.queue_free()
		
		update_label() # Refresh UI immediately
		print("bg un loc ked")
	else:
		print("Not enough clicks yet mannn!")
