extends Control


@onready var menu = $menu
@onready var settings = $settings

func _on_settings_pressed():
	menu.hide()
	settings.show()
func _on_in_the_menu_pressed():
	menu.show()
	settings.hide()

