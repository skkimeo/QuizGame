//
//  SFSymbolFlashCardGameView.swift
//  SFSymbolFlashCardGameView
//
//  Created by sun on 2021/10/25.
//

import SwiftUI

struct SFSymbolFlashCardGameView: View {
    @ObservedObject var game: SFSymbolFlashCardGame
    
    var body: some View {
        NavigationView {
            VStack {
                // 아직 퀴즈가 남아있는 경우
                if game.currentCardIndex < game.cards.count {
                    resultBody
                    cardBody
                    nextButton
                    Spacer()
                } else {
                    Text("game over").foregroundColor(.green)
                }
            }
            .font(.largeTitle)
            .padding(.vertical)
            .navigationBarTitle("Vehicle Game!")
        }
    }
    
    @ViewBuilder var resultBody: some View {
        if let correct = game.choiceIsCorrect {
            if correct {
                Text("Correct!").foregroundColor(.green)
            } else {
                Text("Wrong!").foregroundColor(.red)
            }
        } else {
            Text("What's This?").foregroundColor(.black).bold()
        }
    }
    
    var cardBody: some View {
        VStack {
            // typealias?
            let currentCard = game.cards[game.currentCardIndex]
            Spacer()
            // 문제 띄워주는 친구
            Image(systemName: currentCard.answer).scaleEffect(4)
            Spacer()
            HStack {
                Spacer()
                ForEach(0..<3) { index in
                    Button(currentCard.answerChoices[index]) {
                        game.choose(currentCard.answerChoices[index])
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    var nextButton: some View {
        Button("Next") {
            game.nextCard()
        }
        .padding(.bottom)
    }
}

















struct CardQuizGameView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolFlashCardGameView(game: SFSymbolFlashCardGame())
    }
}


