import Foundation

// Avent of Code 2022
// Day 2 Part 2
enum RockPaperScissors: Character {
    case A = "A" // Rock
    case B = "B" // Paper
    case C = "C" // Scissors
    case X = "X" // Rock
    case Y = "Y" // Paper
    case Z = "Z" // Scissors
}


func determineShapeAndRoundPoints(opponentChoice: RockPaperScissors, roundResult: RockPaperScissors) -> (Int, RockPaperScissors) {
    var userPoints = 0
    var userChoice = RockPaperScissors.A
    
    switch (opponentChoice, roundResult) {
    case let (opponent, roundResult) where opponent == .A && roundResult == .X:
        userChoice = RockPaperScissors(rawValue: "C")!
        userPoints += 0
    case let (opponent, roundResult) where opponent == .B && roundResult == .X:
        userChoice = RockPaperScissors(rawValue: "A")!
        userPoints += 0
    case let (opponent, roundResult) where opponent == .C && roundResult == .X:
        userChoice = RockPaperScissors(rawValue: "B")!
        userPoints += 0
    case let (opponent, roundResult) where opponent == .A && roundResult == .Y:
        userChoice = RockPaperScissors(rawValue: "A")!
        userPoints += 3
    case let (opponent, roundResult) where opponent == .B && roundResult == .Y:
        userChoice = RockPaperScissors(rawValue: "B")!
        userPoints += 3
    case let (opponent, roundResult) where opponent == .C && roundResult == .Y:
        userChoice = RockPaperScissors(rawValue: "C")!
        userPoints += 3
    case let (opponent, roundResult) where opponent == .A && roundResult == .Z:
        userChoice = RockPaperScissors(rawValue: "B")!
        userPoints += 6
    case let (opponent, roundResult) where opponent == .B && roundResult == .Z:
        userChoice = RockPaperScissors(rawValue: "C")!
        userPoints += 6
    case let (opponent, roundResult) where opponent == .C && roundResult == .Z:
        userChoice = RockPaperScissors(rawValue: "A")!
        userPoints += 6
    default:
        userPoints += 0
    }
    
    return (userPoints, userChoice)
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
        let roundResultString = line.last!

        let opponentChoice = RockPaperScissors(rawValue: opponenetChoiceString)!
        let roundResult = RockPaperScissors(rawValue: roundResultString)!

        let roundResults = determineShapeAndRoundPoints(opponentChoice: opponentChoice, roundResult: roundResult)
        
        let firstScore = roundResults.0
        let secondScore = additionalPoints(userChoice: roundResults.1)
        
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

