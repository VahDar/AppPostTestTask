//
//  TimeInterval.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 28.02.2024.
//

import Foundation

extension TimeInterval {
    
    func daysAgo() -> String {
        let calendar = Calendar.current
        let calendarDate = Date(timeIntervalSince1970: self)
        let now = Date()
        let components = calendar.dateComponents([.day], from: calendarDate, to: now)
        if let days = components.day {
            if days == 1 {
                return "Yesterday"
            } else if days > 1 {
                return "\(days) days ago"
            } else {
                return "Today"
            }
        } else {
            return "Today"
        }
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")
        let date = Date(timeIntervalSince1970: self)
        return dateFormatter.string(from: date)
    }
}
