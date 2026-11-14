
# FTW Special Move Tests

**Category:** Special Moves  
**Ruleset:** v1.0-alpha — Red Team Revision Draft  
**Status:** Not Yet Executed

## 1. Purpose

This document tests the special movement rules in Fischer Total War.

It covers:

- Double-square Pawn advances.
- En passant.
- En passant expiration.
- Pawn promotion.
- Promotion restrictions.
- Interactions between special moves and FTW's non-royal King rules.

## 2. Double-Square Pawn Advance

### FTW-SPC-001 — Double Advance Creates an En Passant Opportunity

**Initial Position:**

```text
4k3/3p4/8/4P3/8/8/8/4K3
```

**Side to Move:** Black

**Action:**

```text
d7-d5
```

**Expected Result:**

- The Black Pawn moves from d7 to d5.
- The square d6 becomes the en passant target.
- White has a usable en passant opportunity through the Pawn on e5.
- The opportunity is available only during White's immediately following turn.

**Status:** NOT RUN

## 3. En Passant

### FTW-SPC-002 — Standard En Passant Capture

**Initial Position:**

```text
4k3/8/8/3pP3/8/8/8/4K3
```

**Side to Move:** White

**En Passant State:**

```text
Target: d6
Usable: Yes
```

**Action:**

```text
e5xd6 e.p.
```

**Expected Result:**

- The move is legal.
- The White Pawn moves from e5 to d6.
- The Black Pawn on d5 is removed.
- The White Pawn occupies d6.
- The en passant opportunity expires.

**Expected Final Placement:**

```text
4k3/8/3P4/8/8/8/8/4K3
```

**Status:** NOT RUN

### FTW-SPC-003 — No En Passant Without an Adjacent Pawn

**Initial Position:**

```text
4k3/8/8/3p4/8/8/8/4K3
```

**Side to Move:** White

**En Passant State:**

```text
Target: d6
Usable: No
```

**Expected Result:**

- White has no Pawn that can capture the Black Pawn en passant.
- The target square does not create a legal move.
- The position identity must not treat this unusable target as a usable en passant opportunity.

**Status:** NOT RUN

### FTW-SPC-004 — En Passant Expires After Another Move

**Initial Position:**

```text
4k3/3p4/8/4P3/8/8/P7/4K3
```

**Side to Move:** Black

**Move Sequence:**

```text
d7-d5
a2-a3
```

**Expected Result:**

- Black's double-square Pawn advance creates an en passant opportunity.
- White chooses to play a2-a3 instead.
- The en passant opportunity expires when White's turn ends.
- White cannot use the previous en passant opportunity on a later turn.

**Status:** NOT RUN

### FTW-SPC-005 — En Passant Is Legal Despite Exposing the King

**Initial Position:**

```text
k3r3/8/8/3pP3/8/8/8/4K3
```

**Side to Move:** White

**En Passant State:**

```text
Target: d6
Usable: Yes
```

**Action:**

```text
e5xd6 e.p.
```

**Expected Result:**

- The move is legal.
- The White Pawn moves to d6.
- The Black Pawn on d5 is captured.
- The move exposes the White King on e1 to the Black Rook on e8.
- The move remains legal because FTW does not use self-check restrictions.

**Status:** NOT RUN

### FTW-SPC-006 — Usable En Passant Prevents Forced Pass

**Initial State:**

Use any valid position in which:

- The active player has a usable en passant opportunity.
- The en passant capturing Pawn has a legal destination square.

**Expected Result:**

- The en passant capture is a legal move.
- The active player therefore has at least one legal move.
- A forced pass cannot be required in this state.

**Status:** NOT RUN

## 4. Pawn Promotion

### FTW-SPC-007 — Promotion to Queen

**Initial Position:**

```text
7k/P7/8/8/8/8/8/7K
```

**Side to Move:** White

**Action:**

```text
a7-a8=Q
```

**Expected Result:**

- The move is legal.
- The White Pawn is replaced by a White Queen on a8.
- The Queen becomes active immediately after the move is completed.

**Status:** NOT RUN

### FTW-SPC-008 — Promotion to Rook

**Initial Position:**

```text
7k/P7/8/8/8/8/8/7K
```

**Side to Move:** White

**Action:**

```text
a7-a8=R
```

**Expected Result:**

- The move is legal.
- The White Pawn is replaced by a White Rook on a8.
- The promoted Rook is not an original Rook.

**Status:** NOT RUN

### FTW-SPC-009 — Promotion to Bishop

**Initial Position:**

```text
7k/P7/8/8/8/8/8/7K
```

**Side to Move:** White

**Action:**

```text
a7-a8=B
```

**Expected Result:**

- The move is legal.
- The White Pawn is replaced by a White Bishop on a8.
- The promoted Bishop is treated as a Bishop for movement and Bishop-lock evaluation.

**Status:** NOT RUN

### FTW-SPC-010 — Promotion to Knight

**Initial Position:**

```text
7k/P7/8/8/8/8/8/7K
```

**Side to Move:** White

**Action:**

```text
a7-a8=N
```

**Expected Result:**

- The move is legal.
- The White Pawn is replaced by a White Knight on a8.

**Status:** NOT RUN

### FTW-SPC-011 — Promotion to King Is Illegal

**Initial Position:**

```text
7k/P7/8/8/8/8/8/7K
```

**Side to Move:** White

**Action:**

```text
a7-a8=K
```

**Expected Result:**

- The promotion choice is illegal.
- A Pawn cannot promote to a King.
- The move must not be completed with a King on a8.

**Status:** NOT RUN

## 5. Promotion and Castling Rights

### FTW-SPC-012 — Promoted Rook Cannot Acquire Castling Rights

**Initial State:**

A player has already lost the castling right associated with an original Rook.

A Pawn is promoted to a Rook.

The promoted Rook later occupies the original Rook's starting square.

**Expected Result:**

- The promoted Rook does not restore the lost castling right.
- Castling remains unavailable on that side.

**Status:** NOT RUN

## 6. Special Move Completion

A promotion or en passant capture must be completed as part of the move that performs it.

The resulting board and special-state information must be updated before the next turn begins.

The game-ending checks must then follow the order defined in `RULES.md`.

## 7. Test Completion

All special-move tests must be verified against the documented rules.

In particular, an implementation must not:

- Retain an expired en passant opportunity.
- Allow an unusable en passant target to affect position identity.
- Apply traditional self-check restrictions to en passant.
- Allow promotion to a King.
- Restore castling rights through promotion.

---

For the complete gameplay rules, see [RULES.md](../RULES.md).
