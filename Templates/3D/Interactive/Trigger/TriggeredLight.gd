extends OmniLight

export var ID = 0

func _ready():
	disable()

func trigger(trigger_ID, enable):
	if trigger_ID == ID:
		if enable:
			enable()
		else:
			disable()

func enable():
	light_energy = 16
	light_indirect_energy = 16

func disable():
	light_energy = 0
	light_indirect_energy = 0