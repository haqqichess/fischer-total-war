
# Fischer Total War — Rules Draft

**Version:** v1.0-alpha — Red Team Revision Draft  
**Status:** Experimental — Open for Playtesting  
**Creator:** Haqqi Muazzam  
**Revision date:** November 14, 2026

---

## 1. Introduction

Fischer Total War (FTW) is an experimental chess variant based on the Chess960 starting-position system.

The objective is to eliminate every unit belonging to the opposing player. Unlike traditional chess, FTW has no check, checkmate, or royal protection for the King.

The King remains a playable unit. It can move, capture, and be captured. Capturing a King does not end the game while the opponent still has other units on the board.

This document defines the current FTW rules. It is intended to serve as the authoritative rules reference for playtesting and future implementations.

## 2. The Board and Starting Position

### 2.1 Board

FTW is played on a standard 8×8 chessboard containing 64 squares.

Files are identified as a–h, and ranks as 1–8.

White moves first.

### 2.2 Starting Position

FTW uses one of the 960 valid Chess960 starting positions.

The starting position must satisfy all of the following requirements:

- White's Pawns occupy rank 2.
- Black's Pawns occupy rank 7.
- All remaining White pieces occupy rank 1.
- All remaining Black pieces occupy rank 8, using the same file arrangement as White.
- The two Bishops of each player occupy opposite-colored squares.
- The King begins between the two original Rooks.

The starting position is identified using the standard Scharnagl numbering system, from 0 to 959.

Position 518 corresponds to the traditional chess starting arrangement.

For a randomly selected position, each of the 960 positions must have an equal probability of being selected. A position may also be chosen in advance for analysis or agreed playtesting.

Both players must use the same selected position.

### 2.3 Recording the Starting Position

Every recorded game should include:

- The FTW rules version.
- The Scharnagl position ID.
- The side to move.
- The move sequence.

When FEN notation is used, a Chess960-compatible format such as Shredder-FEN must be used for castling rights.

The selected position ID should be retained separately as game metadata.

## 3. Units and Objective

Each player begins with 16 units:

- 1 King
- 1 Queen
- 2 Rooks
- 2 Bishops
- 2 Knights
- 8 Pawns

The objective is to eliminate every opposing unit.

A player wins immediately when the opponent has zero units remaining on the board.

Capturing the opposing King alone does not produce a victory if the opponent still has at least one other unit.

A player whose King has been captured continues playing normally with their remaining units.

There is no requirement to protect the King.

## 4. Legal Moves

### 4.1 General Principle

A move is legal when it follows the movement and capture rules defined in this document.

A move must:
- Remain within the board.
- Follow the movement pattern of the moving unit.
- Obey the occupancy and obstruction rules.
- Follow any applicable special-move requirements.

A player cannot move a unit onto a square occupied by one of their own units.

A player cannot capture a unit belonging to their own side.

### 4.2 No Self-Check Restrictions

FTW does not use check or self-check restrictions.

A move is not illegal because it:

- Leaves the player's King under attack.
- Moves the King onto an attacked square.
- Moves a pinned unit away from a line of attack.
- Exposes the King to a capture.
- Places the two Kings on adjacent squares.

Attacked squares do not restrict ordinary movement.

### 4.3 King

The King moves one square in any direction:

- Horizontally.
- Vertically.
- Diagonally.

The King may capture any opposing unit, including the opposing King.

The King may move onto an attacked square and may remain on an attacked square.

A King is not a royal unit in FTW.

### 4.4 Queen

The Queen moves any number of squares horizontally, vertically, or diagonally.

The path must be clear. The Queen may capture an opposing unit on the destination square but cannot move beyond it.

### 4.5 Rook

The Rook moves any number of squares horizontally or vertically.

The path must be clear. The Rook may capture an opposing unit on the destination square but cannot move beyond it.

### 4.6 Bishop

The Bishop moves any number of squares diagonally.

The path must be clear. The Bishop may capture an opposing unit on the destination square but cannot move beyond it.

### 4.7 Knight

The Knight moves in an L-shaped pattern: two squares along one rank or file and one square perpendicular to that direction.

The Knight may jump over other units.

It may capture an opposing unit on its destination square.

### 4.8 Pawn

A Pawn moves forward one square when the destination square is empty.

A Pawn may move forward two squares from its original starting square if:

- It has not previously moved.
- The intermediate square is empty.
- The destination square is empty.

A Pawn captures one square diagonally forward when that square contains an opposing unit.

A Pawn cannot move forward into an occupied square and cannot capture a unit directly in front of it.

Pawns may capture the opposing King.

Pawns may use en passant under Section 6.

Pawns must promote upon reaching the final rank under Section 7.

## 5. Castling

FTW uses an adapted Chess960 castling procedure.

Castling is a single move involving the original King and one designated original Rook.

### 5.1 Destinations

There are two castling destinations.

**G-side castling:**
- King finishes on the g-file.
- Rook finishes on the f-file.

**C-side castling:**
- King finishes on the c-file.
- Rook finishes on the d-file.

These destinations apply to both White and Black.

For this ruleset, the original Rook on the higher-file side of the King is assigned to G-side castling. The original Rook on the lower-file side of the King is assigned to C-side castling.

### 5.2 Eligibility

Castling is available only when:

- The original King is still present on its original starting square.
- The selected original Rook is still present on its original starting square.
- Neither piece has previously moved.
- Neither piece has been captured.
- Both required travel routes are clear under Section 5.3.
- The final squares can be occupied by the King and Rook without displacing any third unit.

A Rook created through Pawn promotion cannot be used for castling.

### 5.3 Route-Clearance Procedure

Castling must be evaluated as one atomic operation.

Perform the following procedure:

1. Identify the original King and the selected original Rook.
2. Identify their respective final squares.
3. Determine the horizontal route from the King's starting square to its final square, including both endpoints.
4. Determine the horizontal route from the Rook's starting square to its final square, including both endpoints.
5. Temporarily remove the King and selected Rook from the board.
6. Check every square in the union of both routes.
7. If any square in that union is occupied by a third unit, castling is illegal.
8. If every square is clear, place the King and Rook on their final squares simultaneously.

The two routes may overlap.

The starting square of either castling piece may be the final square of the other castling piece. This does not prevent castling because both pieces are temporarily removed before route clearance is checked.

### 5.4 Special Chess960 Cases

The procedure supports all of the following:

- The King moves while the Rook also moves.
- The King remains on its destination square while the Rook moves.
- The Rook remains on its destination square while the King moves.
- The King and Rook exchange their squares.

All are valid when the eligibility and route-clearance requirements are satisfied.

### 5.5 Attacked Squares

Attacked squares do not affect castling eligibility.

A King may castle while:

- Its starting square is attacked.
- A square along its route is attacked.
- Its destination square is attacked.

There are no check-related castling restrictions in FTW.

### 5.6 Castling Rights

Each player begins with two castling rights: G-side and C-side.

The rights are lost permanently as follows:

- When the original King makes an ordinary move, both rights are lost.
- When the original King is captured, both rights are lost.
- When the original G-side Rook moves or is captured, the G-side right is lost.
- When the original C-side Rook moves or is captured, the C-side right is lost.
- When the King castles on either side, both of that player's castling rights are lost.

The last rule applies even when the King does not physically change squares during castling.

A lost castling right cannot be restored by returning a piece to its original square or by promoting a Pawn to a Rook.

## 6. En Passant

En passant follows the standard Pawn-capture pattern, adapted to FTW's absence of self-check restrictions.

An en passant capture is available when:

1. An opposing Pawn has just advanced two squares from its original starting square.
2. The advancing Pawn finishes beside a Pawn belonging to the player whose turn is next.
3. That player's Pawn is positioned to capture the advancing Pawn diagonally.
4. The en passant destination square is empty.

The capturing Pawn moves diagonally to the square passed over by the advancing Pawn.

The advancing Pawn is removed from the board.

En passant is available only during the immediately following turn. It expires when that turn ends, whether through a normal move or a forced pass.

A player with an available en passant capture has at least one legal move and therefore cannot be required to make a forced pass.

An en passant capture is not prohibited by a pin, an attacked King, or any self-check consideration.

## 7. Pawn Promotion

When a Pawn reaches the final rank, it must be promoted as part of the same move.

The player must choose one of the following pieces:

- Queen
- Rook
- Bishop
- Knight

Promotion to a King is not allowed.

The promoted piece becomes active immediately when the move is completed.

A player may have more than one Queen, Rook, Bishop, or Knight as a result of promotion.

A promoted Rook never gains an original Rook's castling rights.

## 8. Forced Pass

Voluntary passing is not allowed.

At the beginning of a turn, if the player whose turn it is has no legal moves, that player must make an automatic forced pass unless the game ends by mutual immobility.

A forced pass:

- Moves no unit.
- Captures no unit.
- Consumes one turn.
- Changes the side to move.
- Expires any en passant target that is no longer available.
- Counts as one ply.
- Is recorded as `--`.

A forced pass does not change any remaining castling rights.

### 8.1 Mutual Immobility

A draw by mutual immobility occurs when:

- Both players still have at least one unit.
- The player whose turn it is has no legal moves.
- The opponent also has no legal moves in the hypothetical position that would result from a forced pass.

To evaluate this condition:

1. Generate all FTW legal moves for the player whose turn it is.
2. If at least one legal move exists, mutual immobility does not apply.
3. If no legal move exists, construct a hypothetical position in which the turn is passed to the opponent.
4. In that hypothetical position, keep the board and castling rights unchanged, clear the en passant opportunity, and change the side to move.
5. Generate all FTW legal moves for the opponent.
6. If the opponent also has no legal move, the game is drawn by mutual immobility.
7. Otherwise, the original player must make a forced pass.

No forced pass is recorded when mutual immobility ends the game.

## 9. Draw Conditions

FTW v1.0-alpha recognizes four draw conditions:

1. Bishop-lock.
2. Threefold repetition.
3. Fivefold repetition.
4. Mutual immobility.

No 50-move rule or 75-move rule is used.

There is no general insufficient-material draw rule beyond the specific Bishop-lock condition.

### 9.1 Bishop-Lock

Bishop-lock is an automatic draw when all of the following conditions are met:

- Every remaining unit on the board is a Bishop.
- Both players have at least one Bishop remaining.
- All White Bishops occupy squares of one color.
- All Black Bishops occupy squares of the opposite color.

A Bishop can only move on squares of its own color. Under this configuration, no White Bishop can ever capture a Black Bishop, and no Black Bishop can ever capture a White Bishop.

The position is therefore drawn.

Promoted Bishops are treated in the same way as other Bishops for this condition.

Bishop-lock is a deliberately narrow dead-position rule. It does not attempt to identify every possible position in which victory may be impossible.

### 9.2 Threefold Repetition

A player may claim a draw when the current position has occurred at least three times.

The claim must be made before that player makes a normal move or a forced pass.

A player cannot claim a threefold repetition based solely on a move they intend to make. The current position must already have occurred at least three times.

The initial position counts as the first occurrence.

### 9.3 Fivefold Repetition

The game is automatically drawn when an identical position has occurred five times.

No claim is required.

### 9.4 Mutual Immobility

Mutual immobility is governed by Section 8.1 and is an automatic draw.

## 10. Position Identity and Repetition Tracking

Two positions are identical for repetition purposes only when all of the following match:

1. The type, color, and square of every unit.
2. The side to move.
3. All remaining castling rights.
4. Any currently usable en passant opportunity.

### 10.1 Castling Rights in Position Identity

Castling rights must be tracked separately for each player and each side.

A castling right is tied to the original King and the specific original Rook assigned to that side.

A right that has been lost cannot reappear.

Two positions with identical piece placement but different castling rights are not identical.

### 10.2 En Passant in Position Identity

An en passant opportunity affects position identity only when at least one Pawn belonging to the side to move can actually make the capture under FTW movement and occupancy rules.

A raw en passant target square that cannot be used by any Pawn does not distinguish two positions for repetition purposes.

Because FTW has no self-check restrictions, an en passant capture is considered usable whenever its movement and occupancy requirements are satisfied.

### 10.3 Information Excluded from Position Identity

The following do not independently affect position identity:

- The number of moves already played.
- The fullmove counter.
- The halfmove counter.
- The move history, except where it changes castling rights or an en passant opportunity.
- Whether a Bishop, Rook, Queen, or Knight was created through promotion, unless that fact affects a separate right defined by these rules.

### 10.4 Position Recording

The initial position is recorded once before the first move.

After every completed non-terminal normal move or forced pass, the resulting position is recorded and its occurrence count is updated.

If a move eliminates the opponent's last unit, the game ends immediately and no further repetition or draw evaluation is performed.

## 11. Turn and Game Resolution

This section defines the order in which the game state is updated and evaluated.

### 11.1 Completing a Normal Move

When a player makes a legal move:

1. Execute the movement or capture.
2. Complete any special action, including promotion, en passant, or castling.
3. Update all affected castling rights.
4. Update or expire the en passant opportunity.
5. Change the side to move.
6. Check whether the opponent has zero units remaining.
7. If the opponent has zero units, the player who made the move wins immediately.
8. Otherwise, record the resulting position.
9. Evaluate automatic draw conditions.
10. If no automatic ending applies, begin the next player's turn.

Promotion is completed before the elimination check.

### 11.2 Automatic Draw Evaluation

After a non-terminal normal move or forced pass has been completed, evaluate the position-based automatic draw conditions in this order:

1. Bishop-lock.
2. Fivefold repetition.

If both conditions are satisfied at the same time, the result is still a draw. For record-keeping, Bishop-lock may be recorded as the primary reason.

Mutual immobility is also an automatic draw, but it is evaluated at the beginning of a turn after the active player's legal moves have been generated and found to be empty. It is not evaluated as a substitute for the position-based checks above.

### 11.3 Beginning a Turn

At the beginning of a turn:

1. Confirm that the game has not already ended.
2. Evaluate the position-based automatic draw conditions under Section 11.2.
3. Allow the player whose turn it is to claim threefold repetition if the current position has occurred at least three times.
4. Generate all legal FTW moves for that player.
5. If at least one legal move exists, the player must make a legal move.
6. If no legal move exists, evaluate mutual immobility under Section 8.1.
7. If mutual immobility applies, the game ends as a draw without recording a pass.
8. Otherwise, record a forced pass, switch the side to move, record the resulting position, and evaluate the position-based automatic draw conditions again.

This procedure repeats until the game ends.

### 11.4 Priority of Outcomes

Total elimination always takes priority over any draw condition that might otherwise be triggered by the same move.

A game that ends through total elimination is a win, not a draw.

## 12. Illegal Moves

An attempted move that does not satisfy these rules is illegal.

An illegal move:

- Does not change the board.
- Does not change the side to move.
- Does not consume a turn.
- Does not change castling rights.
- Does not change en passant availability.
- Does not count as a position occurrence.

The player must make a legal move instead.

Penalty systems for illegal moves in timed or formal competitions are outside this core ruleset and must be defined separately by the competition organizer.

## 13. Game Records and Notation

A game record should identify:

- The FTW rules version.
- The selected Chess960 position ID.
- The players and their assigned colors, if known.
- The move sequence.
- The final result.
- The reason the game ended.

Forced passes are recorded as `--`.

Castling is recorded as `O-O` for G-side castling and `O-O-O` for C-side castling.

Pawn promotion should identify the selected piece, such as `=Q`, `=R`, `=B`, or `=N`.

Captures may be marked with `x`.

Check and checkmate symbols are not used as game-status indicators in FTW.

## 14. Scope of the Core Rules

This document defines the core rules of FTW gameplay.

The following matters are not defined by this version:

- Chess clocks and time controls.
- Timeout results.
- Resignation procedures.
- Draw agreements.
- Tournament pairings and scoring.
- Penalties for illegal moves in formal competitions.
- Player eligibility and event administration.

A competition organizer may define additional administrative regulations, but those regulations must be published separately and must not silently change the core movement, victory, or draw rules of FTW.

## 15. Development Status

This document is **FTW v1.0-alpha — Red Team Revision Draft**.

It incorporates a rules review intended to remove identified ambiguities and contradictions.

The rules remain experimental. They require implementation testing, position-based testing, and practical playtesting before they can be considered stable.

Changes must be recorded in the project changelog.

---

**Fischer Total War**  
*Play until nothing remains.*
