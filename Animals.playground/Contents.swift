//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Animal {
    var name: String
    var health: Int
    
    init(name: String, health: Int?){
        self.name = name
        self.health = health != nil ? health! : 100
    }
    
    func displayHealth() -> Int {
        return self.health
    }
    
}

class Cat: Animal {
    
    override init(name: String, health: Int?){
        super.init(name: name, health: health != nil ? health! : 150)
    }
    func growl(){
        print("RWR!")
    }
    func run(){
        print("Runnning!!!!")
        self.health - 10
        print(self.health)
    }
}

class Lion: Cat {
     init(name: String){
        super.init(name: name, health: 200)
    }
    override func growl() {
        print("ROAR!!! I IS KING JUNGLE")
    }
}

class Cheetah: Cat {
    init(name: String){
        super.init(name:name, health: 200)
    }
    override func run() {
        print("Running fast!")
        self.health - 50
        print(self.health)
        // ??
    }
    func sleep() {
        self.health + 50
        if self.health > 200 {
            self.health = 200
        }
    }
}

var jason = Cheetah(name: "Jason")
for i in 0...3 {
    jason.run()
}

var lion = Lion(name: "Lion")
for i in 0...2 {
    lion.run()
    lion.growl()
}

