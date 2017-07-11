//: Playground - noun: a place where people can play

import UIKit

var arr255 = [Int]()

arr255.append(contentsOf: 1...255)

print(arr255)


    var ran1 = Int(arc4random_uniform(255))
    
    var ran2 = Int(arc4random_uniform(255))

    var temp = (arr255[ran1])

    var rando = (arr255[ran2])

    var rando2 = temp

print(ran1, ran2)

for i in 1...100{
    var ran1 = Int(arc4random_uniform(255))
    
    var ran2 = Int(arc4random_uniform(255))
    print(ran1)
}

var count = 1
for i in arr255{
    while i < 43{
        count += 1
        break
    }
   }

print(count)

arr255.remove(at: count)

print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(count)")
