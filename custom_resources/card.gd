class_name Card
extends Resource

enum Type {SPELL, UNIT}
enum Target {SELF, SINGLE_ALLY, ALL_ALLIES, SINGLE_ENEMY, ALL_ENEMIES, OPPONENT, EVERYONE}

@export_group("Card Attributes")
@export var id: String
@export var type: Type
@export var target: Target


func is_single_targeted() -> bool:
	return target == Target.SINGLE_ALLY or target == Target.SINGLE_ENEMY
