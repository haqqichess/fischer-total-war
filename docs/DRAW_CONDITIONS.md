
# Draw Conditions in Fischer Total War

Fischer Total War (FTW) uses a defined set of draw conditions.

These conditions apply to the experimental v1.0-alpha ruleset. They are intended to identify specific situations in which the game must end without a winner.

FTW does not use the traditional 50-move or 75-move rules.

## 1. Overview

FTW v1.0-alpha recognizes four draw conditions:

1. Bishop-lock.
2. Threefold repetition.
3. Fivefold repetition.
4. Mutual immobility.

Bishop-lock, fivefold repetition, and mutual immobility are automatic draw conditions.

Threefold repetition is claimable by the player whose turn it is.

Total elimination takes priority over every draw condition.

## 2. Bishop-Lock

Bishop-lock is an automatic draw based on a specific material and square-color configuration.

The condition is met only when all of the following requirements are satisfied:

1. Every remaining unit on the board is a Bishop.
2. White has at least one Bishop remaining.
3. Black has at least one Bishop remaining.
4. All White Bishops occupy squares of the same color.
5. All Black Bishops occupy squares of the opposite color.

For example, if every White Bishop occupies a light-colored square, every Black Bishop must occupy a dark-colored square.

The reverse arrangement is equally valid.

### 2.1 Why It Is a Draw

A Bishop can only move on squares of the same color.

Under the Bishop-lock configuration, no White Bishop can ever capture a Black Bishop, and no Black Bishop can ever capture a White Bishop.

Because every surviving unit is a Bishop and both players have at least one Bishop, neither player can eliminate the other.

The game is therefore drawn.

### 2.2 Scope of Bishop-Lock

Bishop-lock is a deliberately narrow dead-position condition.

It does not attempt to identify every possible position in which a player cannot achieve total elimination.

The following situations do not automatically qualify:

- A player has no Bishops remaining.
- A player has a King or another piece remaining.
- A Pawn, Rook, Knight, or Queen remains on the board.
- Bishops belonging to the same player occupy both square colors.
- Bishops belonging to both players occupy the same square color.

Promoted Bishops are treated exactly like other Bishops for this condition.

## 3. Threefold Repetition

A player may claim a draw when the current position has occurred at least three times.

The claim must be made before the player whose turn it is makes a normal move or a forced pass.

### 3.1 Occurrences

The initial position counts as the first occurrence.

Every resulting position after a completed non-terminal normal move or forced pass is recorded.

If the same position has already been recorded twice and then occurs again, the player whose turn it is may claim a draw.

### 3.2 Claim Timing

A threefold repetition claim must be made while the repeated position is the current position.

A player cannot claim a draw based solely on a position they expect to reach after making a move.

If the player makes a normal move or is required to make a forced pass without claiming, the opportunity to claim based on that current position has passed.

Threefold repetition does not end the game automatically.

## 4. Fivefold Repetition

The game is automatically drawn when an identical position has occurred five times.

No player claim is required.

The initial position counts as an occurrence.

Positions reached after completed non-terminal normal moves and forced passes are recorded for repetition tracking.

When the occurrence count of the current position reaches five, the game ends immediately as a draw.

## 5. Mutual Immobility

A draw by mutual immobility occurs when:

- Both players still have at least one unit.
- The player whose turn it is has no legal moves.
- The opponent also has no legal moves in the hypothetical position resulting from a forced pass.

This condition distinguishes mutual immobility from an ordinary forced pass.

### 5.1 Evaluation Procedure

To evaluate mutual immobility:

1. Generate all legal moves for the player whose turn it is.
2. If at least one legal move exists, mutual immobility does not apply.
3. If no legal move exists, construct a hypothetical position in which the turn passes to the opponent.
4. Keep the board and castling rights unchanged.
5. Clear the en passant opportunity.
6. Change the side to move to the opponent.
7. Generate all legal moves for the opponent.
8. If the opponent also has no legal moves, declare a draw by mutual immobility.
9. Otherwise, the original player must make a forced pass.

No forced pass is recorded when mutual immobility ends the game.

### 5.2 Difference Between Forced Pass and Mutual Immobility

| Situation | Result |
|---|---|
| Active player has legal moves | The player must make a legal move |
| Active player has no legal moves, opponent would have legal moves after a pass | Forced pass |
| Active player has no legal moves, opponent would also have no legal moves after a pass, and both players have units | Draw by mutual immobility |

The hypothetical pass is used only to determine whether the game is drawn. It does not change the actual game state.

## 6. Position Identity

For repetition purposes, two positions are identical only when all of the following information matches:

1. The type, color, and square of every unit.
2. The side to move.
3. All remaining castling rights.
4. Any currently usable en passant opportunity.

A difference in any of these elements means that the positions are not identical.

### 6.1 Piece Placement

Every unit must match by:

- Piece or Pawn type.
- Color.
- Board square.

The identity of a promoted unit does not independently distinguish it from another unit of the same type and color on the same square, unless a separate right defined by the rules differs.

### 6.2 Side to Move

The side to move is part of position identity.

A position with the same unit placement but a different active player is not identical.

### 6.3 Castling Rights

Castling rights must be tracked separately for each player and each side.

The rights are tied to the original King and the specific original Rook assigned to each side.

Two positions with identical piece placement but different remaining castling rights are not identical.

A lost castling right cannot be restored.

### 6.4 Usable En Passant Opportunity

An en passant opportunity affects position identity only when at least one Pawn belonging to the side to move can actually make the capture.

A raw en passant target square that cannot be used by any Pawn does not distinguish two positions for repetition purposes.

Because FTW has no self-check restrictions, an en passant capture is usable whenever its movement and occupancy requirements are satisfied.

### 6.5 Information Excluded from Position Identity

The following information does not independently affect position identity:

- Fullmove number.
- Halfmove counter.
- Total number of moves played.
- Move history, except where it changes castling rights or en passant availability.
- The original or promoted status of a unit, unless it affects a separate right defined by these rules.

## 7. Position Recording

The initial position is recorded before the first move.

After every completed non-terminal normal move or forced pass:

1. Update the board and relevant game state.
2. Change the side to move.
3. Determine whether an en passant opportunity is usable.
4. Construct the position identity.
5. Record the resulting position.
6. Update its occurrence count.

If a move eliminates the opponent's final unit, the game ends immediately. No additional draw or repetition evaluation is performed.

## 8. Automatic Draw Evaluation

After a completed non-terminal normal move or forced pass, automatic draw conditions are evaluated in the following order:

1. Bishop-lock.
2. Fivefold repetition.
3. Mutual immobility.

If one or more automatic draw conditions are satisfied, the game ends as a draw.

If multiple automatic draw conditions are satisfied simultaneously, the game still has only one result: a draw. The first condition in the list may be recorded as the primary reason.

Threefold repetition is not automatic and must be claimed by the player whose turn it is, before making a normal move or forced pass.

## 9. Draw Conditions Not Used in v1.0-alpha

The following conditions are not part of this ruleset:

- The 50-move rule.
- The 75-move rule.
- A general insufficient-material rule beyond Bishop-lock.
- A draw based solely on a player having only a King remaining.

A position should not be declared drawn merely because it appears difficult to win.

Only the draw conditions explicitly defined in this document apply.

## 10. Priority of Total Elimination

Total elimination always takes priority over every draw condition.

If a move removes the opponent's final unit, the player who made that move wins immediately.

This remains true even if the resulting position might otherwise satisfy a draw condition.

---

For the complete game rules, see [RULES.md](../RULES.md).
