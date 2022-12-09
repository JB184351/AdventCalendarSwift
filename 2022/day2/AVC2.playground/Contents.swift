import Foundation
// Advent of Code 2022
// Day 2: Part 1

enum RockPaperScissors: Character {
    case A = "A" // Rock
    case B = "B" // Paper
    case C = "C" // Scissors
    case X = "X" // Rock
    case Y = "Y" // Paper
    case Z = "Z" // Scissors
}

func determineRoundPoints(userChoice: RockPaperScissors, opponentChoice: RockPaperScissors) -> Int {
    var userPoints = 0
    
    switch (opponentChoice, userChoice) {
    case let (opponent, user) where opponent == .A && user == .X:
        userPoints += 3
    case let (opponent, user) where opponent == .B && user == .Y:
        userPoints += 3
    case let (opponent, user) where opponent == .C && user == .Z:
        userPoints += 3
    case let (opponent, user) where opponent == .A && user == .Y:
        userPoints += 6
    case let (opponent, user) where opponent == .B && user == .Z:
        userPoints += 6
    case let (opponent, user) where opponent == .C && user == .X:
        userPoints += 6
    default:
        userPoints += 0
    }
    
    return userPoints
}

func additionalPoints(userChoice: RockPaperScissors) -> Int {
    var userPoints = 0
    
    switch RockPaperScissors(rawValue: userChoice.rawValue) {
    case .A, .X:
        userPoints += 1
    case .B, .Y:
        userPoints += 2
    case .C, .Z:
        userPoints += 3
    default:
        userPoints += 0
    }
    
    return userPoints
}

func playTheTourney(strategyGuide: String) -> Int {
    var total = 0

    let lines = strategyGuide.components(separatedBy: "\n").map { $0.replacingOccurrences(of: " ", with: "")}
    
    for line in lines {
        let opponenetChoiceString = line.first!
        let userChoiceString = line.last!

        let opponentChoice = RockPaperScissors(rawValue: opponenetChoiceString)!
        let userChoice = RockPaperScissors(rawValue: userChoiceString)!

        let firstScore = determineRoundPoints(userChoice: userChoice, opponentChoice: opponentChoice)
        let secondScore = additionalPoints(userChoice: userChoice)
        
        total += (firstScore + secondScore)
    }
    return total
}

let fileURL = Bundle.main.url(forResource: "avc2", withExtension: "txt")
var strategyGuide = String()

do {
    let data = try String(contentsOf: fileURL!, encoding: .utf8)
    strategyGuide = data
} catch {
    print("We have an issue here :/...")
}

print(playTheTourney(strategyGuide: strategyGuide))



