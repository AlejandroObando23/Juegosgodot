extends Node2D

# Variables para configurar la lluvia de monedas
@export var coin_scene: PackedScene=preload("res://level/coin.tscn")
@export var spawn_interval: float = 1.0
@export var min_x: float = 0.0
@export var max_x: float = 800.0
@export var min_y: float = -50.0
@export var fall_speed: float = 100.0

var _spawn_timer: Timer

func _ready() -> void:
	# Crear y configurar el temporizador
	_spawn_timer = Timer.new()
	_spawn_timer.wait_time = spawn_interval
	_spawn_timer.one_shot = false  # Esto asegura que el temporizador siga corriendo
	_spawn_timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))
	add_child(_spawn_timer)
	_spawn_timer.start()

func _on_spawn_timer_timeout() -> void:
	_spawn_coin()

func _spawn_coin() -> void:
	if coin_scene:
		var coin = coin_scene.instantiate() as Node2D
		coin.position.x = randf_range(min_x, max_x)
		coin.position.y = min_y
		add_child(coin)
		coin.set("fall_speed", fall_speed)
