//
//  GameController.swift
//  StroopBrainGame
//
//  Created by Gobind Puniani on 3/1/21.
//

import Foundation


// Game Controller
class GameController: ObservableObject {
  // These variables are shared with the view
  @Published var topColor: GameColor = .Blue    // Color of the top text and text label
  @Published var bottomText: GameColor = .Green   // Text label on the bottom label
  @Published var bottomColor: GameColor = .Red     // Color of the bottom label
  @Published var seconds: String = "60"     // Format the time as a string in the display
  @Published var score: Int = 0              // score
  @Published var streak: Int = 0               // Streak count
  @Published var wins: Bool = false            // Determine whether to show check mark or x
  @Published var gameState: GameState = .start // Keeps track of the game state, needs work
  @Published var showResults: Bool = false
  
  var sec: Int = 0 // Keep track of time
  
  var timer: Timer? // Use instance of Timer for timer
  
  init() {
    
  }
  
  // Handles taps on buttons
  // Use the button label to decide what to do
  func buttonTapped(label: String) {
    switch gameState {
    // Start Button
    case .start: // Start button
      startGame()
      
    // Ready - Thinking about using this for a countdown before starting
    // For now we'll check your answer
    case .ready:
      checkAnswer(answer: label)
      return
    
    // Playing - the timer should be running here
    case .playing:
      checkAnswer(answer: label)
      
      chooseColors()
    
    // Game Over - show the start screen again with the score and streak reset
    case .over:
      score = 0
      streak = 0
      gameState = .start
    }
  }
  
  
  // Call this to start a game - A game in this case is one match
  func startGame() {
    chooseColors()
    gameState = .playing
    startTimer()
  }
  
  
  func gameOver() {
    gameState = .start
    stopTimer()
  }
  
  
  // Check your answer - Pass it the label. Button labels should probably be an enum
  func checkAnswer(answer: String) {
    // If topColor and bottomColor match your answer should be Yes!
    // If they don't your answer should be no
    if (topColor == bottomColor && answer == "Yes") || (topColor != bottomColor && answer == "No") {
      // Got it right
      wins = true   // Display check mark
      score += 10  // Add some points
      streak += 1   // Up the streak
    } else {
      // Got it wrong
      wins = false // Display X mark
      score -= 10  // lose some points
      streak = 0    // reset that streak
    }
    showResults = true
    removeResults()
// after checking answer:
//    show results
//    start remove results timer
//    invalidate previous remove results timer
    
  }
  var showResultsTimer = Timer()
  
  func removeResults() {
    showResultsTimer.invalidate()
    showResultsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
      self.showResults = false
    })
  }
  
  // Set the color variables to star a game
  func chooseColors() {
    // Choose three colors at random
    topColor = randomColor()
    bottomText = randomColor()
    bottomColor = randomColor()
    // The frequency of colors that match will 1 in 10. We might want this to me more like 1 / 2?
  }
  
  // Returns a random GameColor
  func randomColor() -> GameColor {
    // An array of all GameColors
    let colors: [GameColor] = [.Red, .Yellow, .Orange, .Green, .Blue, .Purple, .Black, .Gray, .Brown, .Pink]
    // Return a color from the array
    return colors[Int.random(in: 0..<colors.count)]
  }
  
  // Starts a timer
  func startTimer() {
    // This starts a timer updating in 1 sec
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
      self.updateTimer()
    })
    sec = 60 // reset the sec count
  }
  
  
  // Clears the time
  func stopTimer() {
    timer?.invalidate()
  }

  // Handles updates to the timer
  func updateTimer() {
    sec -= 1 // Subtract a sec and format the time
    if sec == 0 {
        gameOver()
    }
    formatTime()
  }
  
  // Format the time to display in the UI
  func formatTime() {
    seconds = "\(sec)"
  }
}

