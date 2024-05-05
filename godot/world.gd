extends Node2D

var red_particle_scn = load("res://red_particle.tscn")
var blue_particle_scn = load("res://blue_particle.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 100:
		new_particle(1)
	for i in 5:
		new_particle(2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#i=0
	#while i < 100:
		#new_particle(2)
		#i+=1

func new_particle(color):
	if color == 1:
		var new_particle_instance = red_particle_scn.instantiate()
		new_particle_instance.position = Vector2(randf_range(0, 1920), randf_range(0, 1080))
		add_child(new_particle_instance)
	if color == 2:
		var new_particle_instance = blue_particle_scn.instantiate()
		new_particle_instance.position = Vector2(randf_range(0, 1920), randf_range(0, 1080))
		add_child(new_particle_instance)
