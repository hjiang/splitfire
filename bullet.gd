extends RigidBody2D

var velocity = Vector2(0, -2000)

func _physics_process(delta):
    move_and_collide(velocity * delta)

func _on_visible_on_screen_notifier_2d_screen_exited():
    queue_free()
