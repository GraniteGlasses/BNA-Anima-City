extends Area2D


@onready var interaction_area: InteractionArea = $InteractionArea

func ready():
	interaction_area.interact = Callable(self, "on interact")


func _on_interact():
	print("Oh, hello Michiru.")
