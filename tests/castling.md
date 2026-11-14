
# FTW Chess960 Castling Tests

**Category:** Chess960 Castling  
**Ruleset:** v1.0-alpha — Red Team Revision Draft  
**Status:** Not Yet Executed

## 1. Purpose

This document tests the adapted Chess960 castling procedure used by FTW.

The tests cover:

- Castling eligibility.
- Route clearance.
- Stationary King.
- Stationary Rook.
- King-Rook exchange.
- Attacked squares.
- Original piece identity.
- Permanent castling-right loss.

For these tests, castling rights and original piece identities must be recorded separately from board placement.

## 2. Standard G-Side Castling

### FTW-CAS-001 — Basic G-Side Castling

**Initial Position:**

```text
4k3/8/8/8/8/8/8/R3K2R
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
White:C
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
White C-side Rook: a1
```

**Action:**

```text
O-O
```

**Expected Result:**

- G-side castling is legal.
- The King finishes on g1.
- The G-side Rook finishes on f1.
- The C-side Rook remains on a1.
- Both White castling rights are permanently lost.
- The remaining Rook on a1 cannot castle later.

**Expected Final Placement:**

```text
4k3/8/8/8/8/8/8/R4RK1
```

**Expected Castling Rights:**

```text
None
```

**Status:** NOT RUN

## 3. Standard C-Side Castling

### FTW-CAS-002 — Basic C-Side Castling

**Initial Position:**

```text
4k3/8/8/8/8/8/8/R3K2R
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
White:C
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
White C-side Rook: a1
```

**Action:**

```text
O-O-O
```

**Expected Result:**

- C-side castling is legal.
- The King finishes on c1.
- The C-side Rook finishes on d1.
- The G-side Rook remains on h1.
- Both White castling rights are permanently lost.
- The remaining Rook on h1 cannot castle later.

**Expected Final Placement:**

```text
4k3/8/8/8/8/8/8/2KR3R
```

**Expected Castling Rights:**

```text
None
```

**Status:** NOT RUN

## 4. Stationary Castling Pieces

### FTW-CAS-003 — Stationary King

**Initial Position:**

```text
4k3/8/8/8/8/8/8/6KR
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: g1
White G-side Rook: h1
```

**Action:**

```text
O-O
```

**Expected Result:**

- Castling is legal.
- The King remains on g1.
- The Rook moves from h1 to f1.
- Castling consumes the turn.
- All remaining castling rights are lost; no castling rights remain.

**Expected Final Placement:**

```text
4k3/8/8/8/8/8/8/5RK1
```

**Status:** NOT RUN

### FTW-CAS-004 — Stationary Rook

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4KR2
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: f1
```

**Action:**

```text
O-O
```

**Expected Result:**

- Castling is legal.
- The King moves to g1.
- The Rook remains on f1.
- All remaining castling rights are lost; no castling rights remain.

**Expected Final Placement:**

```text
4k3/8/8/8/8/8/8/5RK1
```

**Status:** NOT RUN

### FTW-CAS-005 — King and Rook Exchange Squares

**Initial Position:**

```text
4k3/8/8/8/8/8/8/5KR1
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: f1
White G-side Rook: g1
```

**Action:**

```text
O-O
```

**Expected Result:**

- Castling is legal.
- The King moves from f1 to g1.
- The Rook moves from g1 to f1.
- The two pieces are placed simultaneously.
- Both castling rights are lost.

**Expected Final Placement:**

```text
4k3/8/8/8/8/8/8/5RK1
```

**Status:** NOT RUN

## 5. Route Clearance

### FTW-CAS-006 — Castling Blocked by a Third Unit

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4KB1R
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Action:**

```text
O-O
```

**Expected Result:**

- Castling is illegal.
- The White Bishop on f1 remains a third unit after the King and Rook are temporarily removed.
- The move is rejected.
- The board and castling rights remain unchanged.

**Status:** NOT RUN

### FTW-CAS-007 — Overlapping Routes

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K2R
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Route Information:**

The King route is e1–f1–g1.

The Rook route is h1–g1–f1.

**Action:**

```text
O-O
```

**Expected Result:**

- The routes may overlap.
- The King and Rook are temporarily removed.
- No third unit occupies the union of the routes.
- Castling is legal.

**Status:** NOT RUN

### FTW-CAS-008 — Destination Occupied by a Third Unit

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K1nR
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Action:**
```text
O-O
```

**Expected Result:**

- Castling is illegal.
- The Black Knight on g1 remains after both castling pieces are temporarily removed.
- The destination route is occupied by a third unit.
- The board and castling rights remain unchanged.
**Status:** NOT RUN

## 6. Attacked Squares

### FTW-CAS-009 — King Starts on an Attacked Square

**Initial Position:**

```text
k3r3/8/8/8/8/8/8/4K2R
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Action:**

```text
O-O
```

**Expected Result:**

- Castling is legal.
- The Black Rook attacks e1.
- The attacked starting square does not prevent castling.

**Status:** NOT RUN

### FTW-CAS-010 — King Crosses an Attacked Square

**Initial Position:**

```text
4kr2/8/8/8/8/8/8/4K2R
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Action:**

```text
O-O
```

**Expected Result:**

- Castling is legal.
- The Black Rook attacks f1.
- The attacked route square does not prevent castling.

**Status:** NOT RUN

### FTW-CAS-011 — King Arrives on an Attacked Square

**Initial Position:**

```text
k5r1/8/8/8/8/8/8/4K2R
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Action:**

```text
O-O
```

**Expected Result:**

- Castling is legal.
- The Black Rook attacks g1.
- The attacked destination square does not prevent castling.

**Status:** NOT RUN

## 7. Castling Rights

### FTW-CAS-012 — King Moves and Returns

**Initial Position:**

```text
4k3/8/8/8/8/8/8/4K2R
```

**Side to Move:** White

**Initial Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Move Sequence:**

```text
Ke1-e2
Ke8-e7
Ke2-e1
Ke7-e8
```

**Action After the Sequence:**

Attempt G-side castling.

**Expected Result:**

- Castling is illegal.
- The original King has moved.
- Returning the King to e1 does not restore the right.

**Status:** NOT RUN

### FTW-CAS-013 — Original Rook Moves and Returns

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
Rh1-h2
Ke8-e7
Rh2-h1
Ke7-e8
```

**Action After the Sequence:**

Attempt G-side castling.

**Expected Result:**

- Castling is illegal.
- The original Rook has moved.
- Returning the Rook to h1 does not restore its right.

**Status:** NOT RUN

### FTW-CAS-014 — Original Rook Is Captured

**Initial Position:**

```text
k6r/8/8/8/8/8/8/4K2R
```

**Side to Move:** Black

**Initial White Castling Rights:**

```text
White:G
```

**Original Pieces:**

```text
White King: e1
White G-side Rook: h1
```

**Action:**

```text
Rh8xh1
```

**Expected Result:**

- The Black Rook captures the original White G-side Rook.
- White permanently loses G-side castling rights.
- Any later Rook placed on h1 cannot restore that right.

**Status:** NOT RUN

### FTW-CAS-015 — Castling Consumes Both Rights When the King Is Stationary

**Initial Position:**

```text
4k3/8/8/8/8/8/8/R5KR
```

**Side to Move:** White

**Castling Rights:**

```text
White:G
White:C
```

**Original Pieces:**

```text
White King: g1
White G-side Rook: h1
White C-side Rook: a1
```

**Action:**

```text
O-O
```

**Expected Result:**

- G-side castling is legal.
- The King remains on g1.
- The selected Rook moves to f1.
- Both G-side and C-side rights are lost.
- The remaining original Rook on a1 cannot be used for later castling.

**Expected Final Placement:**

```text
4k3/8/8/8/8/8/8/R4RK1
```

**Status:** NOT RUN

## 8. Castling Test Completion

The castling tests are not complete merely because standard castling works.

A conforming implementation must also correctly handle:

- All 960 Chess960 starting arrangements.
- Stationary King.
- Stationary Rook.
- King-Rook exchange.
- Overlapping routes.
- Third-unit obstruction.
- Attacked starting, route, and destination squares.
- Permanent castling-right loss.

The implementation must also verify that every castling move updates position identity correctly for repetition tracking.
