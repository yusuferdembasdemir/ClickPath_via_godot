extends Node

var bg_unlocked = false # Check if the background is purchased,yay
var sbg_unlocked = false #Check if shop bg is purchased
var click_count = 0 # Current total clicks,make this 1m value plsss

const SAVE_PATH = "user://savegame.cfg"
var config = ConfigFile.new()

func _ready():
	load_game()

func save_game():
	config.set_value("Player", "clicks", click_count)
	config.set_value("Upgrades", "bg_unlocked", bg_unlocked)
	
	var err = config.save(SAVE_PATH)
	if err != OK:
		print("bimbimbam")

func load_game():
	var err = config.load(SAVE_PATH)
	if err != OK:
		return
		
	click_count = config.get_value("Player", "clicks", 0)
	bg_unlocked = config.get_value("Upgrades", "bg_unlocked", false)

func reset_game():
	click_count = 0
	bg_unlocked = false
	var dir = DirAccess.open("user://")
	if dir and dir.file_exists("savegame.cfg"):
		dir.remove("savegame.cfg")
