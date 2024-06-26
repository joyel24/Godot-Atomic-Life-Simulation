#extends CharacterBody2D
extends RigidBody2D

const SCR_WIDTH = 1920
const SCR_HIGH = 1080

var red_particle_mass = 0.1
var particles_arround = []
var accel_coef = 1
var impulse_coef = 100

func _ready():
	self.mass = red_particle_mass
	pass # Replace with function body.

func _process(delta):
	self.apply_impulse(gravity_to_particles_arround())
	stay_on_screen()


func _on_area_2d_body_entered(body):
	if body.name != self.name:
		particles_arround.append(body)
	
func _on_area_2d_body_exited(body):
	particles_arround.erase(body)

func gravity_to_1_particle(body):
	var force = 0.0
	if body != self:
		var distance = position.distance_squared_to(body.position)
		if distance < 400:
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
