//
//  GamesView.swift
//  PickleStats
//
//  Created by Parker Rushton on 4/27/21.
//

import SwiftUI
import SFSafeSymbols

struct GamesView: View {
    
    // MARK: - Core Data
    
    @FetchRequest(entity: Game.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Game.createdAt, ascending: false)]) var games: FetchedResults<Game>
    
    
    // MARK: - State
    
    @State private var isShowingGameEdit = false
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List(games) { game in
                GameCell(game)
            }
            .navigationBarItems(trailing:
                                    Button(action: presentGameEditView, label: {
                                        Image(systemSymbol: .plus)
                                    })
            )
            .sheet(isPresented: $isShowingGameEdit, content: {
                GameEditView(game: nil)
            })
        }
    }
    
}


// MARK: - Private
private extension GamesView {
    
    func presentGameEditView() {
        self.isShowingGameEdit = true
    }
    
}


struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
