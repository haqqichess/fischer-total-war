
# Castling in Fischer Total War

FTW uses an adapted version of Chess960 castling.

The procedure keeps the familiar final arrangement of the King and Rook while removing restrictions related to attacked squares.

## 1. Castling Destinations

FTW uses two castling directions.

| Type | King destination | Rook destination |
|---|---|---|
| G-side castling | g-file | f-file |
| C-side castling | c-file | d-file |

The original Rook on the higher-file side of the King is assigned to G-side castling.

The original Rook on the lower-file side of the King is assigned to C-side castling.

These destinations apply to both White and Black.

## 2. Eligibility

Castling is legal only when:

- The original King is still present on its original starting square.
- The selected original Rook is still present on its original starting square.
- Neither piece has previously moved.
- Neither piece has been captured.
- Both travel routes are clear under the route-clearance procedure.
- No third unit occupies any square in the union of the two routes.

A promoted Rook cannot be used for castling.

Castling rights are permanently lost when the original King or the corresponding original Rook moves or is captured.

## 3. Castling Procedure

Castling is one atomic move. It is not performed as two separate moves.

Follow these steps:

1. Identify the original King and the selected original Rook.
2. Identify their respective destination squares.
3. Determine the horizontal route from the King's starting square to its destination, including both endpoints.
4. Determine the horizontal route from the Rook's starting square to its destination, including both endpoints.
5. Temporarily remove both the King and the selected Rook from the board.
6. Examine every square in the union of both routes.
7. If any square in that union is occupied by a third unit, castling is illegal.
8. If all required squares are clear, place the King and Rook on their destinations simultaneously.

The two routes may overlap.

The starting square of either castling piece may be the destination square of the other. This does not prevent castling because both pieces are temporarily removed before route clearance is checked.

## 4. Special Chess960 Situations

The procedure supports the following cases:

- **Moving King and Rook:** Both pieces move to their respective destinations.
- **Stationary King:** The King is already on its destination square and remains there while the Rook moves.
- **Stationary Rook:** The Rook is already on its destination square and remains there while the King moves.
- **King-Rook exchange:** The King and Rook exchange their starting squares.

All four situations are valid when the eligibility and route-clearance requirements are satisfied.

Castling remains one move regardless of how many pieces physically change squares.

## 5. Attacked Squares

Attacked squares do not affect castling eligibility.

A player may castle even when:
- The King is standing on an attacked square.
- The King crosses an attacked square.
- The King arrives on an attacked square.

This follows from FTW's non-royal King design. There are no check-related restrictions.

## 6. Castling Rights

Each player starts with two castling rights: G-side and C-side.

Castling rights are permanently lost as follows:

- When the original King makes an ordinary move, both rights are lost.
- When the original King is captured, both rights are lost.
- When the original G-side Rook moves or is captured, the G-side right is lost.
- When the original C-side Rook moves or is captured, the C-side right is lost.
- When the King castles on either side, both castling rights are lost.

The final rule applies even when the King does not physically change squares during castling.

A lost right cannot be restored by returning a piece to its starting square.

A promoted Rook cannot acquire an original Rook's castling rights.
