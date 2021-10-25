//
//  QuizGameModel.swift
//  CardQuiz
//
//  Created by sun on 2021/10/25.
//

import Foundation

struct QuizGameModel {
    private(set) var questions: [Question]
    private(set) var choiceIsCorrect: Bool?
    
    private(set) var currentQuestionIndex = 0
    
    init(questions: [Question]) {
        self.questions = questions.shuffled()
    }
    
    mutating func choose(_ choice: String) {
        choiceIsCorrect = questions[currentQuestionIndex].answer == choice ? true : false
//        currentQuestionIndex += 1
    }
    
    mutating func nextQuestion() {
        currentQuestionIndex += 1
//        print(choiceIsCorrect)
        choiceIsCorrect = nil
//        print(choiceIsCorrect)
    }
    
    //
    struct Question {
        var answer: String
        var answerChoices: [String]
    }
}
