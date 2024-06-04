class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@export var card: Card : set = _set_card

# Debug
@onready var color: ColorRect = $Color
@onready var state: Label = $State

@onready var card_base = $CardBase
@onready var card_art = $CardArt
@onready var cost = $Cost
@onready var card_text = $CardText
@onready var drop_point_detector = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var targets: Array[Node] = []

var parent: Control
var tween: Tween


func _ready():
	card_state_machine.init(self)


func _input(event: InputEvent):
	card_state_machine.on_input(event)


func animate_to_position(new_position: Vector2, duration: float):
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, duration)


func _on_gui_input(event: InputEvent):
	card_state_machine.on_gui_input(event)


func _on_mouse_entered():
	card_state_machine.on_mouse_entered()


func _on_mouse_exited():
	card_state_machine.on_mouse_exited()


func _set_card(value: Card):
	if not is_node_ready():
		await ready
	
	card = value
	cost.text = str(card.cost)
	card_art.texture = card.card_art
	card_text.text = str("[center]",card.tooltip_text,"[/center]")


func _on_drop_point_detector_area_entered(area: Area2D):
	if not targets.has(area):
		targets.append(area)


func _on_drop_point_detector_area_exited(area: Area2D):
	targets.erase(area)
