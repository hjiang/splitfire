extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
    new_game()


func new_game():
    $Player.start($StartPosition.position)


func _on_player_fire_weapon(Bullet, origin_position):
    var fired_bullet = Bullet.instantiate()
    fired_bullet.position = origin_position
    add_child(fired_bullet)
