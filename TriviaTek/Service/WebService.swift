//
//  WebService.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 29.06.2021.
//

import Foundation

class Webservice {
    
    func downloadQuestions(url: URL, completion: @escaping ([Questions]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                
                let questionList = try? JSONDecoder().decode([Questions].self, from: data)
                print(questionList ?? "failed")
                
                if let questionList = questionList {
                    completion(questionList)
                   
                }
                
            }
            
        }.resume()
        
    }
    

}

    
