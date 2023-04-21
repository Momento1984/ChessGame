//
//  ChessGameApp.swift
//  ChessGame
//
//  Created by Антипов В.Б. on 26.03.2023.
//

import SwiftUI

@main
struct ChessGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(game: GameViewModel())
        }
    }
}
