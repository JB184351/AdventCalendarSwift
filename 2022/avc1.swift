import Foundation

//MARK: - Advent of Code Part 1
let fileURL = Bundle.main.url(forResource: "avc1", withExtension: "txt")
let data = try String(contentsOf: fileURL!, encoding: .utf8)

let arrays = data.components(separatedBy: "\n\n").map { $0.components(separatedBy: "\n") }

var intArray = [Int]()
var intArrays = [[Int]]()
var greatest = 0
for array in arrays {
    for arr in array {
        if let arr = Int(arr) {
            intArray.append(Int(exactly: arr)!)
        }
    }
    
    intArrays.append(intArray)
    intArray.removeAll()
}

var summedArray = [Int]()

for array in intArrays {
    var sum = 0
    
    for arr in array {
        sum += arr
        summedArray.append(sum)
    }
}

summedArray = summedArray.sorted(by: { $0 > $1 })
greatest = summedArray.first!
print(greatest)

//MARK: - Part 2
let total = summedArray.prefix(3).reduce(0) { $0 + $1 }
print(total)