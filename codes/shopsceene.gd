extends Node2D

func _ready():
	update_label()
	if global.bg_unlocked == true:
		var btn = find_child("BG_Button")
		if btn:
			btn.queue_free()
	
	if global.sbg_unlocked == true:
		$ShopBG/BG.visible = true
	else:
		$ShopBG/BG.visible = false

func _on_sbg_button_pressed() -> void:
	if global.click_count >= 30:
		global.click_count -= 30
		global.sbg_unlocked = true
		$ShopBG/BG.visible = true
		$SBGButton.queue_free()
		
		if has_node("SBGButton"):
			$SBGButton.queue_free()
			
		update_label()
		global.save_game()
		print("bg un loc ked")
	else:
		print("Not enough clickos yet huh")

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
		global.save_game() # Save the purchase permanently
		print("bg un loc ked")
	else:
		print("Not enough clicks yet mannn!")


		
	
