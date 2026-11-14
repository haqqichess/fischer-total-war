
# Fischer Total War (FTW)

**A Chess960-based chess variant built around one simple objective: total elimination.**

Fischer Total War (FTW) is an experimental chess variant that changes the objective of traditional chess. Instead of winning by checkmate, a player must eliminate every unit belonging to the opponent.

The King is still an important piece, but it is no longer a royal piece. It can move, capture, and be captured like any other unit. Losing the King does not end the game.

FTW combines the randomized starting positions of Chess960 with a different approach to chess combat.

## Project Status

**Version:** v1.0-alpha — Red Team Revision Draft  
**Status:** Experimental — Open for Playtesting  
**Creator:** Haqqi Muazzam  
**Last revised:** November 14, 2026

This revision incorporates a detailed review of the rules, including legal moves, Chess960 castling, forced passes, repetition, and draw conditions.

The rules remain experimental. Further validation through implementation tests and practical games is required before a stable release.

## The Objective

The objective is to capture every opposing unit on the board.

Each player starts with 16 units. These include the King, Queen, Rooks, Bishops, Knights, and Pawns.

A player wins when the opponent has no units remaining. Capturing the King alone is not enough.

## What Makes FTW Different?

- **Total elimination:** The game is won by removing every opposing unit, not by checkmate.
- **Chess960 setup:** The game begins with one of the 960 valid Chess960 starting positions.
- **Non-royal King:** The King can enter attacked squares and can be captured.
- **No check or checkmate:** There are no check restrictions or checkmate conditions.
- **Kingless play:** A player can continue playing after losing their King.
- **Forced pass:** A player with no legal moves automatically loses their turn.

## Quick Rules Overview

- The board and piece movements follow standard chess.
- Both sides use the same Chess960 back-rank arrangement.
- Pawns begin on their usual starting ranks.
- Captures follow normal chess movement rules.
- Castling follows an adapted Chess960 procedure.
- Pawns can promote to a Queen, Rook, Bishop, or Knight.
- En passant is available under standard conditions.
- A player with no legal move must pass automatically.
- Draws are governed by the specific conditions listed in the rules.

For the complete rules, see [RULES.md](RULES.md).

## Documentation

| File | Description |
|---|---|
| [RULES.md](RULES.md) | Complete rules of Fischer Total War |
| [GAME_DESIGN.md](docs/GAME_DESIGN.md) | The ideas and principles behind the variant |
| [CASTLING.md](docs/CASTLING.md) | Detailed explanation of FTW castling |
| [DRAW_CONDITIONS.md](docs/DRAW_CONDITIONS.md) | Draw rules and repetition conditions |
| [TERMINOLOGY.md](docs/TERMINOLOGY.md) | Definitions of important terms |
| [CHANGELOG.md](CHANGELOG.md) | History of rule changes |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to submit feedback and proposals |
| [LICENSE](LICENSE) | License for the project documentation |

## Playtesting and Feedback

FTW is still being developed through discussion and playtesting.

Feedback is welcome, especially when it identifies:
- Unclear or incomplete rules.
- Situations that produce unexpected outcomes.
- Potential problems with castling, forced passes, or draw conditions.
- Tactical or strategic issues that appear during actual games.

When reporting an issue, include the starting position, move sequence, and the rule involved whenever possible.

Constructive criticism is encouraged. The purpose of playtesting is to find problems before the rules become stable.

## License and Free Play

Fischer Total War is intended to be free to play.

The documentation in this repository is licensed under **CC BY 4.0**. See [LICENSE](LICENSE) for the scope and attribution requirements.

## Creator

Fischer Total War was created by **Haqqi Muazzam**.

The project is independently developed and is not affiliated with or endorsed by FIDE or any official chess governing body.

---

*Fischer Total War — Play until nothing remains.*
