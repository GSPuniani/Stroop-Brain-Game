//
//  GameColor.swift
//  StroopBrainGame
//
//  Created by Gobind Puniani on 3/1/21.
//

import Foundation
import UIKit

// Game Colors - We need both a color and a string for each
enum GameColor {
  // These are the colors
  case Red, Yellow, Orange, Green, Blue, Purple, Black, Gray, Brown, Pink
  
  // This method returns the color
  // Might have been good to use the built in UI colors
  func toUIColor() -> UIColor {
    switch self {
    case .Red:
        return UIColor(red: 255 / 255, green: 14 / 255, blue: 2 / 255, alpha: 1)
    case .Orange:
      return UIColor(red: 248 / 255, green: 148 / 255, blue: 29 / 255, alpha: 1)
    case .Yellow:
      return UIColor(red: 231 / 255, green: 217 / 255, blue: 54 / 255, alpha: 1)
    case .Green:
      return UIColor(red: 57 / 255, green: 181 / 255, blue: 74 / 255, alpha: 1)
    case .Blue:
      return UIColor(red: 0 / 255, green: 114 / 255, blue: 188 / 255, alpha: 1)
    case .Purple:
      return UIColor(red: 146 / 255, green: 39 / 255, blue: 143 / 255, alpha: 1)
    case .Black:
      return UIColor(red: 10 / 255, green: 10 / 255, blue: 10 / 255, alpha: 1)
    case .Gray:
      return UIColor(red: 220 / 255, green: 220 / 255, blue: 220 / 255, alpha: 1)
    case .Brown:
      return UIColor(red: 150 / 255, green: 75 / 255, blue: 0 / 255, alpha: 1)
    case .Pink:
      return UIColor(red: 255 / 255, green: 192 / 255, blue: 203 / 255, alpha: 1)
    }
  }
  
  // Returns the string color name for the color
  func toString() -> String {
    switch self {
    case .Red:
      return "Red"
    case .Yellow:
      return "Yellow"
    case .Orange:
      return "Orange"
    case .Green:
      return "Green"
    case .Blue:
      return "Blue"
    case .Purple:
      return "Purple"
    case .Black:
      return "Black"
    case .Gray:
      return "Gray"
    case .Brown:
      return "Brown"
    case .Pink:
      return "Pink"
    }
  }
}
