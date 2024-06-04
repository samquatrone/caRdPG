# TODO Items
- Create player and enemy sprites
- Fix order of hand changing when card is returned to base state
- Implement stats for players
  - health
  - mana
- Implement basic card logic
  - decrease mana when played
- Implement card effects
  - damage
  - heal
- Implement card selection highlighting


- Implement Units
  - Update card resource so that it makes more sense for units
    - (Currently you must choose a target type such as ENEMY_SINGLE)
  - Reparent CardUI when released over Board collision shape
  - Alternatively, create the corresponding unit under the Units HBox and handle the UI from here
  - Handle attack action: implement state machine or reuse card state machine


- Implement deck/draw system
- Implement card resolution stack


- Player/Opponent turns
  - Upkeep/initial phase
  - action phase
  - end turn

- Opponent AI