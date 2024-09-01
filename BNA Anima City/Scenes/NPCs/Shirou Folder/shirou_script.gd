extends Node2D


@export var dialogue_rescource: DialogueResource
@export var dialogue_start: String = "start"

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "talk")

func action():
	DialogueManager.show_example_dialogue_balloon(dialogue_rescource, dialogue_start)

func talk():
	if global.dialogue:
		pass
	else:
		action()
		global.dialogue = true
