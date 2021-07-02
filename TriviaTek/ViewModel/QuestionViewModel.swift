//
//  QuestionViewModel.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 30.06.2021.
//

import Foundation


struct QuestionListViewModel {
    let questionlist: [Questions]
    
    func countQuestions() -> Int {
        return self.questionlist.count
        
    }
     
     func questionAtIndex(_ index: Int) -> QuestionViewModel {
         let question = self.questionlist[index]
         return QuestionViewModel(question)
     }
}




struct QuestionViewModel {
    let question: Questions
    
    init(_ question: Questions) {
        self.question = question
    }
    var questionNumber: String {
        return self.question.questionNumber
    }
    var questionDescription: String {
        return self.question.question
    }
    
    var optionA: String {
        return self.question.optionA
    }
    var optionB: String {
        return self.question.optionB
    }
    var optionC: String {
        return self.question.optionC
    }
    var optionD: String {
        return self.question.optionD
    }
    var correctOption: String {
        return self.question.correctOption
    }
    
}




