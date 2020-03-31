//
//  NewsAPIEndpoint.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

struct NewsAPIEndpoint {
    static func everythingArticles(with requestDTO: Everything.RequestDTO) -> Endpoint<Everything.ArticlePageResponseDTO> {
        return .init(path: "everything", method: .get, queryParametersEncodable: requestDTO)
    }
    
    static func sources(with requestDTO: Sources.RequestDTO) -> Endpoint<Sources.SourcePageResponseDTO> {
        return .init(path: "sources", method: .get, queryParametersEncodable: requestDTO)
    }
    
    static func topHeadlineArticles(with requestDTO: TopHeadline.RequestDTO) -> Endpoint<TopHeadline.ArticlePageResponseDTO> {
        return .init(path: "top-headlines", method: .get, queryParametersEncodable: requestDTO)
    }
}
