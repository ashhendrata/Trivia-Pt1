//
//  TriviaRound.swift
//  Trivia
//
//  Created by Ashley Hendrata on 3/12/24.
//

import Foundation

struct TriviaRound {
    let question: Question
    let options: [String]
    let answer: String
    let theme: String
}


enum Question {
    case firstMessageSentByMorseCode
    case texasStateFlower
    case taylorSwiftFirstChartingSong
    
    var description: String {
        switch self {
        case .firstMessageSentByMorseCode:
          return "What was the first message sent by morse code?"
        case .texasStateFlower:
          return "What is Texas’ state flower?"
        case .taylorSwiftFirstChartingSong:
          return "What was Taylor Swift's first song to chart on the Billboard Hot 100?"
        }
    }
    
    var answer: String {
        switch self {
        case .firstMessageSentByMorseCode:
          return "What hath God wrought?"
        case .texasStateFlower:
          return "The Bluebonnet"
        case .taylorSwiftFirstChartingSong:
          return "Tim McGraw"
        }
    }
    
    var options: [String] {
        switch self {
        case .firstMessageSentByMorseCode:
          return ["What hath God wrought?", "Hello World", "What is your name?", "How are you?"]
        case .texasStateFlower:
          return ["The Bluebonnet", "The Lily", "The Orchid", "The Yellow Rose"]
        case .taylorSwiftFirstChartingSong:
          return ["Tim McGraw", "You Belong To Me", "Red", "Unicorn"]
        }
    }
    
    var theme: String {
        switch self {
        case .firstMessageSentByMorseCode:
          return "History"
        case .texasStateFlower:
          return "Geography"
        case .taylorSwiftFirstChartingSong:
          return "Entertainment: Music"
        }
    }
}
