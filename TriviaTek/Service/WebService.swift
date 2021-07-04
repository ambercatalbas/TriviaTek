//
//  WebService.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 29.06.2021.
//

import Foundation

class Webservice {
  
  func downloadQuestions(url: URL, completion: @escaping (TriviaData?) -> ()) {
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let error = error {
        print(error.localizedDescription)
        completion(nil)
      } else if let data = data {
        
        let triviaData = try? JSONDecoder().decode(TriviaData.self, from: data)
        
        if let triviaData = triviaData {
          completion(triviaData)
          
          
        }
        
      }
      
    }.resume()
    
  }
}




