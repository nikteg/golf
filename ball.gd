extends RigidBody3D

var shooting := false
var start_position := Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Input.is_action_just_released("left_click"):
		if shooting:
			print("Should shoot")
			shooting = false
			#add_constant_central_force()
	
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseMotion:
		if shooting:
				
			var from = %camera.project_ray_origin(event.position)
			var to = from + %camera.project_ray_normal(event.position) * 100
			var cursorPos = Plane(Vector3.UP, transform.origin.y).intersects_ray(from, to)
			print("moving: ", cursorPos)
			
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shooting = true
			start_position = position
			print("start: ", position)
