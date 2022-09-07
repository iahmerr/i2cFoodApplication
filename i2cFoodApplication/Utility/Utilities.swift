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
}

extension String {
    
    func dateFromString() -> Date {
        let formatter4 = DateFormatter()
        formatter4.dateFormat = "d MMM y"
        return formatter4.date(from: self)!
    }
}
