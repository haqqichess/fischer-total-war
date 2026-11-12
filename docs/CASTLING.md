
# Castling in Fischer Total War

FTW uses an adapted version of Chess960 castling.

The procedure keeps the familiar final arrangement of the King and Rook while removing restrictions related to attacked squares.

## 1. Castling Destinations

Castling has two possible directions.

| Type | King destination | Rook destination |
|---|---|---|
| Kingside | g-file | f-file |
| Queenside | c-file | d-file |

The selected Rook is the original Rook on that side of the King in the starting position.

## 2. Eligibility

Castling is allowed only when:

- The original King is still on its original starting square.
- The selected original Rook is still on its original starting square.
- Neither piece has moved.
- Neither piece has been captured.
- Both travel routes are clear under the procedure described below.

A Rook created through Pawn promotion cannot be used to regain a castling right.

Moving a King or its corresponding original Rook permanently removes the relevant castling right.

## 3. The Castling Procedure

Castling is treated as one atomic move, not as two separate moves.

Follow these steps:

### Step 1 — Select the Rook

Choose either the original Kingside Rook or the original Queenside Rook.

### Step 2 — Check Eligibility

Confirm that the original King and selected original Rook are still present on their starting squares and have never moved.

### Step 3 — Remove Both Pieces Temporarily

Temporarily remove the King and selected Rook from the board.

This allows the procedure to handle positions where either piece would otherwise block the other's route.

### Step 4 — Check Both Routes

Check every square along:
- The King’s route from its starting square to its destination.
- The Rook’s route from its starting square to its destination.

Both routes, including their destination squares, must be clear of every other unit.

If a third unit occupies any square on either route, castling is not allowed.

### Step 5 — Place Both Pieces

If both routes are clear, place the King and Rook on their final squares simultaneously.

The move is complete.

## 4. Special Chess960 Situations

The procedure supports positions in which a piece may already occupy its destination square.

### Stationary King

The King may already be on the g-file or c-file. It remains there while the Rook moves to its destination.

### Stationary Rook

The Rook may already be on the f-file or d-file. It remains there while the King moves to its destination.

### King and Rook Exchange Squares

The King and Rook may exchange their starting squares when their final destinations require it.

Because both pieces are placed simultaneously, this is treated as one valid castling move if every other requirement is met.

## 5. Attacked Squares

Attacked squares do not affect castling eligibility.

A player may castle even when:
- The King is standing on an attacked square.
- The King crosses an attacked square.
- The King arrives on an attacked square.

This follows from FTW's non-royal King design. There are no check-related restrictions.

## 6. Important Notes

- Castling is one move and consumes one turn.
- Both pieces must be eligible before the move.
- Both routes must be clear after temporarily removing the King and Rook.
- The two pieces must be placed simultaneously.
- Once the King or selected original Rook has moved, that castling right cannot be restored.

For the complete rules, see [RULES.md](../RULES.md).
