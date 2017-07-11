//: Playground - noun: a place where people can play

import UIKit

var firstName: String

var lastName: String

var employeeNumber: Int


//etc.

var middleName: String?

var passportNumber: Int?

var phoneExtension: Int?

phoneExtension = 32

//if phoneExtension != nil{
  //  var unwrappedPhoneExtension = phoneExtension!  //force unwrapping
    //unwrappedPhoneExtension += 40
//}

if let unwrappedPhoneExtension = phoneExtension {
    print(unwrappedPhoneExtension)
}   else {
    
}

func createMessage() {
    let message = "Simplicity is the ultimate sophisication"
    print(message)
}

createMessage()

func createMessage2(someNumber: Int) -> String {
    print("this is messdf \(someNumber)")
    let message = "this is message2 "
    print("message")
    return message
}

let result = createMessage2(someNumber:21)

result