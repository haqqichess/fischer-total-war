
# Draw Conditions in Fischer Total War

FTW uses a small set of specific draw conditions. These rules are intended to cover positions in which the game cannot reasonably continue toward a decisive result under the current rules.

The following conditions apply to version v1.0-alpha.

## 1. Bishop-Lock

Bishop-lock is an automatic draw based on a specific material and square-color configuration.

The condition is met only when all of the following are true:

1. Every surviving unit on the board is a Bishop.
2. Both players have at least one Bishop remaining.
3. All Bishops belonging to one player occupy squares of the same color.
4. All Bishops belonging to the other player occupy squares of the opposite color.

When these conditions are met, the Bishops can never capture one another.

The position is therefore declared a draw.

### Scope of This Rule

Bishop-lock is a deliberately narrow condition for the alpha version. It is not a complete system for detecting every position in which a win is impossible.

Other material configurations are not automatically considered drawn under this rule.

## 2. Threefold Repetition

A player may claim a draw when the current position has occurred at least three times.

The claim must be made before the player makes a normal move or before a forced pass is recorded for that turn.

### Position Identity

For repetition purposes, two positions are considered identical only when all of the following match:

- The type, color, and square of every unit.
- The side to move.
- All remaining castling rights, including the rights associated with the original King and original Rooks.
- Any usable en passant opportunity.

A position with the same pieces on the same squares is not necessarily identical if the side to move or any relevant special right is different.

### Position Recording

The starting position counts as the first occurrence.

A new position is recorded after every completed move and forced pass, unless the game has already ended by total elimination.

## 3. Fivefold Repetition

Fivefold repetition is an automatic draw.

When an identical position has occurred five times, the game ends immediately as a draw.

Unlike threefold repetition, this condition does not require a player to make a claim.

## 4. Mutual Immobility

A draw by mutual immobility occurs when:

- Both players still have at least one unit.
- Neither player has any legal move in the same board position.

If only the player whose turn it is has no legal moves, that player must make a forced pass, provided the opponent has at least one legal move.

If neither player can move, the game is drawn instead of recording a forced pass.

Total elimination takes priority. A player who has eliminated every opposing unit wins rather than receiving a draw through mutual immobility.

## 5. Draws Not Used in v1.0-alpha

The following rules are not part of the current draft:

- The 50-move rule.
- The 75-move rule.
- A general insufficient-material rule beyond the defined Bishop-lock condition.

No additional dead-position conditions should be assumed unless they are added to a future version of the rules.

## 6. Priority

Draw conditions must be evaluated alongside the game-end priority defined in `RULES.md`.

Total elimination is checked first and always takes precedence over a draw.

Automatic draw conditions are checked before a player is required to make a forced pass. A threefold draw may be claimed before the next normal move or forced pass.

---

For the complete game rules, see [RULES.md](../RULES.md).
