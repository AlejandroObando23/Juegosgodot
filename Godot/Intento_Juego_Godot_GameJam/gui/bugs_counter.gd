class_name bugs_counter extends Panel


var _bugs_collected: int = 0

@onready var _bugs_label :=$Label2  as Label


func _ready() -> void:
	_bugs_label.set_text(str(_bugs_collected))
	($AnimatedSprite2D as AnimatedSprite2D).play()


func coin_collected() -> void:
	_bugs_collected += 1
	_bugs_label.set_text(str(_bugs_collected))
