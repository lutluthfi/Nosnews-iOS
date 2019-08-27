//
//  NewsViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    fileprivate let service = NewsDataService()
    
    var news: News?
    var message: String?
    
    func fetchHeadlines(from country: String, with category: String, key apiKey: String, completion: @escaping ((ViewModelState) -> Void)) {
        self.service.headlines(country: country, category: category, apiKey: apiKey) { (news, error) in
            if let error = error {
                self.message = error.localizedDescription
                completion(.failure)
                return
            }
            self.news = news
            completion(.success)
        }
    }
    
}
