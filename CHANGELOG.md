
# Changelog

All notable changes to Fischer Total War (FTW) are documented here.

This changelog records changes to the rules and documentation. It does not necessarily describe changes to a software implementation.

## v1.0-alpha — Red Team Revision Draft

**Date:** November 14, 2026  
**Status:** Experimental — Open for Playtesting

This revision addresses ambiguities and inconsistencies identified during a structured review of the previous rules draft.

### Movement and Captures

- Defined legal moves independently of traditional check and self-check restrictions.
- Specified movement, obstruction, occupancy, and capture rules for every piece.
- Clarified King adjacency and King capture.
- Defined Pawn movement and capture more explicitly.

### Castling

- Introduced G-side and C-side terminology.
- Formalized the castling route-clearance procedure.
- Defined simultaneous placement of the King and Rook.
- Clarified overlapping routes and stationary castling pieces.
- Specified permanent castling-right loss, including after castling itself.
- Confirmed that promoted Rooks cannot regain original Rook castling rights.

### Special Moves

- Clarified en passant availability and expiration.
- Confirmed that an available en passant capture is a legal move.
- Defined Pawn promotion as part of the move that reaches the final rank.
- Restricted promotion to Queen, Rook, Bishop, or Knight.

### Forced Pass and Draws

- Formalized forced-pass resolution.
- Defined mutual immobility using a hypothetical pass.
- Clarified Bishop-lock requirements.
- Defined position identity for repetition tracking.
- Clarified claimable threefold repetition.
- Clarified automatic fivefold repetition.
- Confirmed that no 50-move or 75-move rule is used.

### Game Resolution

- Established a consistent order for completing moves, updating game state, recording positions, and evaluating game-ending conditions.
- Added core illegal-move handling.
- Clarified the priority of total elimination over draw conditions.
- Defined the boundary between gameplay rules and competition administration.

### Position Recording

- Adopted Scharnagl numbering for Chess960 starting positions.
- Specified Chess960-compatible FEN recording.
- Clarified the information used to identify repeated positions.

### Test Specifications

- Added focused edge-case coverage for sliding-piece obstruction, capture stopping, Knight occupancy, Black Pawn direction, Pawn restrictions, side-to-move position identity, en passant capture and expiration, and all permitted promotion choices.
- Replaced vague promotion examples with reproducible board positions and explicit promotion choices.
- Clarified the 50-move and 75-move test thresholds as 100 and 150 consecutive plies respectively.
- Added direct links to all test specifications from the README.

This revision is a rules clarification and correction draft. It has not yet passed exhaustive implementation testing or practical playtesting.

## Earlier v1.0-alpha Draft — Revised for Playtesting

**Date:** November 12, 2026  
**Status:** Superseded by the Red Team Revision Draft

This earlier draft established the first complete experimental ruleset for public discussion and playtesting.

### Core Rules

- Introduced total elimination as the victory condition.
- Adopted Chess960 starting positions.
- Made the King a non-royal unit that can be captured.
- Removed check, checkmate, and stalemate.
- Allowed play to continue after a King is captured.

### Movement and Special Rules

- Retained standard movement and captures for all pieces.
- Introduced an adapted Chess960 castling procedure.
- Retained standard en passant with a forced-pass expiration clause.
- Allowed promotion to a Queen, Rook, Bishop, or Knight.
- Introduced automatic forced passes when a player has no legal moves.

### Draw Conditions

- Added the conservative Bishop-lock condition.
- Added claimable threefold repetition.
- Added automatic fivefold repetition.
- Added mutual immobility as a draw condition.
- Excluded the 50-move and 75-move rules.

### Documentation

- Established the initial rules document and supporting design documents.
- Added terminology and contribution guidelines.
- Selected CC BY 4.0 for the project documentation.

This draft was replaced after the Red Team review identified ambiguities and implementation concerns.

---

Further changes will be recorded here as the rules evolve.
