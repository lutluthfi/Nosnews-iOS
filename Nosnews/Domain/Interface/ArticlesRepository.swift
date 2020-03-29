//
//  ArticlesRepository.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

protocol ArticlesRepository {
    @discardableResult
    func everythingArticles(domains: String?, fromDateString: String?, language: String, sortBy: String?, source: String?, toDateString: String?, page: String, pageSize: String, query: String, completion: @escaping (Result<ArticlePage, Error>) -> Void) -> Cancellable?
    
    @discardableResult
    func topHeadlineArticles(category: String?, country: String, sources: String?, query: String?, page: String, pageSize: String, completion: @escaping (Result<ArticlePage, Error>) -> Void) -> Cancellable?
}
