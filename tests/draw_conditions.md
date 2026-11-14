
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

**Position A:** The Black Pawn on d5 has just advanced two squares from d7, so the en passant target is d6.

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

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K3
```

**Side to Move:** White

**Move Sequence:**

The following 150-ply sequence uses only King moves. Each move is a legal one-square King move; no capture or Pawn move occurs. The complete sequence was checked for repetition, and no position occurs more than twice (including the initial and final positions).

```text
1. e1-f2 e8-e7 2. f2-e3 e7-e8 3. e3-f4 e8-e7 4. f4-g4 e7-f8 5. g4-h4 f8-e7
6. h4-h3 e7-d6 7. h3-g2 d6-c7 8. g2-f3 c7-d7 9. f3-f4 d7-d6 10. f4-e5 d6-d7
11. e5-e4 d7-d6 12. e4-e3 d6-c6 13. e3-f4 c6-c5 14. f4-f5 c5-c4 15. f5-e5 c4-b3
16. e5-d6 b3-a4 17. d6-e5 a4-a5 18. e5-d6 a5-b5 19. d6-e6 b5-b4 20. e6-d7 b4-c5
21. d7-c7 c5-b6 22. c7-b8 b6-b7 23. b8-a8 b7-c7 24. a8-b8 c7-d8 25. b8-b7 d8-e7
26. b7-a6 e7-d6 27. a6-b7 d6-d7 28. b7-a7 d7-e8 29. a7-a6 e8-d7 30. a6-b5 d7-d8
31. b5-c6 d8-d7 32. c6-d5 d7-c6 33. d5-d4 c6-b7 34. d4-d3 b7-a6 35. d3-c4 a6-b7
36. c4-b5 b7-b6 37. b5-c5 b6-b7 38. c5-d6 b7-b8 39. d6-c5 b8-c7 40. c5-d4 c7-b6
41. d4-e3 b6-a5 42. e3-f2 a5-b6 43. f2-g1 b6-a7 44. g1-f1 a7-a8 45. f1-e1 a8-a7
46. e1-f2 a7-b6 47. f2-e1 b6-c5 48. e1-f2 c5-c4 49. f2-e1 c4-b3 50. e1-d2 b3-a4
51. d2-e2 a4-a3 52. e2-e3 a3-a2 53. e3-e4 a2-a1 54. e4-f3 a1-b2 55. f3-f4 b2-c2
56. f4-g4 c2-d2 57. g4-h3 d2-d3 58. h3-g2 d3-e3 59. g2-h2 e3-d4 60. h2-h3 d4-e3
61. h3-g4 e3-f3 62. g4-f5 f3-g4 63. f5-f6 g4-h5 64. f6-f7 h5-g6 65. f7-f8 g6-h7
66. f8-g7 h7-g8 67. g7-g6 g8-f8 68. g6-f5 f8-e8 69. f5-g5 e8-d7 70. g5-h6 d7-e8
71. h6-g6 e8-d8 72. g6-h7 d8-d7 73. h7-g8 d7-d8 74. g8-f7 d8-c7 75. f7-e7 c7-c8
```

**Expected Result:**

- At 100 plies (50 moves by each player), no draw is declared by a 50-move rule.
- At 150 plies (75 moves by each player), no draw is declared by a 75-move rule.
- The game remains active after the sequence unless another FTW ending condition applies.

**Status:** NOT RUN

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
