//
//  GameViewModel.swift
//  ChessGame
//
//  Created by Антипов В.Б. on 26.03.2023.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published private var board: Board = Board()
    
    @Published var selectedCoord: Coord? {
        didSet {
            setHightlightedCells()
        }
    }
    
    var boardText: [[String]] {
        return board.units.map { row in
            row.map { $0?.sym ?? Character(" ")}.map { String($0) }
        }
    }
    
    private var hightlightedCells = [Coord]()

    
    func boardColor(i: Int, j: Int) -> Color {
        if hightlightedCells.contains(where: { $0.x == j && $0.y == i }) {
            return .blue
        }
        return (i + j) % 2 == 0 ? .brown : .gray
    }
    
    func unitColor(i: Int, j: Int) -> Color {
        board.units[i][j]?.color.viewColor ?? .black
    }
    
    func select(x: Int8, y: Int8) {
        selectedCoord = Coord(x: x, y: y)
    }
    
    private func setHightlightedCells() {
        guard let coord = selectedCoord else {
            hightlightedCells = []
            return
        }
        
        if let unit = board.units[Int(coord.y)][Int(coord.x)] {
            hightlightedCells = unit.posibleMoves(from: coord) + [coord]
        } else {
            hightlightedCells = [coord]
        }
    }
}

extension ChessColor {
    var viewColor: Color {
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        }
    }
}

