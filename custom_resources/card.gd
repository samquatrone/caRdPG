class_name Card
extends Resource

enum Type {SPELL, UNIT}
enum Target {SELF, OPPONENT, SINGLE_ALLY, SINGLE_ENEMY, SINGLE_ANY, ALL_ALLIES, ALL_ENEMIES, EVERYONE}

@export_group("Card Attributes")
@export var id: String
@export var type: Type
@export var target: Target


func is_single_targeted() -> bool:
	return target == Target.SINGLE_ALLY or target == Target.SINGLE_ENEMY or target == Target.SINGLE_ANY
