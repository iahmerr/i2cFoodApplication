//
//  Utilities.swift
//  i2cFoodApplication
//
//  Created by Muhammad Ahmar Hassan  on 06/09/2022.
//

import Foundation

extension Calendar {
  func isDateInThisWeek(_ date: Date) -> Bool {
    return isDate(date, equalTo: Date(), toGranularity: .weekOfYear)
  }
    
    static let iso8601 = Calendar(identifier: .iso8601)
}

extension String {
    
    func dateFromString() -> Date {
        let formatter4 = DateFormatter()
        formatter4.dateFormat = "d MMM y"
        return formatter4.date(from: self)!
    }
}


extension Calendar {
    
}
extension Date {
    
    var isDateInTheFuture: Bool {
        return self > Date()
    }
    
    var isToday: Bool {
        let calender = Calendar.current
        return calender.isDateInToday(self)
    }
    
    var daysOfWeek: [Date] {
        let startOfWeek = Calendar.iso8601.date(from: Calendar.iso8601.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
        return (0...6).compactMap{ Calendar.current.date(byAdding: .day, value: $0, to: startOfWeek)}
    }
    
    func isDateInThisWeek()-> Bool {
        daysOfWeek.contains(self)
    }
}
