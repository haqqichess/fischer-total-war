
# Fischer Total War — Conformance Test Suite

**Ruleset:** v1.0-alpha — Red Team Revision Draft  
**Status:** Test Specification — Not Yet Executed  
**Creator:** Haqqi Muazzam  
**Last Updated:** November 14, 2026

## 1. Purpose

This directory contains the conformance test specifications for Fischer Total War (FTW).

The purpose of these tests is to verify that a player, referee, or software implementation applies the documented rules consistently.

A conforming implementation must produce the expected results defined by these tests.

The test suite covers:

- Piece movement and captures.
- Chess960 castling.
- Special moves.
- Draw conditions and repetition.
- Game-state resolution.
- Starting-position validation.

This test suite is based on the rules in the repository's `RULES.md`.

## 2. Testing Principles

Every test must have:

1. A unique test identifier.
2. A clearly defined initial position or setup procedure.
3. A side to move.
4. Any required special-state information.
5. An action or move sequence.
6. An expected result.
7. A test status.

Tests must be repeatable. The same initial state and move sequence must always produce the same result.

A test must not depend on an undocumented rule or an assumption that is absent from `RULES.md`.

## 3. Test Status

Use the following status values:

| Status | Meaning |
|---|---|
| NOT RUN | The test has been specified but not executed. |
| PASS | The implementation produced the expected result. |
| FAIL | The implementation produced an incorrect result. |
| BLOCKED | The test cannot currently be executed because a required fixture or capability is unavailable. |
| NEEDS REVIEW | The test specification or expected result requires clarification. |

A test must not be marked PASS merely because its expected result appears reasonable.

The result must be verified by an actual execution or an independently checked manual procedure.

## 4. Test Fixture Convention

All test documents use the following fixture format.

### 4.1 Board Placement

Board placement uses the piece-placement portion of FEN.

The board is written from rank 8 down to rank 1.

Piece symbols follow standard FEN conventions:

| Symbol | Unit |
|---|---|
| K | White King |
| Q | White Queen |
| R | White Rook |
| B | White Bishop |
| N | White Knight |
| P | White Pawn |
| k | Black King |
| q | Black Queen |
| r | Black Rook |
| b | Black Bishop |
| n | Black Knight |
| p | Black Pawn |

Numbers represent consecutive empty squares.

The fixture format may omit conventional FEN fields when the required state is specified separately.

### 4.2 Side to Move

Use:

- `White`
- `Black`

### 4.3 Castling Rights

Castling rights must be recorded separately for each player and side.

Use the following notation:

- `White:G` — White has G-side castling rights.
- `White:C` — White has C-side castling rights.
- `Black:G` — Black has G-side castling rights.
- `Black:C` — Black has C-side castling rights.

If no castling rights remain, use `None`.

### 4.4 Original Piece Identity

When a test involves castling, identify the original King and original Rook by their starting squares.

Example:

```text
Original Pieces:
  White King: e1
  White G-side Rook: h1
  White C-side Rook: a1
```

A promoted Rook must never be treated as an original Rook.

### 4.5 En Passant State

Record both the target square and whether the opportunity is usable.

Example:

```text
En Passant:
  Target: d6
  Usable: Yes
```

If no opportunity exists:

```text
En Passant:
  Target: None
  Usable: No
```

An en passant target that cannot be used by any Pawn must not be treated as a usable opportunity.

### 4.6 Move Notation

For test descriptions, coordinate notation is used.

Examples:

- `e2-e4` — a move from e2 to e4.
- `e5xd6` — a capture from e5 to d6.
- `e5xd6 e.p.` — an en passant capture.
- `g7xh8=Q` — a capture followed by promotion to a Queen.
- `O-O` — G-side castling.
- `O-O-O` — C-side castling.
- `--` — forced pass.

This notation describes test actions. It does not establish a complete official PGN standard.

## 5. Test Categories

| File | Category | Test ID Prefix |
|---|---|---|
| `movement.md` | Movement and captures | FTW-MOV |
| `castling.md` | Chess960 castling | FTW-CAS |
| `special_moves.md` | En passant and promotion | FTW-SPC |
| `draw_conditions.md` | Draws and repetition | FTW-DRW |
| `game_resolution.md` | Turns and game endings | FTW-GAM |

Starting-position validation is specified separately in Section 8.

## 6. Test Execution Requirements

A test executor must preserve all relevant game state.

At minimum, the following information must be available:

- Unit placement.
- Side to move.
- Castling rights.
- Original King and Rook identities where applicable.
- En passant availability.
- Position occurrence history.
- Game result and termination reason.

A test must not be evaluated using piece placement alone when the applicable rule depends on historical rights or repetition history.

## 7. Reporting Failures

When a test fails, record:

- Test ID.
- Ruleset version.
- Implementation version, if applicable.
- Initial fixture.
- Move sequence.
- Expected result.
- Actual result.
- Relevant state before and after the move.
- A concise explanation of the discrepancy.

Do not silently modify the expected result to make an implementation pass.

If the rules themselves appear ambiguous, mark the test as `NEEDS REVIEW` and propose a rules clarification.

## 8. Chess960 Starting-Position Validation

A conforming Chess960 starting-position generator must satisfy the following requirements:

1. It must generate exactly 960 valid positions.
2. Each position must have a unique Scharnagl ID from 0 to 959.
3. Each generated position must have two Bishops on opposite-colored squares.
4. The King must start between the two original Rooks.
5. The remaining back-rank pieces must occupy the remaining valid squares.
6. Both players must use the same file arrangement.
7. All Pawns must occupy their normal starting ranks.
8. Position ID 518 must produce the traditional chess starting arrangement.

A complete ID enumeration test must verify that all 960 IDs map to valid, unique arrangements.

If a random generator is implemented, its distribution must be evaluated separately. A finite sample cannot prove perfect uniformity, but statistical tests can identify substantial bias.

## 9. Completion Criteria

A test suite is considered ready for a release review only when:

- Every required test has a defined fixture or a documented fixture-generation procedure.
- Every expected result has been checked against `RULES.md`.
- No unresolved `NEEDS REVIEW` cases remain.
- Every executable test has been run.
- Every failure has been resolved or documented.
- All 960 Chess960 IDs have been validated when a position generator is part of the implementation.

Passing this suite does not prove that every possible FTW position has been tested.

Additional randomized, property-based, and practical playtesting is still necessary.

## 10. Relationship to the Rules

`RULES.md` remains the authoritative source for gameplay rules.

This test suite does not silently introduce new mechanics.

If a test exposes a contradiction or an undefined situation, the rules must be reviewed before the expected outcome is treated as authoritative.

---

**Fischer Total War**  
*Play until nothing remains.*
