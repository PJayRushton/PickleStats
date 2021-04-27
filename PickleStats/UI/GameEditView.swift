//
//  GameEditView.swift
//  PickleStats
//
//  Created by Parker Rushton on 4/27/21.
//

import SwiftUI

struct GameEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var game: Game?
    
    @State private var gameTitleText = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Mixed Semi Final US Open", text: $gameTitleText)
                
                Spacer()
                
                Button(action: saveGame) {
                    Text("Save")
                        .padding(.horizontal)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            .navigationTitle(game == nil ? "New Game" : game!.title ?? "Edit Game")
        }
        .onAppear {
            guard let game = game else { return }
            fillInExistingGameFields(game)
        }
    }
    
}


// MARK: - Private

private extension GameEditView {
    
    func fillInExistingGameFields(_ game: Game) {
        gameTitleText = game.title ?? ""
    }
    
    func saveGame() {
        GameCoreDataManager.shared.saveGame(title: gameTitleText)
        presentationMode.wrappedValue.dismiss()
    }
    
}


struct GameEditView_Previews: PreviewProvider {
    static var previews: some View {
        GameEditView()
    }
}
