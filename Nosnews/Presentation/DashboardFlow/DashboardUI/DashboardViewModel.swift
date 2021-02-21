//
//  DashboardViewModel.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 21/02/21.
//  Copyright (c) 2021 All rights reserved.
//
//  Template:
//  Modified by Arif Luthfiansyah
//  Created by Oleh Kudinov

import Foundation

// MARK: DashboardViewModelResponse
enum DashboardViewModelResponse {
}

// MARK: DashboardViewModelDelegate
protocol DashboardViewModelDelegate: class {
}

// MARK: DashboardViewModelRequestValue
struct DashboardViewModelRequestValue {
}

// MARK: DashboardViewModelRoute
struct DashboardViewModelRoute {
}

// MARK: DashboardViewModelInput
protocol DashboardViewModelInput {

    func viewDidLoad()

}

// MARK: DashboardViewModelOutput
protocol DashboardViewModelOutput {

    var response: Observable<DashboardViewModelResponse?> { get }

}

// MARK: DashboardViewModel
protocol DashboardViewModel: DashboardViewModelInput, DashboardViewModelOutput { }

// MARK: DefaultDashboardViewModel
final class DefaultDashboardViewModel: DashboardViewModel {

    // MARK: DI Variable
    weak var delegate: DashboardViewModelDelegate?
    let requestValue: DashboardViewModelRequestValue
    let route: DashboardViewModelRoute

    // MARK: UseCase Variable



    // MARK: Common Variable

    

    // MARK: Output ViewModel
    let response = Observable<DashboardViewModelResponse?>(nil)
    

    // MARK: Init Function
    init(
        requestValue: DashboardViewModelRequestValue,
        route: DashboardViewModelRoute
    ) {
        self.requestValue = requestValue
        self.route = route
    }
    
}

// MARK: Input ViewModel
extension DefaultDashboardViewModel {
    
    func viewDidLoad() {
    }
    
}
