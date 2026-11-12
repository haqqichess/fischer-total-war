
# Fischer Total War — Official Rules Draft

**Version:** v1.0-alpha  
**Status:** Revised for Playtesting  
**Last updated:** November 12, 2026

## 1. Introduction

Fischer Total War (FTW) is a chess variant based on the Chess960 starting-position system.

Unlike traditional chess, FTW does not use checkmate as its winning condition. The objective is to eliminate every unit belonging to the opponent.

The King is no longer a royal piece. It remains on the board as a normal combat unit and can be captured. The game continues after a King is captured, as long as the player's other units remain.

These rules define the current experimental version of FTW. They may be revised as a result of playtesting and further analysis.

## 2. The Board and Starting Position

### 2.1 Board

FTW is played on a standard 8×8 chessboard with 64 squares.

The board uses the usual file and rank notation:
- Files: a–h
- Ranks: 1–8

White moves first.

### 2.2 Chess960 Setup

The starting position is selected from the 960 valid Chess960 starting positions.

Both players use the same back-rank arrangement. The black back rank uses the same file order as the white back rank.

Pawns occupy their normal starting ranks:
- White Pawns: rank 2
- Black Pawns: rank 7

The selected position must follow the standard Chess960 arrangement requirements, including:
- The Bishops must begin on opposite-colored squares.
- The King must begin between the two Rooks.
- All other pieces occupy the remaining back-rank squares.

For reproducibility, record the selected Chess960 position ID using the numbering system of the generator. A Chess960-compatible FEN representation should also be recorded when available. The notation convention should be stated whenever a position is shared.

## 3. Objective and Victory

The objective of FTW is to eliminate all opposing units.

Each player begins with 16 units:
- 1 King
- 1 Queen
- 2 Rooks
- 2 Bishops
- 2 Knights
- 8 Pawns

A player wins immediately when the opponent has no units remaining on the board.

Capturing the opponent's King does not end the game if any of their other units remain.

A player whose King has been captured may continue playing normally with their remaining units. A player can therefore continue a game without a King.

## 4. Piece Movement and Captures

Unless a rule below states otherwise, all pieces move and capture according to standard chess movement rules.

### 4.1 King

The King moves one square in any direction:
- Horizontally
- Vertically
- Diagonally

The King is not a royal piece in FTW. It can move onto an attacked square, remain on an attacked square, and be captured.

### 4.2 Other Pieces

Queens, Rooks, Bishops, Knights, and Pawns retain their standard chess movement and capture rules.

A player may capture any opposing unit, including the opposing King.

A player may not move onto a square occupied by one of their own units.

### 4.3 No Check or Checkmate

FTW has no check, checkmate, or stalemate conditions.

A move is not illegal simply because it leaves the player's King under attack or allows the opponent to capture it on a later turn.

There is no requirement to protect the King.

The rules do not use attacked squares as a general restriction on movement or castling.

## 5. Castling

Castling follows an adapted Chess960 procedure.

The King and the selected original Rook must both still be present on their original starting squares and must never have moved.

The final squares are:
- Kingside castling: King to g-file, Rook to f-file.
- Queenside castling: King to c-file, Rook to d-file.

Before castling, both the King and Rook are temporarily removed from the board. The squares along both travel routes must then be clear of all other units, including the final destination squares.

Once both routes are clear, the King and Rook are placed on their final squares simultaneously.

This procedure also applies when:
- The King does not change squares.
- The Rook does not change squares.
- The King and Rook exchange starting squares.

Attacked squares do not prevent castling. The King may castle while standing on an attacked square, moving through an attacked square, or arriving on an attacked square.

A castling right is lost when the original King or the corresponding original Rook moves or is captured. A promoted Rook cannot restore a lost castling right.

For the complete procedure and examples, see [docs/CASTLING.md](docs/CASTLING.md).

## 6. En Passant

En passant follows the standard chess rule.

An en passant opportunity is available only on the turn immediately following the opposing Pawn's two-square advance.

If the eligible player has no legal moves and must make a forced pass, the en passant opportunity expires.

## 7. Pawn Promotion

When a Pawn reaches the final rank, it must be promoted immediately.

The Pawn may become one of the following:
- Queen
- Rook
- Bishop
- Knight

A Pawn cannot promote to a King.

## 8. Forced Pass

A player may not voluntarily pass a turn.

If a player has no legal moves, that turn is automatically recorded as a forced pass.

A forced pass:
- Does not move or capture any unit.
- Consumes the player's turn.
- Switches the turn to the opponent.
- Is recorded as `--`.
- Causes any available en passant opportunity for that player to expire.

A player may have to pass even when they still have units on the board.

### 8.1 Mutual Immobility

If both players have no legal moves in the same board position, and both still have at least one unit, the game is drawn by mutual immobility.

The game is not recorded as a forced pass when this condition applies.

## 9. Draw Conditions

FTW v1.0-alpha recognizes the following draw conditions:

1. Bishop-lock.
2. Threefold repetition, which may be claimed.
3. Fivefold repetition, which is automatic.
4. Mutual immobility.

No 50-move or 75-move rule is used in this version.

The complete definitions are available in [docs/DRAW_CONDITIONS.md](docs/DRAW_CONDITIONS.md).

## 10. Repetition and Position Identity

A position is considered identical for repetition purposes when all of the following match:

- The type, color, and square of every unit.
- The side to move.
- All remaining castling rights, including the rights associated with the original King and original Rooks.
- Any usable en passant opportunity.

A position is recorded at the start of the game and after each completed move or forced pass, unless the game has already ended by total elimination.

### 10.1 Threefold Repetition

A player may claim a draw when the current position has occurred at least three times.

The claim must be made before the player makes a normal move or before a forced pass is recorded for that turn.

### 10.2 Fivefold Repetition

The game is automatically drawn when the same position has occurred five times.

## 11. Game-End Priority

When a move is completed, the following order determines the game's status:

1. **Total elimination:** If the opposing player has no units remaining, the player who made the move wins immediately.
2. **Position recording:** If the game has not ended, record the resulting position for repetition tracking.
3. **Automatic draws:** Check fivefold repetition, Bishop-lock, and mutual immobility.
4. **Threefold claim:** If the current position has occurred three times, the player whose turn it is may claim a draw before moving or passing.
5. **Forced pass:** If the player whose turn it is has no legal moves, record a forced pass unless mutual immobility has already ended the game.

After a forced pass, record the new position with the updated side to move and re-evaluate the game status.

Total elimination always takes priority over a draw condition that might otherwise apply.

## 12. Status of These Rules

This document describes **FTW v1.0-alpha — Revised for Playtesting**.

The rules are experimental and may contain situations that require further clarification or adjustment.

Changes should be documented in the changelog so that players, testers, and developers can identify which version they are using.

---

**Fischer Total War**  
*Play until nothing remains.*
