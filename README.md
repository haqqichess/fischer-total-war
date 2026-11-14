
# Fischer Total War (FTW)

**A Chess960-based chess variant built around one objective: total elimination.**

Fischer Total War (FTW) is an experimental chess variant that changes the objective of traditional chess. Instead of winning by checkmate, a player must eliminate every unit belonging to the opponent.

The King remains an important combat unit, but it no longer has royal status. It can move, capture, and be captured like any other unit. Losing the King does not end the game while the player still has other units remaining.

FTW combines the randomized starting positions of Chess960 with a different approach to chess combat.

## Project Status

**Version:** v1.0-alpha — Red Team Revision Draft  
**Status:** Experimental — Open for Playtesting  
**Creator:** Haqqi Muazzam  
**Last Revised:** November 14, 2026

This revision incorporates a structured review of the rules, including legal moves, Chess960 castling, forced passes, repetition, and draw conditions.

The rules remain experimental. Further validation through implementation tests, position-based testing, and practical games is required before a stable release.

## The Objective

The objective of FTW is to capture every opposing unit on the board.

Each player begins with 16 units:
- 1 King
- 1 Queen
- 2 Rooks
- 2 Bishops
- 2 Knights
- 8 Pawns

A player wins when the opponent has no units remaining.

Capturing the King alone is not enough. The game continues as long as the opponent has at least one other unit on the board.

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
- All pieces retain their defined movement patterns.
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
| [GAME_DESIGN.md](docs/GAME_DESIGN.md) | Design principles and ideas behind the variant |
| [CASTLING.md](docs/CASTLING.md) | Detailed explanation of FTW castling |
| [DRAW_CONDITIONS.md](docs/DRAW_CONDITIONS.md) | Draw rules and repetition conditions |
| [TERMINOLOGY.md](docs/TERMINOLOGY.md) | Definitions of important terms |
| [CHANGELOG.md](CHANGELOG.md) | History of rule changes |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to submit feedback and proposals |
| [LICENSE](LICENSE) | License for project documentation |

## Playtesting and Feedback

FTW is still being developed through discussion, testing, and review.

Feedback is welcome, especially when it identifies:

- Unclear or incomplete rules.
- Situations that produce unexpected outcomes.
- Problems involving castling, forced passes, or draw conditions.
- Tactical or strategic issues discovered during actual games.
- Differences between the written rules and a software implementation.

When reporting an issue, include the following whenever possible:

- The FTW rules version.
- The Chess960 starting position ID.
- The move sequence.
- The rule or section involved.
- The expected result.
- The actual result.

Constructive criticism is encouraged. The purpose of playtesting is to identify weaknesses before the rules become stable.

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

## License and Free Play

Fischer Total War is intended to be free to play.

The documentation in this repository is licensed under the Creative Commons Attribution 4.0 International License (CC BY 4.0).

The documentation license does not automatically apply to software, trademarks, logos, or third-party materials. See [LICENSE](LICENSE) for details.

## Creator

Fischer Total War was created by **Haqqi Muazzam**.

The project is independently developed and is not affiliated with or endorsed by FIDE or any official chess governing body.

---

**Fischer Total War**  
*Play until nothing remains.*
