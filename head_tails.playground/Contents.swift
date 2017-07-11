//: Playground - noun: a place where people can play

import UIKit




func tossCoin(coin c: Int) -> String {
    if c % 2 != 0 {
        return "heads \(c)"
        
    } else {
    return "tails \(c)"
}
}


tossCoin(coin: Int(arc4random_uniform(32)))

var count = 0

func tossMultipleCoins(countToss: Int) -> Double {
    var count = 0
    let c = Int(arc4random_uniform(2))
    if c % 2 != 0{
        count += 1
        print(count)
    }
    return Double(countToss/count)
}

tossMultipleCoins(countToss: 11)

