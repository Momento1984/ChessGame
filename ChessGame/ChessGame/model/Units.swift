//
//  Units.swift
//  ChessGame
//
//  Created by Антипов В.Б. on 26.03.2023.
//

final class Pawn: Unit {
    
    let cost: Int8 = 1
    
    let sym: Character
    
    let color: ChessColor
    
    func posibleMoves(from coord: Coord) -> [Coord] {
        var moves = [Coord]()
        switch color {
        case .black:
            moves += [Coord(x: coord.x, y: coord.y - 1)]
            moves += [Coord(x: coord.x - 1, y: coord.y - 1)]
            moves += [Coord(x: coord.x + 1, y: coord.y - 1)]

            if coord.y == 6 {
                moves += [Coord(x: coord.x, y: coord.y - 2)]
            }
        case .white:
            moves += [Coord(x: coord.x, y: coord.y + 1)]
            moves += [Coord(x: coord.x - 1, y: coord.y + 1)]
            moves += [Coord(x: coord.x + 1, y: coord.y + 1)]

            if coord.y == 1 {
                moves += [Coord(x: coord.x, y: coord.y + 2)]
            }
        }
        
        return moves.filterEdges()
    }
    
    init(sym: Character, color: ChessColor) {
        self.sym = sym
        self.color = color
    }
}

final class Knight: Unit {
    
    let cost: Int8 = 3
    
    let sym: Character
    
    let color: ChessColor
    
    func posibleMoves(from coord: Coord) -> [Coord] {
        let moves: [(Int8, Int8)] = [(-2, -1), (-2, 1),
                                     (-1, -2), (-1, 2),
                                     (1, -2),  (1, 2),
                                     (2, -1),  (2, 1)]
        
        return moves.map { Coord(x: coord.x + $0.0, y: coord.y + $0.1) }
                    .filterEdges()
    }
    
    init(sym: Character, color: ChessColor) {
        self.sym = sym
        self.color = color
    }
}

final class Bishop: Unit {
    
    let cost: Int8 = 3
    
    let sym: Character
    
    let color: ChessColor

    func posibleMoves(from coord: Coord) -> [Coord] {
        var moves = [Coord]()
        var inc: Int8 = 0
        for x in 1...coord.x {
            inc += 1
            moves += [Coord(x: coord.x - x, y: coord.y + inc )]
            moves += [Coord(x: coord.x - x, y: coord.y - inc)]
        }
        
        inc = 0
        for x in coord.x+1..<8 {
            inc += 1
            moves += [Coord(x: x, y: coord.y + inc )]
            moves += [Coord(x: x, y: coord.y - inc)]
        }
        
        return moves.filterEdges()
    }
    
    init(sym: Character, color: ChessColor) {
        self.sym = sym
        self.color = color
    }
}


final class Rook: Unit {
    
    let cost: Int8 = 5
    
    let sym: Character
    
    let color: ChessColor

    func posibleMoves(from coord: Coord) -> [Coord] {
        var moves = [Coord]()

        for y in 0..<Int8(8) {
            moves += [Coord(x: coord.x, y: y)]
        }
        for x in 0..<Int8(8) {
            moves += [Coord(x: x, y: coord.y)]
        }
        return moves
    }
    
    init(sym: Character, color: ChessColor) {
        self.sym = sym
        self.color = color
    }
}

final class Queen: Unit {
    
    let cost: Int8 = 9
    
    let sym: Character

    let color: ChessColor

    func posibleMoves(from coord: Coord) -> [Coord] {
        var moves = [Coord]()
        
        for y in 0..<Int8(8) {
            moves += [Coord(x: coord.x, y: y)]
        }
        for x in 0..<Int8(8) {
            moves += [Coord(x: x, y: coord.y)]
        }
        
        var inc: Int8 = 0
        for x in 1...coord.x {
            inc += 1
            moves += [Coord(x: coord.x - x, y: coord.y + inc )]
            moves += [Coord(x: coord.x - x, y: coord.y - inc)]
        }
        
        inc = 0
        for x in coord.x+1..<8 {
            inc += 1
            moves += [Coord(x: x, y: coord.y + inc )]
            moves += [Coord(x: x, y: coord.y - inc)]
        }
        
        return moves.filterEdges()
    }
    
    init(sym: Character, color: ChessColor) {
        self.sym = sym
        self.color = color
    }
}

final class King: Unit {
    
    let cost: Int8 = 100
    
    let sym: Character

    let color: ChessColor

    func posibleMoves(from coord: Coord) -> [Coord] {
        var moves = [Coord]()

        for y in -1...Int8(1) {
            for x in -1...Int8(1) {
                if !(x == 0 && y == 0) {
                    moves += [Coord(x: coord.x + x, y: coord.y + y)]
                }
            }
        }
        
        return moves.filterEdges()
    }
    
    init(sym: Character, color: ChessColor) {
        self.sym = sym
        self.color = color
    }
}

private extension Array where Element == Coord {
    func filterEdges() -> Self {
        return self.filter { $0.x >= 0 && $0.x < 8 && $0.y >= 0 && $0.y < 8}
    }
}
