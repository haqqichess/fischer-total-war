
# Fischer Total War — Terminology

This document defines the terms used throughout the FTW rules and documentation.

Consistent terminology helps players, reviewers, and developers understand the game in the same way.

| Term | Definition |
|---|---|
| **FTW** | Abbreviation for Fischer Total War. |
| **Unit** | Any Pawn or piece belonging to a player. A player's 16 starting units include the King. |
| **Total Elimination** | The removal of every unit belonging to one player. |
| **Non-Royal King** | The King in FTW. It has its usual one-square movement but no special protection from capture. |
| **Kingless Play** | A game situation in which a player continues playing after their King has been captured. |
| **Chess960** | The chess starting-position system that provides 960 valid arrangements of the back-rank pieces. |
| **Starting Position ID** | The identifier used by a Chess960 position generator to identify a selected starting arrangement. |
| **FEN** | A notation used to describe a board position. A Chess960-compatible convention should be used when recording FTW positions. |
| **Original King** | The specific King that a player had at the beginning of the game. Its identity matters for castling rights. |
| **Original Rook** | A Rook that began the game in one of the two original Rook positions. A promoted Rook does not qualify. |
| **Castling Right** | The remaining permission to castle with an eligible original King and original Rook on a particular side. |
| **Kingside Castling** | Castling toward the original Kingside Rook, with the King finishing on the g-file and the Rook on the f-file. |
| **Queenside Castling** | Castling toward the original Queenside Rook, with the King finishing on the c-file and the Rook on the d-file. |
| **Forced Pass** | An automatic loss of a turn when a player has no legal moves. It is recorded as `--`. |
| **Bishop-Lock** | An automatic draw condition in which all surviving units are Bishops, and the two players' Bishops occupy opposite square colors. |
| **Mutual Immobility** | A draw condition in which both players still have units but neither has a legal move in the same position. |
| **Threefold Repetition** | A claimable draw when the same position has occurred at least three times. |
| **Fivefold Repetition** | An automatic draw when the same position has occurred five times. |
| **Position Identity** | The information used to determine whether two positions count as the same for repetition. It includes unit placement, side to move, castling rights, and usable en passant rights. |
| **Playtesting** | The process of playing games to identify unclear rules, unexpected situations, and possible improvements. |
| **Alpha Version** | An early experimental version that remains open to testing and revision. |

## Usage Notes

- Use **unit** when referring to any Pawn or piece, including the King.
- Use **piece** when referring to a particular chess piece or piece type.
- Use **elimination** when describing the removal of all units belonging to one player.
- Do not use check, checkmate, or stalemate as game-ending conditions in FTW.
- Use **forced pass** only for an automatic pass caused by having no legal moves. Voluntary passing is not allowed.

If a new term is introduced in a future rules revision, add its definition here.
