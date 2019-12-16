# Good tutorial:
# https://gdscript.com/tutorials

# Position in 3D space
global_transform.origin

vector = vector.rotated(Vector3.UP, rotation.y)

#Use both in a ready process:
# Search first object in the group
target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player" (recommended)

# Search node with the name
target = get_tree().get_root().find_node("Player", true, false) # Find the node with the name "Player"

# If the player enters an area node
if body.is_in_group("Player"):

# Ideal with area nodes:
if "variable" in body: # check if the node has this variable
if method() in body: # check if the node has this method

# Ideal for projectiles
yield(get_tree().create_timer(3), "timeout") # Wait 3 seconds

# Run the function of objects in a group
get_tree().call_group("GroupName", "Method", Argument1, Argument2)

# If it's of type RigidBody:
get_collider().get_class() == "RigidBody"

randomize()
rand_range(float from, float to)

translation # local position
global_transform.origin # global position

number = clamp(number, 0, 10) # Clamp between 0 and 10
export (float, 0, 10) var number = 0 #Clamp an exported variable

# Access Mesh and Material settings:
self.mesh
self.mesh.surface_get_material(0)

# Access different variables by their number
var variable1 = 12
var number = 1
print(get(str("variable", number)) + 5)

# Invert boolean:
value = !value

# Wheel:
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				pass
