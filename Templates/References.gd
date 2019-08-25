get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"
target = get_tree().get_root().find_node("Player", true, false) # Find the node with the name "Player"

if "variable" in body: # check if there is a variable

yield(get_tree().create_timer(3), "timeout") # Wait 3 seconds

randomize()
rand_range(float from, float to)