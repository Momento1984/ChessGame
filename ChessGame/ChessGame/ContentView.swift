//
//  ContentView.swift
//  ChessGame
//
//  Created by Антипов В.Б. on 26.03.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: GameViewModel
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            ForEach(0..<8) { i in
                GridRow() {
                    ForEach(0..<8) { j in
                        Text(game.boardText[7-i][j])
                            .font(.system(size: 30, design: .rounded))
                            .frame(width: 40, height: 40)
                            .border(.black, width: 0.5)
                            .foregroundColor(game.unitColor(i: 7-i, j: j))
                            .background(game.boardColor(i: 7-i, j: j))
                            .onTapGesture {
                                print("tapped \(game.boardText[7-i][j])")
                                game.select(x: Int8(j), y: 7-Int8(i))
                            }
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: GameViewModel())
    }
}
