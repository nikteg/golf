extends Node3D

var IS_ROTATING := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("right_click"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		IS_ROTATING = true
		return
		
	if Input.is_action_just_released("right_click"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		IS_ROTATING = false
		return
		
	pass

func _input(event):
	if IS_ROTATING && event is InputEventMouseMotion:
		rotate_object_local(Vector3.UP, -event.relative.x * .01)
