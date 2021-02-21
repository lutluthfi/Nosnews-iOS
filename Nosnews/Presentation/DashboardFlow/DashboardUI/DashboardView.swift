//
//  DashboardView.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 21/02/21.
//  Copyright (c) 2021 All rights reserved.
//
//  Template:
//  Modified by Arif Luthfiansyah
//  Created by Oleh Kudinov

import UIKit

// MARK: DashboardView
final class DashboardView: UIView {

    weak var navigationBar: UINavigationBar?
    weak var navigationItem: UINavigationItem!
    
    // MARK: Subview Variable

    // MARK: Init Function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(navigationBar: UINavigationBar?, navigationItem: UINavigationItem) {
        self.navigationBar = navigationBar
        self.navigationItem = navigationItem
        super.init(frame: UIScreen.main.fixedCoordinateSpace.bounds)
        self.addSubviews()
        self.makeConstraints()
    }

    private func addSubviews() {
    }

    private func makeConstraints() {
    }

}

extension DashboardView {
    
    func viewWillAppear() {
        
    }
    
    func viewWillDisappear() {
        
    }
    
}
