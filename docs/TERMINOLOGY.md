
# Fischer Total War — Terminology

This document defines the terms used throughout the Fischer Total War (FTW) rules and supporting documentation.

Consistent terminology helps players, reviewers, and developers interpret the rules in the same way.

## 1. Game and Board Terms

| Term | Definition |
|---|---|
| **FTW** | Abbreviation for Fischer Total War. |
| **Chess Variant** | A game based on chess that uses a different set of rules or objectives. |
| **Board** | The standard 8×8 chessboard used in FTW. |
| **Square** | One of the 64 individual spaces on the board. |
| **File** | A vertical column on the board, identified by the letters a–h. |
| **Rank** | A horizontal row on the board, identified by the numbers 1–8. |
| **Unit** | Any Pawn or piece belonging to a player. Each player's 16 starting units include the King. |
| **Piece** | A King, Queen, Rook, Bishop, or Knight. Pawns are referred to separately when precision is needed. |
| **Total Elimination** | The removal of every unit belonging to one player. |
| **Non-Royal King** | The King in FTW. It has its usual movement but no special protection from capture. |
| **Kingless Play** | A game situation in which a player continues playing after their King has been captured. |
| **Starting Position** | The initial arrangement of all units before the first move. |

## 2. Chess960 Terms

| Term | Definition |
|---|---|
| **Chess960** | A chess starting-position system that provides 960 valid arrangements of the back-rank pieces. |
| **Scharnagl Position ID** | A number from 0 to 959 identifying a valid Chess960 starting position. |
| **Position 518** | The Scharnagl ID corresponding to the traditional chess starting arrangement. |
| **Original King** | The specific King present in a player's starting position. Its identity determines castling eligibility. |
| **Original Rook** | One of the two Rooks present in a player's starting position. Its identity determines castling eligibility. |
| **FEN** | Forsyth–Edwards Notation, a notation used to describe a chess position. |
| **Shredder-FEN** | A Chess960-compatible FEN convention that records castling rights using the relevant Rook files. |

## 3. Movement and Capture Terms

| Term | Definition |
|---|---|
| **Legal Move** | A move that satisfies FTW movement, capture, occupancy, and special-move requirements. It is not subject to self-check restrictions. |
| **Capture** | A move that removes an opposing unit from the board. |
| **Attacked Square** | A square that can be captured by an opposing unit under the current movement and capture rules. An attacked square does not restrict movement in FTW. |
| **Self-Check** | A restriction in traditional chess that prohibits a move leaving the player's own King under attack. FTW does not use this restriction. |
| **Promotion** | The replacement of a Pawn with a Queen, Rook, Bishop, or Knight when it reaches the final rank. |
| **En Passant** | A special Pawn capture available immediately after an opposing Pawn advances two squares from its starting square, when the capturing Pawn is positioned to make the capture. |
| **Usable En Passant Opportunity** | An en passant capture that can actually be performed by at least one Pawn belonging to the side to move. |

## 4. Castling Terms

| Term | Definition |
|---|---|
| **Castling** | A single atomic move involving an eligible original King and an eligible original Rook. |
| **G-side Castling** | Castling in which the King finishes on the g-file and the selected original Rook finishes on the f-file. |
| **C-side Castling** | Castling in which the King finishes on the c-file and the selected original Rook finishes on the d-file. |
| **Castling Right** | The remaining permission to castle with an eligible original King and original Rook on a specific side. |
| **Route Clearance** | The procedure that checks whether all squares along both castling routes are clear of third units after the King and selected Rook are temporarily removed. |
| **Atomic Move** | A move treated as one indivisible operation. In castling, the King and Rook are placed on their final squares simultaneously. |
| **Stationary King** | A castling situation in which the King is already on its destination square and does not physically change squares. |
| **Stationary Rook** | A castling situation in which the Rook is already on its destination square and does not physically change squares. |

## 5. Turn and Game-State Terms

| Term | Definition |
|---|---|
| **Side to Move** | The player whose turn it is to make a move or forced pass. |
| **Ply** | One completed turn by a single player, including a normal move or forced pass. |
| **Forced Pass** | An automatic turn consumed when the active player has no legal moves and mutual immobility does not apply. It is recorded as `--` and counts as one ply. |
| **Hypothetical Pass** | A temporary evaluation in which the turn is switched without moving any unit, to determine whether the opponent has a legal move. It does not change the actual game state. |
| **Mutual Immobility** | A draw condition in which the active player has no legal move and the opponent would also have no legal move after a hypothetical forced pass. |
| **Illegal Move** | An attempted move that does not satisfy the movement, capture, occupancy, or special-move requirements of FTW. |
| **Game-End Priority** | The order used to determine which result takes precedence when a game-ending condition is reached. |
| **Position Recording** | The process of storing a completed position for repetition tracking. |

## 6. Draw and Repetition Terms

| Term | Definition |
|---|---|
| **Draw** | A game result in which neither player is declared the winner. |
| **Bishop-Lock** | An automatic draw condition in which all remaining units are Bishops, both players have at least one Bishop, and the two players' Bishops occupy opposite square colors. |
| **Threefold Repetition** | A claimable draw when the current position has occurred at least three times. |
| **Fivefold Repetition** | An automatic draw when the same position has occurred five times. |
| **Position Identity** | The information used to determine whether two positions count as identical for repetition purposes. It includes piece placement, side to move, castling rights, and usable en passant opportunities. |
| **Occurrence** | One recorded instance of a position for repetition tracking. |
| **Dead Position** | A position in which the game cannot produce a win under the applicable rules. FTW v1.0-alpha recognizes only the specifically defined Bishop-lock condition as a general material-based automatic draw. |

## 7. Development Terms

| Term | Definition |
|---|---|
| **Playtesting** | The process of playing games to identify unclear rules, unexpected situations, and possible improvements. |
| **Red Team Audit** | A critical review intended to identify ambiguities, contradictions, and weaknesses in the rules. |
| **Conformance Test** | A test that checks whether a rules implementation produces the result required by the documented rules. |
| **Alpha Version** | An experimental development version that remains open to testing and revision. |
| **Ruleset** | The complete collection of rules defining how FTW is played. |
| **Implementation** | A software or physical system that applies the FTW rules to a playable game. |

## 8. Usage Notes

To keep the documentation consistent:

- Use **unit** when referring to any Pawn or piece, including the King.
- Use **piece** when referring specifically to a King, Queen, Rook, Bishop, or Knight.
- Use **total elimination** when describing the removal of every opposing unit.
- Use **non-royal King** when explaining the King’s status in FTW.
- Use **G-side** and **C-side** instead of traditional kingside and queenside castling terminology.
- Use **forced pass** only for an automatic pass caused by having no legal moves.
- Use **usable en passant opportunity** when discussing repetition identity.
- Do not use check, checkmate, or stalemate as game-ending conditions in FTW.

New terms introduced in future rules revisions should be added to this document.

---

**Fischer Total War**  
*Play until nothing remains.*
