//
//  GameCell.swift
//  PickleStats
//
//  Created by Parker Rushton on 4/27/21.
//

import SwiftUI

struct GameCell: View {
    
    @ObservedObject var game: Game
    
    init(_ game: Game) {
        self.game = game
    }
    
    var body: some View {
        HStack {
            Text(game.title ?? "")
            
            if !game.isCompleted {
                Text("In Progress")
                    .foregroundColor(.yellow)
            }
        }
        .background(game.isCompleted ? Color.blue.opacity(0.1) : Color(.systemBackground))
    }
    
}


struct GameCell_Previews: PreviewProvider {
    
    static var previews: some View {
        Text("Previews")
    }
    
}
