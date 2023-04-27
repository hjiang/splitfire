extends Area2D

signal fire_weapon(bullet, origin_position)

@export var speed = 400
var screen_size
var velocity = Vector2.ZERO

var Bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
    screen_size = get_viewport_rect().size
    hide()

func _physics_process(delta):
    velocity = Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    if Input.is_action_pressed("move_down"):
        velocity.y += 1
    if Input.is_action_pressed("move_up"):
        velocity.y -= 1

    if velocity.length() > 0:
        velocity = velocity.normalized() * speed

    position += velocity * delta
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)


func _input(event):
    if event.is_action_pressed("fire_weapon"):
        fire_weapon.emit(Bullet, $FiringPosition.global_position)

func start(pos):
    position = pos
    show()
    $CollisionShape2D.disabled = false
