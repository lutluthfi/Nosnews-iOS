//
//  NewsAPIEndpoint.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct NewsAPIEndpoint {
    static func sources(with requestDTO: SourceRequestDTO) -> Endpoint<SourcePageResponseDTO> {
        return .init(path: "sources", method: .get, queryParametersEncodable: requestDTO)
    }
    
    static func topHeadlineArticles(with requestDTO: ArticleRequestDTO) -> Endpoint<ArticlePageResponseDTO> {
        return .init(path: "top-headlines", method: .get, queryParametersEncodable: requestDTO)
    }
}
