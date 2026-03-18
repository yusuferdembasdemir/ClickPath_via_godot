extends Node2D

# Current click count,do this 'more and moreee'
var click_count = 0

func _ready():
	update_label()
	
func _on_button_pressed():
	# Store the current digit count 
	var previous_digit_count = str(click_count).length()
	
	# Increment the count
	click_count += 1
	$Label.text = "Clicks: " + str(click_count)
	
	# Check the new digit count (e.g., 10 is 2 digits)
	var current_digit_count = str(click_count).length()
	
	# If digit count increased, move the UI to the left
	if current_digit_count > previous_digit_count:
		$Label.position.x -= 15
		
func update_label():
	$Label.text = "Clicks: " + str(click_count)


func _on_shopbutton_pressed() -> void:
	#Doin this in 1.30 am n I am so tired,this code goes to shop part
	get_tree().change_scene_to_file("res://scenes/shopsceene.tscn")
