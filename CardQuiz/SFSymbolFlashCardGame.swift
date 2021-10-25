//
//  SFSymbolFlashCardGame.swift
//  SFSymbolFlashCardGame
//
//  Created by sun on 2021/10/25.
//

import SwiftUI

class SFSymbolFlashCardGame: ObservableObject {
    
    static var vehicleCards: [FlashCardGame.Card] {
        var cards = [FlashCardGame.Card]()
        let answers = ["car", "airplane", "bus", "ferry", "bicycle", "tram", "cablecar"]
        let answerChoices = ["car", "airplane", "bus", "ferry", "bicycle", "tram", "cablecar", "UFO", "truck", "subway"]
        
        for answer in answers {
            var choices = [answer]
            while choices.count < 3 {
                if let choice = answerChoices.shuffled().first, !choices.contains(choice) {
                    choices.append(choice)
                }
            }
            cards.append(FlashCardGame.Card(answer: answer, answerChoices: choices.shuffled()))
        }
        
        return cards
    }
    
    private static func createSFSymbolFlashCardGame() -> FlashCardGame {
        FlashCardGame(cards: vehicleCards)
    }
    
    @Published private var model = createSFSymbolFlashCardGame()
    
    var cards: [FlashCardGame.Card] {
        model.cards
    }
    
    var currentCardIndex: Int {
        model.currentCardIndex
    }
    
    var choiceIsCorrect: Bool? {
        model.choiceIsCorrect
    }
    
    var finalCardIndex: Int {
        model.cards.count
    }
    
    // MARK: - Intention(s)

    func choose(_ choice: String) {
        model.choose(choice)
    }
    
    func nextCard() {
        model.nextCard()
    }
}
