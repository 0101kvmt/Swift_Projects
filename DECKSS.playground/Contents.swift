//: Playground - noun: a place where people can play

import UIKit

struct Card {
    var value: String
    var suit: String
    var num: Int
    func show(){
        print(value, "of", suit, ": value", num)
    }
}

class Deck {
    var cards = [Card]()
    func reset(){
        let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suits = ["Clubs", "Spades", "Diamonds", "Hearts"]
        self.cards = []
        for suit in suits {
            for i in 0...12 {
                let newcard = Card(value: values[i], suit: suit, num: i+1)
                self.cards.append(newcard)
            }
        }
        
    }


    //if card indeck remove 1, else it is a nil
    func deal() -> Card? {
        if self.cards.count > 0 {
            let dealCard = self.cards.remove(at: 0)
            return dealCard
        }
        return nil
    }
    func shuffle(){
        for i in stride(from: self.cards.count-1, to: 0, by: -1){
            let swapCardIndex = Int(arc4random_uniform(UInt32(i)))
            let temp = self.cards[i]
            self.cards[i] = self.cards[swapCardIndex]
            self.cards[swapCardIndex] = temp
        }
    }
    
}
class Player{
    var name: String
    var hand: [Card]
    init(name: String){
        self.name = name
        self.hand = [Card]()
        
    }
    func draw(deck:Deck) -> Card? {
        if let dealtcard = deck.deal(){
            self.hand.append(dealtcard)
            return dealtcard
        }
        return nil
    }
    func discard(suit: String, value: String) -> Bool {
        for i in 0...self.hand.count-1 {
            if(self.hand[i].suit == suit && self.hand[i].value == value){
                self.hand.remove(at: i)
                return true
            }
        }
        return false
    }
    
}

var newDeck = Deck()
newDeck.shuffle()

