class_name Bug extends Area2D
## Collectible that disappears when the player touches it.


@onready var animation_player := $AnimationPlayer as AnimationPlayer

var fall_speed: float = 100.0
var is_on_platform: bool = false

func _ready() -> void:
	set_process(true)

func _process(delta: float) -> void:
	if not is_on_platform:
		position.y += fall_speed * delta
	if position.y > get_viewport().size.y:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	animation_player.play(&"picked")
	(body as Player).bugs_collected.emit()
	
