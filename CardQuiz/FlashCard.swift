//
//  FlashCardApp.swift
//  FlashCard
//
//  Created by sun on 2021/10/25.
//

import SwiftUI

@main
struct FlashCard: App {
    let game = SFSymbolFlashCardGame()
    var body: some Scene {
        WindowGroup {
            SFSymbolFlashCardGameView(game: game)
        }
    }
}
