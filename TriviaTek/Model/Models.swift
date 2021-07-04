//
//  Models.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 29.06.2021.
//

import Foundation

struct TriviaData: Codable {
 let questions : [Questions]
  let wildCards: Int
  
}

struct Questions : Codable {
    let questionNumber : String
    let question : String
    let optionA : String
    let optionB : String
    let optionC : String
    let optionD : String
    let correctOption : String
}

//struct WildCards {
//  let wildCard: Int
//}
