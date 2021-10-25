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
//                    Spacer()
                    resultBody
//                    Spacer()
                    questionBody
//                    Spacer()
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
    
    var nextButton: some View {
        Button("Next Question") {
            game.nextQuestion()
        }
        .padding(.bottom)
    }
    
    var questionBody: some View {
        VStack {
            // typealias?
            let currentQuestion = game.questions[game.currentQuestionIndex]
            Spacer()
            // 문제 띄워주는 친구
            Image(systemName: currentQuestion.answer).scaleEffect(4)
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
        .padding(.horizontal)
    }
}





struct CardQuizGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardQuizGameView(game: SymbolQuizViewModel())
    }
}


