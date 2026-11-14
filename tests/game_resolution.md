
# FTW Game Resolution Tests

**Category:** Turn Management and Game Endings  
**Ruleset:** v1.0-alpha — Red Team Revision Draft  
**Status:** Not Yet Executed

## 1. Purpose

This document tests how Fischer Total War updates and resolves the game state.

The tests cover:

- Total elimination.
- King capture.
- Kingless play.
- Promotion and elimination order.
- Forced passes.
- Mutual immobility.
- Illegal moves.
- Position recording.
- Draw claims.
- Game-end priority.

## 2. Total Elimination

### FTW-GAM-001 — Capturing the Last Opposing Unit Wins the Game

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4R2K
```

**Side to Move:** White

**Units:**

- White Rook on e1.
- White King on h1.
- Black King on e8.
- No other Black units.

**Action:**

```text
Re1xe8
```

**Expected Result:**

- The move is legal.
- The Black King is captured.
- Black has zero units remaining.
- White wins immediately by total elimination.
- No further turn begins.

**Status:** NOT RUN

### FTW-GAM-002 — Capturing the King Does Not Automatically Win

**Initial Position:**

```text
4k3/p7/8/8/8/8/8/4R2K
```

**Side to Move:** White

**Units:**

- White Rook on e1.
- White King on h1.
- Black King on e8.
- Black Pawn on a7.

**Action:**

```text
Re1xe8
```

**Expected Result:**

- The Black King is captured.
- The Black Pawn remains on a7.
- Black still has one unit.
- White has not won.
- The game continues.
- Black may move the remaining Pawn on its turn.

**Status:** NOT RUN

### FTW-GAM-003 — Total Elimination When the Last Non-King Unit Is Captured

**Initial Position:**

```text
7r/6P1/8/8/8/8/8/K7
```

**Side to Move:** White

**Units:**

- White King on a1.
- White Pawn on g7.
- Black Rook on h8.
- Black has no King.

**Action:**

```text
g7xh8=Q
```

**Expected Result:**

- The capture is legal.
- The Black Rook is removed.
- The White Pawn promotes to a Queen on h8.
- Black has zero units remaining.
- White wins immediately after the completed move.
- Promotion is completed before the elimination result is recorded.

**Status:** NOT RUN

## 3. Promotion and Game Resolution

### FTW-GAM-004 — Promotion Capture Does Not End the Game When Opposing Units Remain

**Initial Position:**

A White Pawn on g7 can capture a Black Rook on h8 and promote.

Black also has a King or another surviving unit elsewhere on the board.

**Side to Move:** White

**Action:**

```text
g7xh8=Q
```

**Expected Result:**

- The Black Rook is captured.
- The White Pawn promotes to a Queen.
- The remaining Black unit stays on the board.
- The game continues.

**Status:** NOT RUN

### FTW-GAM-005 — Promotion Is Completed Before Game-End Evaluation

**Initial Position:**

Use the position from FTW-GAM-003.

**Action:**

```text
g7xh8=Q
```

**Expected Result:**

The move is treated as one completed action:

1. Capture the Black Rook.
2. Promote the White Pawn to a Queen.
3. Update the resulting board.
4. Evaluate total elimination.
5. Record the White victory.

The implementation must not terminate the move halfway through the promotion process.

**Status:** NOT RUN

## 4. Forced Pass

### FTW-GAM-006 — Forced Pass Changes the Side to Move

**Fixture Requirement:**

Provide a verified position in which:

- Both players have at least one unit.
- The active player has no legal moves.
- The opponent has at least one legal move after a hypothetical pass.
- No other automatic game-ending condition applies.

**Expected Result:**

- The active player is required to make a forced pass.
- No unit moves.
- No capture occurs.
- The side to move changes.
- The forced pass counts as one ply.
- The pass is recorded as `--`.

**Status:** BLOCKED — A verified fixture is required.

### FTW-GAM-007 — Forced Pass Does Not Change Castling Rights

**Fixture Requirement:**

Use a position that satisfies FTW-GAM-006 and has at least one remaining castling right.

**Expected Result:**

- The forced pass consumes the turn.
- Castling rights remain unchanged.
- The forced pass does not count as a King or Rook move.

**Status:** BLOCKED — A verified fixture is required.

### FTW-GAM-008 — Forced Pass Updates Repetition State

**Fixture Requirement:**

Provide a verified forced-pass position with a known position identity and a known occurrence history.

**Expected Result:**

- The board placement remains unchanged.
- The side to move changes.
- The position is recorded after the pass.
- Repetition tracking uses the updated side to move.
- The forced pass counts as one completed ply.

**Status:** BLOCKED — A verified fixture is required.

### FTW-GAM-009 — No Voluntary Pass

**Initial State:**

Any valid position in which the active player has at least one legal move.

**Action:**

Attempt to pass voluntarily.

**Expected Result:**

- Voluntary passing is illegal.
- The side to move does not change.
- The board remains unchanged.
- The action does not count as a ply.

**Status:** NOT RUN

## 5. Mutual Immobility

### FTW-GAM-010 — Mutual Immobility Produces a Draw Without Recording a Pass

**Fixture Requirement:**

Provide a verified position in which:

- Both players have at least one unit.
- The active player has no legal moves.
- The opponent also has no legal moves after a hypothetical pass.
- No previous terminal condition applies.

**Expected Result:**

- The game ends as a draw by mutual immobility.
- No actual forced pass is recorded.
- The board is not modified by the hypothetical evaluation.
- The side to move is not advanced as part of an actual pass.

**Status:** BLOCKED — A verified fixture is required.

### FTW-GAM-011 — Hypothetical Pass Clears En Passant

**Fixture Requirement:**

Provide a state with an en passant target that is not usable by the active player and a verified forced-pass or mutual-immobility evaluation.

**Expected Result:**

- The hypothetical position clears the en passant opportunity.
- The hypothetical evaluation uses the opponent as the side to move.
- The hypothetical pass does not modify the actual board.
- The result follows the mutual-immobility procedure in `RULES.md`.

**Status:** BLOCKED — A verified fixture is required.

## 6. Illegal Moves

### FTW-GAM-012 — Illegal Move Does Not Change the Board

**Initial Position:**

```text
7k/8/8/8/8/8/P7/R6K
```

**Side to Move:** White

**Action:**

```text
Ra1-a4
```

**Expected Result:**

- The move is illegal because the White Pawn on a2 blocks the Rook.
- The Rook remains on a1.
- The Pawn remains on a2.
- No unit is captured.

**Status:** NOT RUN

### FTW-GAM-013 — Illegal Move Does Not Consume a Turn

**Initial State:**

Use the position from FTW-GAM-012.

**Action:**

Attempt:

```text
Ra1-a4
```

**Expected Result:**

- The move is rejected.
- White remains the side to move.
- No ply is consumed.
- Black does not receive a turn.

**Status:** NOT RUN

### FTW-GAM-014 — Illegal Move Does Not Change Special Rights

**Initial State:**

Use a valid position containing:

- At least one castling right.
- A defined en passant state or other relevant game-state information.

**Action:**

Attempt an illegal move.

**Expected Result:**

- Castling rights remain unchanged.
- En passant availability remains unchanged.
- The board and position history remain unchanged.

**Status:** NOT RUN

## 7. Turn Completion and Position Recording

### FTW-GAM-015 — Normal Move Updates the Side to Move

**Initial Position:**

```text
4k3/8/8/8/8/8/4P3/4K3
```

**Side to Move:** White

**Action:**

```text
e2-e4
```

**Expected Result:**

- The White Pawn moves to e4.
- The side to move changes to Black.
- The resulting position is recorded.
- The position occurrence count is updated.

**Status:** NOT RUN

### FTW-GAM-016 — Castling State Is Updated Before Repetition Recording

**Initial State:**

A valid position with White eligible to castle.

**Action:**

White performs a legal castling move.

**Expected Result:**

- Both White castling rights are removed.
- The side to move changes.
- The resulting position is recorded using the updated castling rights.
- The recorded position must not retain a castling right that was consumed.

**Status:** NOT RUN

### FTW-GAM-017 — En Passant State Is Updated Before Repetition Recording

**Initial State:**

A valid position in which a Pawn makes a two-square advance.

**Action:**

The Pawn completes its double-square advance.

**Expected Result:**

- The en passant target is updated.
- The side to move changes.
- The usability of the en passant opportunity is evaluated for the new active player.
- The resulting position is recorded using the correct en passant state.

**Status:** NOT RUN

## 8. Game-End Priority

### FTW-GAM-018 — Total Elimination Stops Further Game Processing

**Initial State:**

Use the position from FTW-GAM-001.

**Action:**

```text
Re1xe8
```

**Expected Result:**

- Total elimination is detected.
- White is declared the winner immediately.
- No new turn begins.
- No forced pass is processed.
- No additional repetition occurrence is required.
- No draw condition may replace the victory result.

**Status:** NOT RUN

### FTW-GAM-019 — Automatic Draws Are Evaluated After Non-Terminal Moves

**Initial State:**

Provide a valid position where a legal move creates an automatic draw condition without eliminating the opponent's final unit.

**Action:**

Complete the move.

**Expected Result:**

- The move is fully completed.
- The relevant game state is updated.
- The side to move changes.
- The resulting position is recorded.
- Automatic draw conditions are evaluated.
- The game ends as a draw if one is satisfied.

**Status:** BLOCKED — A verified fixture is required.

### FTW-GAM-020 — Threefold Claim Is Available Before a Forced Pass

**Initial State:**

Provide a position that:

- Has occurred at least three times.
- Is the current position.
- Has no legal moves for the active player.
- Does not satisfy mutual immobility.
- Has no automatic draw condition already ending the game.

**Action:**

The active player claims threefold repetition before the forced pass.

**Expected Result:**

- The claim is valid.
- The game ends as a draw.
- No forced pass is recorded.

**Status:** BLOCKED — A verified fixture is required.

## 9. Rules Outside Core Game Resolution

The following matters are intentionally not tested by this core gameplay suite:

- Resignation procedures.
- Draw agreements.
- Chess clock operation.
- Timeout adjudication.
- Tournament scoring.
- Penalties for illegal moves in formal competitions.
- Player eligibility.

Such procedures require separate competition regulations.

## 10. Test Completion

The game-resolution tests must confirm that every completed move follows the order defined in `RULES.md`.

In particular:

- Normal moves update all special rights before position recording.
- Promotion is completed before elimination is evaluated.
- Total elimination ends the game immediately.
- Forced pass is not treated as a normal move.
- Mutual immobility does not create an actual pass.
- Illegal moves do not modify game state.
- Repetition tracking uses the complete position identity.

---

For the complete gameplay rules, see [RULES.md](../RULES.md).
