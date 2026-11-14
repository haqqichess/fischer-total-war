# FTW Edge-Case Movement and State Tests

**Category:** Movement, Captures, Pawn Direction, and Position Identity  
**Ruleset:** v1.0-alpha — Red Team Revision Draft  
**Status:** Not Yet Executed

## 1. Purpose

This document adds focused cases that complement `tests/movement.md`,
`tests/castling.md`, `tests/draw_conditions.md`, and
`tests/game_resolution.md`.

The FEN strings below show board placement only. Side to move and any special
state are specified separately. Unless a test says otherwise, no castling
rights or en passant opportunity exist.

Every case is a test specification, not a report of an executed engine test.
Do not mark a case PASS until it has been run against an implementation.

## 2. Sliding-Piece Boundaries

### FTW-EDGE-001 — Queen Cannot Jump Over an Occupying Unit

**Initial Position:**

```text
7k/8/8/8/8/8/P7/Q6K
```

**Side to Move:** White

**Action:** `Qa1-a8`

**Expected Result:**

- The move is illegal.
- The White Pawn on a2 blocks the Queen's route.
- The Queen and Pawn remain on their original squares.

**Status:** NOT RUN

### FTW-EDGE-002 — Sliding Piece Stops at the First Captured Unit

**Initial Position:**

```text
7k/8/8/p7/8/p7/8/R6K
```

**Side to Move:** White

**Action:** `Ra1xa3`

**Expected Result:**

- The move is legal.
- The Black Pawn on a3 is captured.
- The White Rook occupies a3.
- The Black Pawn on a5 remains on the board; a Rook cannot move beyond the first occupied destination.

**Status:** NOT RUN

## 3. Knight Occupancy

### FTW-EDGE-003 — Knight Captures an Opposing Unit

**Initial Position:**

```text
7k/8/8/8/2p5/8/1N6/7K
```

**Side to Move:** White

**Action:** `Nb2xc4`

**Expected Result:**

- The move is legal.
- The Black Pawn on c4 is captured.
- The White Knight occupies c4.

**Status:** NOT RUN

### FTW-EDGE-004 — Knight Cannot Capture a Friendly Unit

**Initial Position:**

```text
7k/8/8/8/2P5/8/1N6/7K
```

**Side to Move:** White

**Action:** `Nb2-c4`

**Expected Result:**

- The move is illegal.
- The White Pawn on c4 remains in place.
- The White Knight remains on b2.

**Status:** NOT RUN

## 4. Black Pawn Direction and Double Advance

### FTW-EDGE-005 — Black Pawn Moves Toward Lower Ranks

**Initial Position:**

```text
7k/3p4/8/8/8/8/8/K7
```

**Side to Move:** Black

**Action:** `d7-d6`

**Expected Result:**

- The move is legal.
- The Black Pawn moves from d7 to d6.

**Status:** NOT RUN

### FTW-EDGE-006 — Black Pawn May Advance Two Squares From Its Original Square

**Initial Position:**

```text
7k/3p4/8/8/8/8/8/K7
```

**Side to Move:** Black

**Initial Pawn State:** The Pawn on d7 has not previously moved.

**Action:** `d7-d5`

**Expected Result:**

- The move is legal when d6 and d5 are empty.
- The Black Pawn finishes on d5.
- The en passant target is d6 for the immediately following White turn.
- The opportunity is usable only if a White Pawn can capture onto d6 under the en passant rules.

**Status:** NOT RUN

## 5. Pawn Occupancy and Direction

### FTW-EDGE-007 — Pawn Cannot Advance Into an Occupied Square

**Initial Position:**

```text
7k/8/8/4p3/4P3/8/8/7K
```

**Side to Move:** White

**Action:** `e4-e5`

**Expected Result:**

- The move is illegal.
- The Black Pawn on e5 is not captured.
- The White Pawn remains on e4.

**Status:** NOT RUN

### FTW-EDGE-008 — White Pawn Cannot Move Backward

**Initial Position:**

```text
7k/8/8/8/4P3/8/8/7K
```

**Side to Move:** White

**Action:** `e4-e3`

**Expected Result:**

- The move is illegal.
- The White Pawn remains on e4.

**Status:** NOT RUN

### FTW-EDGE-009 — Pawn Cannot Double-Advance From a Non-Starting Square

**Initial Position:**

```text
7k/8/8/8/8/4P3/8/7K
```

**Side to Move:** White

**Action:** `e3-e5`

**Expected Result:**

- The move is illegal.
- A two-square Pawn advance is available only from that Pawn's original starting square and only if it has not previously moved.
- The Pawn remains on e3.

**Status:** NOT RUN

## 6. Position Identity

### FTW-EDGE-010 — Side to Move Distinguishes Otherwise Identical Positions

**Board Placement:**

```text
4k3/8/8/8/8/8/8/4K3
```

**Position A:** White to move.

**Position B:** Black to move.

All other position-identity fields are equal: no castling rights and no usable en passant opportunity.

**Expected Result:**

- Piece placement is identical.
- The side to move differs.
- Positions A and B are not identical for repetition purposes.

**Status:** NOT RUN

## 7. En Passant and Promotion

### FTW-EDGE-011 — En Passant Captures the Advancing Pawn

**Initial Position:**

```text
4k3/8/8/3pP3/8/8/8/4K3
```

**Side to Move:** White

**En Passant State:** Black's Pawn has just advanced from d7 to d5. The target square is d6 and the opportunity is usable.

**Action:** `e5xd6 e.p.`

**Expected Result:**

- The move is legal.
- The White Pawn moves from e5 to d6.
- The Black Pawn on d5 is removed.
- The White Pawn occupies d6.

**Status:** NOT RUN

### FTW-EDGE-012 — En Passant Expires After the Eligible Turn

**Initial Position:**

```text
4k3/8/8/3pP3/8/8/8/4K3
```

**Side to Move:** White

**En Passant State:** Target d6, usable by the White Pawn on e5.

**Action:** White makes the ordinary King move `Ke1-e2` instead of capturing en passant.

**Expected Result:**

- The King move is legal.
- The en passant opportunity expires when White's turn ends.
- Black cannot capture the White Pawn en passant on the following turn.
- The board retains both Pawns on d5 and e5.

**Status:** NOT RUN

### FTW-EDGE-013 — Pawn May Promote to Each Permitted Piece Type

**Initial Position:**

```text
7k/P7/8/8/8/8/8/7K
```

**Side to Move:** White

**Actions:** Test each action independently from the initial position.

```text
a7-a8=Q
a7-a8=R
a7-a8=B
a7-a8=N
```

**Expected Result:**

- Each promotion choice is legal.
- The Pawn is replaced on a8 by the selected piece.
- The promoted piece becomes active immediately.

**Status:** NOT RUN

### FTW-EDGE-014 — Pawn Cannot Promote to a King

**Initial Position:**

Use the position from FTW-EDGE-013.

**Side to Move:** White

**Action:** Attempt `a7-a8=K`.

**Expected Result:**

- The action is illegal.
- The Pawn remains on a7.
- The board and side to move remain unchanged.

**Status:** NOT RUN

## 8. Test Completion

These cases supplement, and do not replace, the existing movement, castling,
draw-condition, and game-resolution specifications.

The suite remains unexecuted until an implementation is tested. A written
expected result is not evidence that the implementation conforms.
