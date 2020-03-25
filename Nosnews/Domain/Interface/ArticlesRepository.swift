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
    func topHeadlineArticles(category: String?, country: String, sources: String?, query: String?, completion: @escaping (Result<ArticlePage, Error>) -> Void) -> Cancellable?
}
