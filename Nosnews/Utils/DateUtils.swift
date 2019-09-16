//
//  DateHelper.swift
//  Framework
//
//  Created by Arif Luthfiansyah on 13/07/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit

class DateUtils: NSObject {
    
    enum DateType: String {
        case dayInNumber = "dd"
        case monthInNumber = "MM"
        case monthInName = "MMM"
        case yearFull = "yyyy"
        case yearShort = "yy"
        
        case minute = "mm"
        case hour = "HH"
        case second = "ss"
        
        case dateInStandard = "yyyy-MM-dd"
        case dateInTime = "dd-MM-yyyy HH:mm"
        case dateInTimeFull = "yyyy-mm-dd'T'HH:mm:ss'Z'"
        case dateInTimeWithZ = "dd-MM-yyyy HH:mm:ss.z"
        
        case creditCardFull = "yyyy-MM-dd HH:mm:ss.z"
        case creditCard = "MM/yyyy"
    }
    
    static func getDate(from interval: TimeInterval, format: DateType) -> String {
        let date = Date(timeIntervalSince1970: interval)
        let formatter = formatDate(format: format.rawValue)
        
        return formatter.string(from: date)
    }
    
    static func format(date: String, from startFormat: String, to endFormat: String) -> String {
        let startFormatter = self.formatDate(format: startFormat)
        let startDate = startFormatter.date(from: date)!
        
        let endFormatter = self.formatDate(format: endFormat)
        let endDateString = endFormatter.string(from: startDate)
        
        return endDateString
    }
    
    static func format(from date: String, from: DateType, to: DateType) -> String {
        let formatter = formatDate(format: from.rawValue)
        let dt1 = formatter.date(from: date)!
        
        let formatter1 = formatDate(format: to.rawValue)
        let dt2 = formatter1.string(from: dt1)
        
        return dt2
    }
    
    static func formatDate(from date: String, from: DateType, to: DateType) -> Date {
        let formatter = formatDate(format: from.rawValue)
        let dt1       = formatter.date(from: date)
        
        let formatter1 = formatDate(format: to.rawValue)
        let dt2       = formatter1.date(from: "\(dt1!)")
        
        return dt2 ?? Date()
    }
    
    static func addingDay(dt: Date, day: Int) -> Date {
        let dt = Calendar.current.date(byAdding: .day, value: day, to: dt)
        return dt ?? Date()
    }
    
    private static func formatDate(format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = format
        return formatter
    }
    
    static func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return components.day!
    }
    
    static func rangeDate(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
}
