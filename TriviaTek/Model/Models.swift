//
//  Models.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 29.06.2021.
//

import Foundation

struct Questions : Decodable {
    let questionNumber : String
    let question : String
    let optionA : String
    let optionB : String
    let optionC : String
    let optionD : String
    let correctOption : String
}

