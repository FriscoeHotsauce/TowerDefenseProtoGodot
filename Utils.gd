
static func getClosestFromList(object_list, turret_position, turret_range):
	var closestObject = null
	var closestObjectDisctance = 100000.0
	for object in object_list:
		var distance_delta = object.position.distance_to(turret_position)
		if(distance_delta < turret_range && distance_delta < closestObjectDisctance):
			closestObject = object
			closestObjectDisctance = distance_delta
	
	return closestObject
