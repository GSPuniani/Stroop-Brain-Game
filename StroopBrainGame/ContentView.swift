//
//  ContentView.swift
//  StroopBrainGame
//
//  Created by Gobind Puniani on 3/1/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var env: GameController
  
  var body: some View {
    
    // Wrapper
    ZStack {
      // Background Color field
      Color(hue: 0.62, saturation: 0.7, brightness: 0.9)
        .ignoresSafeArea()
      
      // Main Container
      VStack {
        // Top row
        scoreDisplay()
        
        Spacer() // -------
        
        // Center color labels
        ZStack {
          colorDisplay()
          resultsDisplay()
        }
        
        Spacer() // -------
        
        // Button/s at the bottom
        buttonBlock()
      }
    }
  }
  
  
  
  // ----------------------------------------
  // Display the top row with score, timer, and streak
  
  func scoreDisplay() -> AnyView {
    return AnyView(
      HStack {
        // Score
        Text("Score: \(env.score)")
          .frame(maxWidth: .infinity)
          .padding(5)
          .foregroundColor(.white)
        // Timer
        Text("\(env.seconds)")
          .frame(maxWidth: .infinity)
          .padding(5)
          .foregroundColor(.white)
        // Steak
        Text("Streak: \(env.streak)")
          .frame(maxWidth: .infinity)
          .padding(5)
          .foregroundColor(.white)
      }
    )
  }
  
  
  
  // --------------------------------------
  // Display Colors in center
  
  func colorDisplay() -> AnyView {
    // Display some text that says Start
    if env.gameState == .start {
      return AnyView(
        Text("Ready!")
          .font(.system(size: 66, weight: .bold, design: .default))
          .foregroundColor(Color(white: 0.78, opacity: 1.0))
      )
    }
    // Display the Color Labels
    return AnyView(VStack {
      // Top label colorA, color ColorA
      TextDisplay(str: env.topColor.toString(), color: Color(env.topColor.toUIColor()))
      // Bottom label colorB, color * colorC *
      TextDisplay(str: env.bottomText.toString(), color: Color(env.bottomColor.toUIColor()))
    })
  }
  
  
  
  // -------------------------------------------------
  // Display the results - shows check or x after an answer
  
  func resultsDisplay() -> AnyView {
    // if game is over show the results
    // Now I remember why I have .over state and wins !!!!
    if env.gameState == .over {
      return AnyView(
        // if wins true show check otherwise x
        Text(env.wins ? "✓" : "✖️")
          .font(.system(size: 30))
          .frame(width: 60, height: 60, alignment: .center)
          .background(env.wins ? Color.green : Color.red)
          .cornerRadius(50))
    }
    // If gamestate is not .over return an empty view
    return AnyView(EmptyView())
  }
  
  
  
  // ------------------------------------------------
  // Shows the buttons at the bottom
  
  func buttonBlock() -> AnyView {
    // If game state .ready show Yes and No
    if env.gameState == .playing {
      return AnyView(HStack(alignment: .bottom) {
        ButtonDisplay(str: "Yes")
        ButtonDisplay(str: "No")
      })
    } else if env.gameState == .start {
      // Otherwise show the Start button
        return AnyView(HStack(alignment: .bottom, spacing: UIScreen.screenHeight/2) {
        ButtonDisplay(str: "Start")
      })
    }
    
    return AnyView(EmptyView())
  }
  
  
  
  // ------------------------------------------------
  // Helper generates a button with a label and action
  
  func ButtonDisplay(str: String) -> AnyView {
    return AnyView(
      Button(action: {
        env.buttonTapped(label: str)
      }, label: {
        Text(str)
          .foregroundColor(.white)
          .font(.system(size: 24))
      })
      .frame(maxWidth: UIScreen.screenWidth / 2, maxHeight: UIScreen.screenWidth / 10)
      .padding(16)
      .background(Color.green)
      .cornerRadius(12)
    )
  }
  
  
  
  // ----------------------------------------------
  // Helper displays the color label
  
  func TextDisplay(str: String, color: Color = Color.black) -> AnyView {
    return AnyView(
      ZStack {
        Rectangle()
          .fill(Color(white: 0.9))
          .frame(width: UIScreen.screenWidth - 40, height: 70, alignment: .center)
          .cornerRadius(10)
        Text(str)
          .padding()
          .foregroundColor(color)
          .font(.system(size: 30, weight: .heavy, design: .default))
          
      }
    )
  }
}



// -------------------------------------------------------
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(GameController())
  }
}


// -------------------------------------------------------
// Helper to get the screen dimensions

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

