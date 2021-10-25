//
//  CardQuizGameView.swift
//  CardQuiz
//
//  Created by sun on 2021/10/25.
//

import SwiftUI

struct CardQuizGameView: View {
    @ObservedObject var game: SymbolQuizViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // 아직 퀴즈가 남아있는 경우
                if game.currentQuestionIndex < game.questions.count {
                    Spacer()
                    if let correct = game.choiceIsCorrect {
                        if correct {
                            Text("Correct!").font(.largeTitle).foregroundColor(.green)
                        } else {
                            Text("Wrong!").font(.largeTitle).foregroundColor(.red)
                        }
                    }
                    questionBody
                    nextButton
                } else {
                    Text("game over").font(.largeTitle).foregroundColor(.green)
                }
                
                
                
            }
            .navigationBarTitle("Theme Game!")
        }
    }
    
    var nextButton: some View {
        Button("Next Question") {
            game.nextQuestion()
        }
    }
    
    var questionBody: some View {
        VStack {
            // typealias?
            let currentQuestion = game.questions[game.currentQuestionIndex]
            Spacer()
            Image(systemName: currentQuestion.answer).scaleEffect(5)
            Spacer()
            HStack {
                Spacer()
                Button(currentQuestion.answerChoices[0]) {
                    game.choose(currentQuestion.answerChoices[0])
                }
                Spacer()
                Button(currentQuestion.answerChoices[1]) {
                    game.choose(currentQuestion.answerChoices[1])
                }
                Spacer()
                Button(currentQuestion.answerChoices[2]) {
                    game.choose(currentQuestion.answerChoices[2])
                }
                Spacer()
            }
            Spacer()
        }
        
    }
}





struct CardQuizGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardQuizGameView(game: SymbolQuizViewModel())
    }
}


