
# Game Design

## The Idea Behind Fischer Total War

Fischer Total War (FTW) began with a simple question:

**What would chess look like if the objective were to eliminate every opposing piece instead of delivering checkmate?**

FTW explores that idea while keeping much of the familiar structure of chess. The board remains 8×8, the pieces retain their traditional movement, and players still take turns making moves.

The biggest change is the purpose of the game.

A King is no longer protected by a special royal status. It is a unit that can fight, move, and be captured. Its loss does not decide the game. The battle continues until one player has no units left.

## Core Design Principles

### 1. Total Elimination

The goal is to remove every opposing unit.

Capturing a King can be an important moment, but it is not the final objective. Players must continue dealing with the opponent's remaining forces.

### 2. Familiar Movement, Different Objective

FTW keeps the standard movement and capture rules of chess wherever possible.

This makes the game recognizable to chess players while allowing the new victory condition to change how they approach each position.

### 3. A Non-Royal King

The King is treated as a normal unit rather than a piece that must be protected at all times.

There are no check or checkmate restrictions. Players are free to move their Kings into attacked squares, and the game can continue without them.

### 4. Chess960 Starting Positions

FTW uses the 960 valid Chess960 starting positions.

The randomized arrangement changes the opening position while keeping the familiar pieces and board. It also prevents the game from depending on only one traditional starting setup.

### 5. Rules That Can Be Tested

FTW is being developed as an experimental variant. Its rules should be understandable, testable, and open to criticism.

Unusual situations should be documented and discussed rather than resolved through assumptions that are not written in the rules.

## What FTW Is Trying to Explore

The current design creates several questions worth investigating through actual games:

- How does total elimination affect players' decisions?
- How does the non-royal King change its strategic value?
- How do players approach the game after one side loses its King?
- How often do forced passes occur?
- Does the adapted Chess960 castling rule produce unclear positions?
- Are the current draw conditions sufficient for practical play?

These are questions for playtesting, not claims that have already been proven.

## Current Design Boundaries

The v1.0-alpha rules intentionally avoid adding too many new systems.

For now, FTW retains:
- The standard chessboard.
- Traditional piece movement.
- Traditional Pawn promotion choices, with no promotion to a King.
- A Chess960 starting position.
- A limited set of clearly defined draw conditions.

The current draft does not introduce new pieces, board sizes, movement patterns, or a separate resource system.

## Development Status

FTW v1.0-alpha is a working rules draft.

Its purpose is to provide a consistent version that people can play, review, and discuss. Further versions may change existing rules when playtesting identifies a genuine problem.

The goal is not to change chess simply for the sake of changing it. The goal is to explore a different way to play a familiar game.
