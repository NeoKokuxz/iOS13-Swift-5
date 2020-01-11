//
//  main.swift
//  Protocols_Practice
//
//  Created by Naoki on 1/11/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

/*
 Inheritance works below
 */

//All subclass of bird can access all the methods from bird
class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("Laying eggs")
        }
    }
    
    func fly() {
        print("flying in the sky")
    }
}

class Eagle : Bird {
    
    func soar() {
        print("Eagle is soaring using air currents")
    }
}

class Penguin : Bird {
    func swim() {
        print("Penguin is swiming")
    }
}

struct FlyingMuseum {
    func flyingDemo (flyingObject:Bird){
        flyingObject.fly()
    }
}

//Both Eagle and Penguin got access to fly method because they both inherite from bird
let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()

let myPenguin = Penguin()
myPenguin.fly()
myPenguin.layEgg()
myPenguin.swim()

let myMuseum = FlyingMuseum()
//myEagle is subclass of bird, so we can pass it into flyingObject which requires bird Type.
myMuseum.flyingDemo(flyingObject: myEagle)//Makes sense that egale can fly
myMuseum.flyingDemo(flyingObject: myPenguin)//However that penguin can't fly, but it inherited from bird class.

/*
 In this case that inheritance is not a good way to solve problem.
 Protocol are better choice at this situation.
 */

class NewBird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("Laying eggs")
        }
    }
//    Removed Fly function for all birds
//    func fly() {
//        print("flying in the sky")
//    }
}

protocol CanFly {
    func fly()
}

class NewEagle : NewBird, CanFly {
    //the fly method from CanFly protocol
    func fly() {
        print("Eagles can fly!")
    }
    
    func soar() {
        print("Eagle is soaring using air currents")
    }
}

class newPenguin : NewBird {
    //This new penguin can't fly because it got no CanFly protocol
    
    func swim() {
        print("Penguin is swiming")
    }
}

//
let myNewEagle = NewEagle()
let myNewPenguin = newPenguin()

myNewEagle.fly() //Only Eagle got access to fly ability
myNewPenguin.swim()

struct NewFlyingMuseum {
    func flyingDemo(flyingObject:CanFly){
        flyingObject.fly()
    }
}

let myNewMuseum = NewFlyingMuseum()
myNewMuseum.flyingDemo(flyingObject: myNewEagle) //myNewEagle adopts the protocol CanFly


