//: Playground - noun: a place where people can play

import UIKit


//let suits = ["Clubs", "Diamonds", "Hearts", "Spades"],
//cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
//
//var deckOfCards = [String: [Int]]()
//
//for i in suits {
//    deckOfCards[i] = []
//    for j in cards {
//        deckOfCards[i]!.append(j)
//    }
//}
//
//print(deckOfCards)

struct Card {
    let rank: Rank
    let suit: Suit


    enum Rank: Int{
    case two = 2
        case three, four, five, six, seven, eight, nine, ten
        case Jack, Queen, King, Ace
    }
    enum Suit: String{
        case heart
        case diamond
        case club
    }
}

