//
//  main.swift
//  Custom_Protocol_Design_Pattern
//
//  Created by Naoki on 1/11/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate : AdvancedLifeSupport? //Adopt the delegate
                                        //Must have the datatype AdvancedLifeSupport
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Paramedic doing CPR now!")
    }
}

let emilia = EmergencyCallHandler()
let peter = Paramedic(handler: emilia)

//emilia.assessSituation()
//emilia.medicalEmergency()

class doctor : AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self //Set self as the delegate
    }
    
    func performCPR() {
        print("doctor is performing CPR!")
    }
    
    func useStethescope() {
        print("dcotor is listening for heart beats")
    }
}

let myDoc = doctor(handler: emilia)
//myDoc.performCPR()
//myDoc.useStethescope()

class Surgeon: doctor {
    override func performCPR() {
        super.performCPR()
        print("Help doctor to perform CPR")
    }
    
    func helpDoc() {
        print("Surgeon is helping")
    }
}

let neo = Surgeon(handler: emilia)
//neo.performCPR()
//neo.helpDoc()

emilia.medicalEmergency()//Trigger Surgeon performCPR()
