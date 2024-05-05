#extends CharacterBody2D
extends RigidBody2D

const SCR_WIDTH = 1920
const SCR_HIGH = 1080

var blue_particle_mass = 50
var particles_arround = []
var accel_coef = 1 #what ts is: accel_coef=g=9.81 for earth for ex
var impulse_coef = 1000


func _ready():
	self.mass = blue_particle_mass
	pass # Replace with function body.

func _process(delta):
	self.apply_impulse(gravity_to_particles_arround())
	#print(particles_arround)
	stay_on_screen()


#func _on_area_2d_body_enteblue(body):
	##if body != self:
	#print("tttt")
	#particles_arround.append(body)
	#
#func _on_area_2d_body_exited(body):
	#particles_arround.erase(body)

func gravity_to_1_particle(body):
	var force = 0.0
	if body != self:
		var distance = position.distance_squared_to(body.position)
		if distance < 200:
			return Vector2(0,0)
		#print(distance)
		force = accel_coef * self.mass * body.mass / distance
		var vector = (body.position - position).normalized()
		return force*vector

func gravity_to_particles_arround():
	var accel = Vector2.ZERO
	for body in particles_arround:
		if body != self:
			var acc = gravity_to_1_particle(body)
			accel += acc
	return accel*impulse_coef

func stay_on_screen():
	if self.position.x > SCR_WIDTH:
		self.position.x = 0
	elif self.position.x < 0:
		self.position.x = SCR_WIDTH
		
	if self.position.y > SCR_HIGH:
		self.position.y = 0
	elif self.position.y < 0:
		self.position.y = SCR_HIGH


func _on_area_2d_body_entered(body):
	if body != self:
		particles_arround.append(body)


func _on_area_2d_body_exited(body):
	particles_arround.erase(body)
	#pass # Replace with function body.
