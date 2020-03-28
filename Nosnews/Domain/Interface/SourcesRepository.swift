//
//  SourcesRepository.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/03/20.
//  Copyright © 2020 Ayo Development. All rights reserved.
//

import Foundation

protocol SourcesRepository {
    func sources(country: String?, completion: @escaping (Result<SourcePage, Error>) -> Void) -> Cancellable?
}
