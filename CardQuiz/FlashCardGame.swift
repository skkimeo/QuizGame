//
//  FlashCardGame.swift
//  FalshCardGame
//
//  Created by sun on 2021/10/25.
//

import Foundation

struct FlashCardGame {
    private(set) var cards: [Card]
    private(set) var choiceIsCorrect: Bool?
    
    private(set) var currentCardIndex = 0
    
    init(cards: [Card]) {
        self.cards = cards.shuffled()
    }
    
    mutating func choose(_ choice: String) {
        choiceIsCorrect = cards[currentCardIndex].answer == choice ? true : false
    }
    
    mutating func nextCard() {
        currentCardIndex += 1
        choiceIsCorrect = nil
    }
    
    struct Card {
        var answer: String
        var answerChoices: [String]
    }
}
