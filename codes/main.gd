extends Node2D

#welcome there!!
func _ready():
	#bg button
	update_label()
	if global.bg_unlocked == true:
		$BGLayer/Bg.visible = true
	else:
		$BGLayer/Bg.visible = false
		
func _on_button_pressed():
	var previous_digit_count = str(global.click_count).length()
	
	global.click_count += 1
	update_label()
	global.save_game() 
	
	var current_digit_count = str(global.click_count).length()
	
	if current_digit_count > previous_digit_count:
		$Label.position.x -= 15
		
func update_label():
	$Label.text = "Clicks: " + str(global.click_count)

func _on_shopbutton_pressed() -> void:
	#Doin this in 1.30 am n I am so tired,this code goes to shop part
	get_tree().change_scene_to_file("res://scenes/shopsceene.tscn")

func _on_confirmation_dialog_confirmed():
	global.reset_game()
	get_tree().reload_current_scene() # boom, back to zero

func _on_reset_pressed() -> void:
	$ConfirmationDialog.popup_centered() # u sure bro?!
