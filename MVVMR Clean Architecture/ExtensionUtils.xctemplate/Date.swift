//
//  Date.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//

import Foundation

extension Date {
    
    func add(OfComponent component: Calendar.Component, value: Int) -> Date {
        guard let result = Calendar.current.date(byAdding: component, value: value, to: self) else { return self }
        return result
    }
    
    func ddMMyyyy(separator: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd\(separator)MM\(separator)yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    func ddMMMyyyy(separator: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd\(separator)MMM\(separator)yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    func HHmm(separator: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH\(separator)mm"
        
        return dateFormatter.string(from: self)
    }
    
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {

        let currentCalendar = Calendar.current

        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return .zero }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return .zero }

        return end - start
    }
    
    func subtract(with date: Date) -> Date {
        let time1 = self.timeIntervalSince1970
        let time2 = date.timeIntervalSince1970
        
        let subtractResult = time1 - time2
        
        return Date(timeIntervalSince1970: subtractResult)
    }
    
}
