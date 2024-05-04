#extends CharacterBody2D
extends RigidBody2D

var red_particle_mass = 10
var particles_around = []

# Called when the node enters the scene tree for the first time.
func _ready():
	self.mass = red_particle_mass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(particles_around)
	pass


func _on_area_2d_body_entered(body):
	if body.name != self.name:
		print("test")
		particles_around.append(body)
	
func _on_area_2d_body_exited(body):
	particles_around.erase(body)

	
func draft_func(body):
	var force = 0.0
	var acceleration = 1
	
	if body.name != self.name:
		var distance = position.distance_squared_to(body.position)
		force = acceleration * self.mass * body.mass / distance
		
		#print(force)
		#print(body.position - position)
		#print(body.mass)


