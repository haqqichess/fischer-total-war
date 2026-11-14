
# FTW Draw Condition and Repetition Tests

**Category:** Draw Conditions and Position Identity  
**Ruleset:** v1.0-alpha — Red Team Revision Draft  
**Status:** Not Yet Executed

## 1. Purpose

This document tests the draw conditions and repetition-tracking rules of Fischer Total War.

The tests cover:

- Bishop-lock.
- Threefold repetition.
- Fivefold repetition.
- Mutual immobility.
- Position identity.
- Castling-right differences.
- En passant differences.
- The absence of traditional move-count draw rules.

## 2. Bishop-Lock

### FTW-DRW-001 — Valid Bishop-Lock Position

**Initial Position:**

```text
b7/8/8/8/8/8/8/2B5
```

**Side to Move:** White

**Units:**

- White Bishop on c1.
- Black Bishop on a8.
- No other units remain.

**Expected Result:**

- White and Black each have at least one Bishop.
- The White Bishop occupies a dark square.
- The Black Bishop occupies a light square.
- All remaining units are Bishops.
- The game is automatically drawn by Bishop-lock.

**Status:** NOT RUN

### FTW-DRW-002 — Bishop-Lock Is Not Triggered When a King Remains

**Initial Position:**

```text
b6k/8/8/8/8/8/8/2B1K3
```

**Side to Move:** White

**Expected Result:**

- Both players have a Bishop.
- Bishops occupy opposite square colors.
- Kings also remain on the board.
- Bishop-lock is not triggered.

**Status:** NOT RUN

### FTW-DRW-003 — Bishop-Lock Is Not Triggered When Bishops Share a Square Color

**Initial Position:**

```text
1b6/8/8/8/8/8/8/2B5
```

**Side to Move:** White

**Expected Result:**

- All remaining units are Bishops.
- Both players have at least one Bishop.
- Both Bishops occupy squares of the same color.
- Bishop-lock is not triggered.

**Status:** NOT RUN

### FTW-DRW-004 — Total Elimination Takes Priority Over Bishop-Lock

**Resulting Position:**

A position reached after a completed move in which:

- White has at least one Bishop remaining.
- Black has zero units remaining.
- No Black unit remains on the board.

**Expected Result:**

- Bishop-lock is not declared.
- Black has already been eliminated.
- White wins by total elimination.
- No draw evaluation replaces the victory result.

**Status:** NOT RUN

### FTW-DRW-005 — Additional Non-Bishop Unit Prevents Bishop-Lock

**Initial Position:**

```text
b7/8/8/8/4N3/8/8/2B5
```

**Side to Move:** White

**Units:** White Bishop on c1, White Knight on e4, Black Bishop on a8. No other units remain.

**Expected Result:**

- Bishop-lock is not triggered.
- The Knight prevents the all-Bishop requirement from being satisfied.

**Status:** NOT RUN

## 3. Threefold Repetition

### FTW-DRW-006 — Threefold Repetition Can Be Claimed

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K3
```

**Side to Move:** White

**Initial State:**

- No castling rights.
- No en passant opportunity.
- White King on e1.
- Black King on e8.

**Move Sequence:**

```text
Ke1-e2
Ke8-e7
Ke2-e1
Ke7-e8

Ke1-e2
Ke8-e7
Ke2-e1
Ke7-e8
```

**Expected Result:**

- The initial position occurs once at the start.
- The first complete cycle returns to the same position for the second occurrence.
- The second complete cycle returns to the same position for the third occurrence.
- White is to move.
- White may claim a draw before making another move or forced pass.

**Status:** NOT RUN

### FTW-DRW-007 — Threefold Repetition Is Not Automatic

**Initial Position:**

Use the position and move sequence from FTW-DRW-006.

**Action:**

Do not make a threefold claim when the third occurrence is reached.

**Expected Result:**

- The game does not end automatically from threefold repetition.
- The player whose turn it is may continue by making a legal move.
- Other game-ending conditions remain applicable.

**Status:** NOT RUN

## 4. Fivefold Repetition

### FTW-DRW-008 — Fivefold Repetition Ends the Game Automatically

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K3
```

**Side to Move:** White

**Move Sequence:**

Repeat the following four-ply cycle four times:

```text
Ke1-e2
Ke8-e7
Ke2-e1
Ke7-e8
```

**Expected Result:**

- The initial position counts as the first occurrence.
- Each completed cycle returns to the same position with White to move.
- After four complete cycles, the initial position has occurred five times.
- The game ends automatically as a draw.
- No player claim is required.

**Status:** NOT RUN

## 5. Position Identity

### FTW-DRW-009 — Different Castling Rights Mean Different Positions

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K2R
```

**Side to Move:** White

**Initial Castling Rights:**

```text
White:G
```

**Move Sequence:**

```text
Ke1-e2
Ke8-e7
Ke2-e1
Ke7-e8
```

**Expected Result:**

- The final piece placement matches the initial placement.
- White is again to move.
- White's King has moved.
- White's G-side castling right has been permanently lost.
- The initial and final positions are not identical for repetition purposes.

**Status:** NOT RUN

### FTW-DRW-010 — Usable En Passant Opportunity Changes Position Identity

**Board Placement:**

```text
4k3/8/8/3pP3/8/8/8/4K3
```

**Side to Move:** White

**Position A:**

```text
En Passant:
  Target: d6
  Usable: Yes
```

**Position B:**

```text
En Passant:
  Target: None
  Usable: No
```

**Expected Result:**

- The piece placement is identical.
- The side to move is identical.
- The usable en passant opportunity differs.
- The two positions are not identical for repetition purposes.

**Status:** NOT RUN

### FTW-DRW-011 — Unusable En Passant Target Does Not Change Position Identity

**Board Placement:**

```text
4k3/8/8/3p4/8/8/8/4K3
```

**Side to Move:** White

**Position A:**

```text
En Passant:
  Target: d6
  Usable: No
```

**Position B:**

```text
En Passant:
  Target: None
  Usable: No
```

**Expected Result:**

- No White Pawn can capture en passant.
- The raw target square is not usable.
- The two positions are identical for repetition purposes when all other position-identity fields match.

**Status:** NOT RUN

### FTW-DRW-012 — Move Counters Do Not Change Position Identity

**Initial State:**

Create two otherwise identical positions with:

- The same unit placement.
- The same side to move.
- The same castling rights.
- The same usable en passant state.

Use different fullmove or halfmove counter values.

**Expected Result:**

- The positions are identical for repetition purposes.
- Move counters do not independently distinguish positions.

**Status:** NOT RUN

## 6. Mutual Immobility

### FTW-DRW-013 — Mutual Immobility Ends the Game

**Fixture Requirement:**

A valid board position must be supplied in which:

- Both players have at least one unit.
- The active player has no legal moves.
- After a hypothetical pass, the opponent also has no legal moves.
- The position does not already end through total elimination or another automatic draw.

**Expected Result:**

- The game is drawn by mutual immobility.
- No forced pass is recorded.
- The actual board state is not modified by the hypothetical evaluation.

**Status:** BLOCKED — A verified fixture is required.

### FTW-DRW-014 — One-Sided Immobility Does Not Produce a Draw

**Fixture Requirement:**

A valid board position must be supplied in which:

- Both players have at least one unit.
- The active player has no legal moves.
- The opponent has at least one legal move after a hypothetical pass.

**Expected Result:**

- Mutual immobility does not apply.
- The active player must make a forced pass.
- The turn passes to the opponent.

**Status:** BLOCKED — A verified fixture is required.

## 7. Other Draw-Related Rules

### FTW-DRW-015 — No General Insufficient-Material Draw

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K3
```

**Side to Move:** White

**Expected Result:**

- No automatic draw is declared merely because both players have only a King.
- The game remains active unless another defined ending condition applies.

**Status:** NOT RUN

### FTW-DRW-016 — No 50-Move or 75-Move Draw

**Fixture Requirement:**

Provide a legal game sequence that reaches the corresponding move-count thresholds without triggering any other game-ending condition.

**Expected Result:**

- Reaching 100 consecutive plies (50 moves by each player) without a capture or Pawn move does not independently create a draw.
- Reaching 150 consecutive plies (75 moves by each player) without a capture or Pawn move does not independently create a draw.
- The game continues unless another FTW draw or victory condition applies.

**Status:** BLOCKED — A verified game sequence is required.

## 8. Test Completion

All repetition tests must verify the complete position identity, not only the visible board placement.

The implementation must correctly distinguish:

- Different sides to move.
- Different castling rights.
- Different usable en passant opportunities.

It must ignore:

- Unusable en passant targets.
- Fullmove counters.
- Halfmove counters.

All draw evaluations must respect the priority of total elimination.
