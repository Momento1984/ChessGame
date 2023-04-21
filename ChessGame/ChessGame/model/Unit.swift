//
//  Unit.swift
//  ChessGame
//
//  Created by Антипов В.Б. on 26.03.2023.
//

struct Coord {
    let x: Int8
    let y: Int8
}

enum ChessColor {
    case white
    case black
}

protocol Unit {
    var cost: Int8 { get }
    var sym: Character { get }
    var color: ChessColor { get }
    
    func posibleMoves(from: Coord) -> [Coord]
}

func createFromSym(sym: Character) -> Unit {
    switch sym {
    case "♙":
        return Pawn(sym: sym, color: .white)
    case "♟":
        return Pawn(sym: sym, color: .black)
    case "♖":
        return Rook(sym: sym, color: .white)
    case "♜":
        return Rook(sym: sym, color: .black)
    case "♘":
        return Knight(sym: sym, color: .white)
    case "♞":
        return Knight(sym: sym, color: .black)
    case "♗":
        return Bishop(sym: sym, color: .white)
    case "♝":
        return Bishop(sym: sym, color: .black)
    case "♕":
        return Queen(sym: sym, color: .white)
    case "♛":
        return Queen(sym: sym, color: .black)
    case "♔":
        return King(sym: sym, color: .white)
    case "♚":
        return King(sym: sym, color: .black)
    default:
        fatalError("incorrect symbol")
    }
}

