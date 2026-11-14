
# Castling in Fischer Total War

Fischer Total War uses an adapted version of Chess960 castling.

The procedure preserves the familiar final arrangement of the King and Rook while removing restrictions related to attacked squares.

Castling is treated as one atomic move. The King and Rook are placed on their final squares simultaneously.

## 1. Castling Destinations

FTW has two castling directions.

| Type | King destination | Rook destination |
|---|---|---|
| G-side castling | g-file | f-file |
| C-side castling | c-file | d-file |

These destinations apply to both White and Black.

The original Rook on the higher-file side of the King is assigned to G-side castling.

The original Rook on the lower-file side of the King is assigned to C-side castling.

## 2. Eligibility

Castling is legal only when all of the following conditions are met:

- The original King is still present on its original starting square.
- The selected original Rook is still present on its original starting square.
- Neither piece has previously moved.
- Neither piece has been captured.
- Both travel routes are clear under the procedure described in Section 3.
- No third unit occupies any square in the union of both routes after the King and selected Rook are temporarily removed.

A Rook created through Pawn promotion cannot be used for castling.

Castling rights are permanently lost when the original King or the corresponding original Rook moves or is captured.

## 3. The Castling Procedure

Castling must be evaluated as one atomic operation.

Follow these steps:

### Step 1 — Identify the Pieces

Identify the original King and the selected original Rook.

Confirm that both pieces are eligible to castle on the selected side.

### Step 2 — Determine the Destinations

For G-side castling:

- King destination: g-file.
- Rook destination: f-file.

For C-side castling:

- King destination: c-file.
- Rook destination: d-file.

The destination rank is the same as the starting rank of the pieces.

### Step 3 — Determine Both Routes

Determine the horizontal route from the King's starting square to its destination.

Determine the horizontal route from the Rook's starting square to its destination.

Both routes include their starting and destination squares.

### Step 4 — Temporarily Remove Both Pieces

Temporarily remove the King and selected Rook from the board.

No other unit is removed.

### Step 5 — Check Route Clearance

Examine every square in the union of the two routes.

If any square in that union is occupied by a third unit, castling is illegal.

The two routes may overlap.

The starting square of either castling piece may be the destination square of the other. This does not prevent castling because both pieces are temporarily removed before route clearance is checked.

### Step 6 — Place Both Pieces Simultaneously

If every required square is clear, place the King and Rook on their respective destination squares simultaneously.

The castling move is then complete.

The King and Rook are never treated as moving separately during this operation.

## 4. Special Chess960 Situations

The castling procedure supports the following situations.

### 4.1 Moving King and Rook

Both pieces move from their starting squares to their respective destinations.

### 4.2 Stationary King

The King may already be on its destination square.

In this case, the King remains on that square while the Rook moves to its destination.

Castling is still performed as one move.

### 4.3 Stationary Rook

The Rook may already be on its destination square.

In this case, the Rook remains on that square while the King moves to its destination.

Castling is still performed as one move.

### 4.4 King and Rook Exchange Squares

The King and Rook may exchange their starting squares when those squares are their respective final destinations.

Because both pieces are temporarily removed and placed simultaneously, this situation is valid when all other castling requirements are met.

## 5. Attacked Squares

Attacked squares do not affect castling eligibility.

A player may castle even when:

- The King is standing on an attacked square.
- The King crosses an attacked square.
- The King arrives on an attacked square.

This follows from FTW's non-royal King design.

There are no check-related restrictions in FTW, including restrictions on castling through or into attacked squares.

## 6. Castling Rights

Each player begins the game with two castling rights:

- G-side castling.
- C-side castling.

Castling rights are permanently lost under the following conditions:

| Event | Castling rights lost |
|---|---|
| Original King makes an ordinary move | Both G-side and C-side |
| Original King is captured | Both G-side and C-side |
| Original G-side Rook moves | G-side |
| Original G-side Rook is captured | G-side |
| Original C-side Rook moves | C-side |
| Original C-side Rook is captured | C-side |
| King castles on either side | Both G-side and C-side |

The rule for castling itself applies even when the King does not physically change squares.

A lost castling right cannot be restored by:

- Returning the original King to its starting square.
- Returning an original Rook to its starting square.
- Promoting a Pawn to a Rook.
- Moving another Rook onto an original Rook's starting square.

A promoted Rook never acquires an original Rook's castling right.

## 7. Recording Castling Rights

Castling rights must be tracked separately for each player and each side.

The rights belong to the original King and the specific original Rook assigned to that side.

Two board positions with identical piece placement but different remaining castling rights are not identical for repetition purposes.

When using FEN to record a Chess960 position, use a Chess960-compatible convention that preserves the identity of the original Rook associated with each remaining castling right.

Shredder-FEN is a suitable recording convention.

## 8. Summary

FTW castling follows these principles:

- The original King and selected original Rook must be eligible.
- Both pieces are temporarily removed before route clearance is checked.
- Every square in the union of both routes must be clear of third units.
- The two routes may overlap.
- The King and Rook are placed simultaneously.
- Stationary pieces and exchanged starting squares are supported.
- Attacked squares never restrict castling.
- Castling permanently removes both of the player's remaining castling rights.

For the complete game rules, see [RULES.md](../RULES.md).
