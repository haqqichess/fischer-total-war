
# Changelog

All notable changes to Fischer Total War (FTW) are recorded here.

This project is currently in its experimental stage. Entries describe changes to the rules and documentation, not necessarily changes to a software implementation.

## v1.0-alpha — Red Team Revision Draft

**Date:** November 14, 2026  
**Status:** Experimental — Open for Playtesting

This revision addresses ambiguities and inconsistencies identified during a structured review of the previous rules draft.

### Movement and Captures
- Defined legal moves independently of traditional check and self-check restrictions.
- Specified movement, obstruction, occupancy, and capture rules for every piece.
- Clarified King adjacency and King capture.

### Castling
- Introduced G-side and C-side terminology.
- Formalized the route-clearance procedure.
- Defined simultaneous placement of the King and Rook.
- Clarified overlapping routes and stationary castling pieces.
- Specified permanent castling-right loss, including after castling itself.

### Special Moves
- Clarified Pawn movement and capture.
- Defined en passant availability and expiration.
- Specified promotion as part of the move that reaches the final rank.
- Confirmed that promoted Rooks cannot regain original Rook castling rights.

### Forced Pass and Draws
- Formalized forced-pass resolution.
- Defined mutual immobility using a hypothetical pass.
- Clarified Bishop-lock requirements.
- Defined position identity for repetition tracking.
- Clarified threefold claims and automatic fivefold repetition.

### Game Resolution
- Established a consistent order for completing moves, updating game state, recording positions, and evaluating game-ending conditions.
- Added core illegal-move handling.
- Clarified the boundary between gameplay rules and competition administration.

### Position Recording
- Adopted Scharnagl numbering for Chess960 starting positions.
- Specified Chess960-compatible FEN recording.

This revision is a rules clarification and correction draft. It has not yet passed exhaustive implementation testing or practical playtesting.

## v1.0-alpha — Revised for Playtesting

**Status:** Experimental

This version establishes the current rules draft for public discussion and playtesting.

### Core Rules
- Introduced total elimination as the victory condition.
- Adopted Chess960 starting positions.
- Made the King a non-royal unit that can be captured.
- Removed check, checkmate, and stalemate.
- Allowed play to continue after a King is captured.

### Movement and Special Rules
- Retained standard movement and captures for all pieces.
- Defined an adapted Chess960 castling procedure.
- Retained standard en passant with an expiration rule for forced passes.
- Allowed promotion to a Queen, Rook, Bishop, or Knight.
- Introduced automatic forced passes when a player has no legal moves.

### Draw Conditions
- Added the conservative Bishop-lock condition.
- Added claimable threefold repetition.
- Added automatic fivefold repetition.
- Added mutual immobility as a draw condition.
- Excluded the 50-move and 75-move rules.

### Documentation
- Established the rules draft and supporting design documents.
- Added terminology and contribution guidelines.
- Published the documentation under CC BY 4.0.

---

Earlier development notes may be added here as the rules evolve.
