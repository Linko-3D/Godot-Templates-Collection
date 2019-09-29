extends OmniLight

export var ID = 0

func trigger(trigger_ID, enable):
	if trigger_ID == ID:
		if enable:
			light_energy = 16
			light_indirect_energy = 16
		else:
			light_energy = 0
			light_indirect_energy = 0