extends CardState

const MOUSE_Y_SNAPBACK_THRESHOLD = 500


func enter():
	card_ui.color.color = Color.WEB_PURPLE
	card_ui.state.text = "AIMING"
	card_ui.targets.clear()
	# Animate card here if you wish
	card_ui.drop_point_detector.monitoring = false
	Events.card_aim_stated.emit(card_ui)


func exit():
	Events.card_aim_ended.emit(card_ui)


func on_input(event: InputEvent):
	var mouse_motion = event is InputEventMouseMotion
	var mouse_at_bottom = card_ui.get_global_mouse_position().y > MOUSE_Y_SNAPBACK_THRESHOLD
	
	if (mouse_motion and mouse_at_bottom) or event.is_action_pressed("right_mouse"):
		transition_requested.emit(self, CardState.State.BASE)
	elif event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse"):
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)

