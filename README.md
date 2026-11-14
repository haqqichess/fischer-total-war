
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

- **Total elimination:** Win by removing every opposing unit.
- **Chess960 setup:** Choose from 960 valid starting positions, identified using Scharnagl numbering.
- **Non-royal King:** The King can enter attacked squares and can be captured.
- **No self-check restrictions:** Players do not have to protect their King.
- **Kingless play:** A player can continue after losing their King.
- **Adapted castling:** Chess960 castling uses a defined simultaneous-placement procedure without attacked-square restrictions.
- **Forced pass:** A player with no legal moves automatically loses their turn unless mutual immobility ends the game.
- **Defined draw conditions:** Bishop-lock, threefold repetition, fivefold repetition, and mutual immobility.

## Quick Rules Overview

- FTW uses a standard 8×8 chessboard.
- The starting position is one of 960 Chess960 arrangements, identified by its Scharnagl position ID.
- Both players use the same back-rank file arrangement.
- All pieces retain their defined chess movement patterns.
- There are no check, checkmate, or self-check restrictions.
- The King can be captured without ending the game if its owner still has other units.
- Castling is performed as one atomic move under the adapted Chess960 procedure.
- En passant follows the standard capture pattern and expires when the eligible turn ends.
- Pawns promote to a Queen, Rook, Bishop, or Knight.
- A player with no legal moves must pass automatically unless mutual immobility applies.
- Repetition positions include piece placement, side to move, castling rights, and usable en passant opportunities.

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
