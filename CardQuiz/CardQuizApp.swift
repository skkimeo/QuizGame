//
//  CardQuizApp.swift
//  CardQuiz
//
//  Created by sun on 2021/10/25.
//

import SwiftUI

@main
struct CardQuizApp: App {
    let game = SymbolQuizViewModel()
    var body: some Scene {
        WindowGroup {
            CardQuizGameView(game: game)
        }
    }
}
