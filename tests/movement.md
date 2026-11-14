
# FTW Movement and Capture Tests

**Category:** Movement and Captures  
**Ruleset:** v1.0-alpha — Red Team Revision Draft  
**Status:** Not Yet Executed

## 1. Purpose

This document defines tests for the movement and capture rules of Fischer Total War.

The tests verify that each unit follows its defined movement pattern while respecting board boundaries, occupancy, and obstruction requirements.

FTW does not apply traditional check or self-check restrictions.

## 2. King Movement

### FTW-MOV-001 — King Captures an Attacked Unit

**Initial Position:**

```text
8/8/8/8/8/3k4/4r3/4K3
```

**Side to Move:** White

**Action:**

```text
e1xe2
```

**Expected Result:**

- The move is legal.
- The Black Rook on e2 is captured.
- The White King occupies e2.
- The move remains legal even though the Black King attacks e2.

**Status:** NOT RUN

### FTW-MOV-002 — Kings May Become Adjacent

**Initial Position:**

```text
8/8/8/8/8/4k3/8/4K3
```

**Side to Move:** White

**Action:**

```text
e1-e2
```

**Expected Result:**

- The move is legal.
- The White King moves to e2.
- The two Kings become vertically adjacent.
- No check-related restriction is applied.

**Status:** NOT RUN

### FTW-MOV-003 — King May Move Into an Attacked Square

**Initial Position:**

```text
8/8/8/8/8/8/4r3/4K3
```

**Side to Move:** White

**Action:**

```text
e1-e2
```

**Expected Result:**

- The move is legal.
- The White King moves onto the square occupied by the Black Rook only if it captures that Rook.
- If the destination contains an opposing unit, the action must be treated as a capture.
- Being attacked by another unit does not invalidate the move.

**Status:** NOT RUN

## 3. Self-Check and Pin Restrictions

### FTW-MOV-004 — A Pinned Rook May Move

**Initial Position:**

```text
k3r3/8/8/8/8/8/4R3/4K3
```

**Side to Move:** White

**Action:**

```text
e2-a2
```

**Expected Result:**

- The move is legal.
- The White Rook leaves the e-file.
- The Black Rook on e8 now attacks the White King on e1.
- The move is not rejected for exposing the King.

**Status:** NOT RUN

### FTW-MOV-005 — No Self-Check Filtering

**Initial Position:**

```text
k3r3/8/8/8/8/8/4R3/4K3
```

**Side to Move:** White

**Action:**

```text
e2-e3
```

**Expected Result:**

- The move is legal.
- The move may alter the line of attack.
- The implementation must not apply traditional pin or self-check filtering.

**Status:** NOT RUN

## 4. Rook, Bishop, and Queen Movement

### FTW-MOV-006 — Rook Moves Along a Clear File

**Initial Position:**

```text
7k/8/8/8/8/8/8/R6K
```

**Side to Move:** White

**Action:**

```text
a1-a4
```

**Expected Result:**

- The move is legal.
- The Rook reaches a4.
- No intervening unit is crossed.

**Status:** NOT RUN

### FTW-MOV-007 — Rook Cannot Jump Over a Unit

**Initial Position:**

```text
7k/8/8/8/8/8/P7/R6K
```

**Side to Move:** White

**Action:**

```text
a1-a4
```

**Expected Result:**

- The move is illegal.
- The White Pawn on a2 blocks the route.

**Status:** NOT RUN

### FTW-MOV-008 — Rook Cannot Capture Its Own Unit

**Initial Position:**

```text
7k/8/8/8/8/P7/8/R6K
```

**Side to Move:** White

**Action:**

```text
a1-a3
```

**Expected Result:**

- The move is illegal.
- The destination contains a White Pawn.
- No unit is moved or captured.

**Status:** NOT RUN

### FTW-MOV-009 — Bishop Moves Diagonally

**Initial Position:**

```text
7k/8/8/8/8/8/8/B6K
```

**Side to Move:** White

**Action:**

```text
a1-d4
```

**Expected Result:**

- The move is legal.
- The Bishop follows a clear diagonal route.

**Status:** NOT RUN

### FTW-MOV-010 — Bishop Cannot Move Through an Obstruction

**Initial Position:**

```text
7k/8/8/8/8/2P5/8/B6K
```

**Side to Move:** White

**Action:**

```text
a1-d4
```

**Expected Result:**

- The move is illegal.
- The White Pawn on c3 blocks the diagonal route.

**Status:** NOT RUN

### FTW-MOV-011 — Queen Moves Horizontally, Vertically, and Diagonally

**Initial Position:**

```text
7k/8/8/8/8/8/8/Q6K
```

**Side to Move:** White

**Actions:**

```text
a1-a5
a1-e1
a1-e5
```

**Expected Result:**

Each action is legal when tested independently from the initial position.

**Status:** NOT RUN

## 5. Knight Movement

### FTW-MOV-012 — Knight Jumps Over Other Units

**Initial Position:**

```text
7k/8/8/8/8/8/1P6/1N5K
```

**Side to Move:** White

**Action:**

```text
b1-c3
```

**Expected Result:**

- The move is legal.
- The White Knight jumps over the White Pawn on b2.
- The Pawn remains in place.

**Status:** NOT RUN

### FTW-MOV-013 — Knight Uses the Correct Movement Pattern

**Initial Position:**

```text
7k/8/8/8/8/8/8/1N5K
```

**Side to Move:** White

**Action:**

```text
b1-b3
```

**Expected Result:**

- The move is illegal.
- A Knight cannot move two squares along the same file.

**Status:** NOT RUN

## 6. Pawn Movement

### FTW-MOV-014 — Pawn Moves One Square Forward

**Initial Position:**

```text
7k/8/8/8/8/8/4P3/7K
```

**Side to Move:** White

**Action:**

```text
e2-e3
```

**Expected Result:**

- The move is legal.
- The Pawn moves one square forward.

**Status:** NOT RUN

### FTW-MOV-015 — Pawn Moves Two Squares From Its Starting Square

**Initial Position:**

```text
7k/8/8/8/8/8/4P3/7K
```

**Side to Move:** White

**Action:**

```text
e2-e4
```

**Expected Result:**

- The move is legal.
- Both e3 and e4 are empty.
- The Pawn has not previously moved.

**Status:** NOT RUN

### FTW-MOV-016 — Pawn Cannot Move Two Squares Through an Obstruction

**Initial Position:**

```text
7k/8/8/8/8/4N3/4P3/7K
```

**Side to Move:** White

**Action:**

```text
e2-e4
```

**Expected Result:**

- The move is illegal.
- The White Knight on e3 blocks the Pawn's route.

**Status:** NOT RUN

### FTW-MOV-017 — Pawn Cannot Capture Forward

**Initial Position:**

A White Pawn on e4 and a Black unit on e5.

**Side to Move:** White

**Action:**

```text
e4-e5
```

**Expected Result:**

- The move is illegal.
- Pawns cannot capture by moving directly forward.

**Status:** NOT RUN

### FTW-MOV-018 — Pawn Captures Diagonally

**Initial Position:**

```text
7k/8/8/3p4/4P3/8/8/7K
```

**Side to Move:** White

**Action:**

```text
e4xd5
```

**Expected Result:**

- The move is legal.
- The Black Pawn on d5 is captured.
- The White Pawn occupies d5.

**Status:** NOT RUN

### FTW-MOV-019 — Pawn May Capture the Opposing King

**Initial Position:**

A White Pawn on e7, a Black King on d8, and at least one other Black unit elsewhere on the board.

**Side to Move:** White

**Action:**

```text
e7xd8
```

**Expected Result:**

- The capture is legal.
- The Black King is removed.
- The White Pawn reaches its promotion rank and must promote.
- The game continues if Black still has another unit.

**Status:** NOT RUN

## 7. Kingless Play

### FTW-MOV-020 — Player May Move Without a King

**Initial Position:**

```text
7k/8/8/8/8/8/8/R2Q4
```

**Side to Move:** White

**Action:**

```text
a1-a2
```

**Expected Result:**

- The move is legal.
- White has no King, but still has other units.
- The game continues normally.

**Status:** NOT RUN

## 8. Test Completion

Every test in this document must be executed against the documented movement rules.

No test should be marked PASS until its result has been independently verified.
