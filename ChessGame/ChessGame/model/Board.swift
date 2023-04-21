//
//  Board.swift
//  ChessGame
//
//  Created by Антипов В.Б. on 26.03.2023.
//

final class Board {
    var units: [[Unit?]]
    
    init() {
        let row0 = "♖♘♗♕♔♗♘♖"
        let row1 = "♙♙♙♙♙♙♙♙"

        let row6 = "♟♟♟♟♟♟♟♟"
        let row7 = "♜♞♝♛♚♝♞♜"
        let row = [Unit?].init(repeating: nil, count: 8)
        units = [[Unit?]].init(repeating: row, count: 8)

        units[0] = row0.map { createFromSym(sym: $0)}
        units[1] = row1.map { createFromSym(sym: $0)}
        
        units[6] = row6.map { createFromSym(sym: $0)}
        units[7] = row7.map { createFromSym(sym: $0)}
        
        printBoard()

        //print(units[0][1]?.posibleMoves(from: Coord(x: 1, y: 0)))
        //print(units[0][2]?.posibleMoves(from: Coord(x: 2, y: 0)))
        //print(units[0][0]?.posibleMoves(from: Coord(x: 0, y: 0)))
        print(units[0][4]?.posibleMoves(from: Coord(x: 4, y: 0)))

    }
    
    func printBoard() {
        units.reversed().forEach { row in
            let text = String(row.map { $0?.sym ?? Character(".") })//.joined()
            print(text)
        }
    }
}
