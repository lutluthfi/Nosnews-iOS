//
//  NewsViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 27/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    // MARK: - Dependency
    fileprivate let service = NewsDataService()
    
    // MARK: - Variable
    var news: News?
    var articles = [Article]()
    var message: String?
    
    // MARK: - Service Function
    func fetchHeadlines(from country: String, in category: String, key apiKey: String, completion: @escaping ((ViewModelState) -> Void)) {
        self.service.headlines(country: country, category: category, apiKey: apiKey) { (news, error) in
            if let error = error {
                self.message = error.localizedDescription
                completion(.failure)
                return
            }
            
            self.news = news
            self.articles = news?.articles ?? [Article]()
            
            completion(.success)
        }
    }
}
