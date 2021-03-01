//
//  StroopBrainGameApp.swift
//  StroopBrainGame
//
//  Created by Gobind Puniani on 3/1/21.
//

import SwiftUI

@main
struct StroopBrainGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GameController())
        }
    }
}
