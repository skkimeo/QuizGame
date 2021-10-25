//
//  CardQuizViewModel.swift
//  CardQuiz
//
//  Created by sun on 2021/10/25.
//

import SwiftUI

class SymbolQuizViewModel: ObservableObject {
    
    static var sampleQuestions: [QuizGameModel.Question] {
        var quizzes = [QuizGameModel.Question]()
        let quizOne = QuizGameModel.Question(answer: "car", answerChoices: ["car", "boat", "plane"].shuffled())
        let quizTwo = QuizGameModel.Question(answer: "airplane", answerChoices: ["car", "subway", "plane"].shuffled())
        let quiz3 = QuizGameModel.Question(answer: "bus", answerChoices: ["bus", "tram", "UFO"])
        let quiz4 = QuizGameModel.Question(answer: "ferry", answerChoices: ["ferry", "airplane", "car"])
        let quiz5 = QuizGameModel.Question(answer: "tram", answerChoices: ["tram", "train", "boat"])
        quizzes.append(quizOne)
        quizzes.append(quizTwo)
        quizzes.append(quiz3)
        quizzes.append(quiz4)
        quizzes.append(quiz5)
        return quizzes
    }
    
    private static func createQuizGame() -> QuizGameModel {
        QuizGameModel(questions: sampleQuestions)
    }
    
    @Published private var model = createQuizGame()
    
    var questions: [QuizGameModel.Question] {
        model.questions
    }
    
    var currentQuestionIndex: Int {
        model.currentQuestionIndex
    }
    
    var choiceIsCorrect: Bool? {
        model.choiceIsCorrect
    }
    
    func choose(_ choice: String) {
        model.choose(choice)
    }
    
    func nextQuestion() {
        model.nextQuestion()
    }
}
