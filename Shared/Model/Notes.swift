//
//  Notes.swift
//  UI-322 (iOS)
//
//  Created by nyannyan0328 on 2021/10/07.
//

import SwiftUI

struct Notes: Identifiable {
    var id = UUID().uuidString
    var note : String
    var date : Date
    var cardColor : Color
    
}

func getSampleDate(offset : Int)->Date{
    
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var notes : [Notes] = [


Notes(note: "Jacob Degrom avrage 99", date: getSampleDate(offset: 1), cardColor: Color("Skin")),

Notes(note: "Mariano regend cutter", date: getSampleDate(offset: -10), cardColor: Color("Purple")),

Notes(note: "Manami Miyaji brith", date: getSampleDate(offset: 10), cardColor: Color("Green")),

Notes(note: "The cuban Missile", date: getSampleDate(offset: -30), cardColor: Color("Blue")),

Notes(note: "Kavosft is Swift UI Master", date: getSampleDate(offset: -3), cardColor: Color("Orange")),
    
    
]


