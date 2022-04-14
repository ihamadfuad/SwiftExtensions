//
//  Date.swift
//  
//
//  Created by Hamad Ali on 14/04/2022.
//

import Foundation

/// Convenience comparable
public extension Date {

    func isBetween(_ startDate: Date, _ endDate: Date, includeBounds: Bool = false) -> Bool {

        if includeBounds {
            return startDate.compare(self).rawValue * compare(endDate).rawValue >= 0
        }

        return startDate.compare(self).rawValue * compare(endDate).rawValue > 0
    }

    var isInFuture: Bool {
        self > Date()
    }

    var isInPast: Bool {
        self < Date()
    }

    var isInToday: Bool {
        Calendar.current.isDateInToday(self)
    }

    var isInYesterday: Bool {
        Calendar.current.isDateInYesterday(self)
    }

    var isInTomorrow: Bool {
        Calendar.current.isDateInTomorrow(self)
    }

    var isInCurrentWeek: Bool {
        Calendar.current.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }

    var isInCurrentMonth: Bool {
        Calendar.current.isDate(self, equalTo: Date(), toGranularity: .month)
    }

    var isInCurrentYear: Bool {
        return Calendar.current.isDate(self, equalTo: Date(), toGranularity: .year)
    }
}

/// Convenience get
public extension Date {

    /// Number of day in the current week.
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    /// Number of week in the month.
    var weekOfMonth: Int {
        return Calendar.current.component(.weekOfMonth, from: self)
    }

    /// Number of week in the year.
    var weekOfYear: Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }

    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self) ?? Date()
    }

    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self) ?? Date()
    }
}

/// Convenience set/get
public extension Date {

    /// Get and set second
    var second: Int {

        get {
            return Calendar.current.component(.second, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentSeconds = Calendar.current.component(.second, from: self)
            let secondsToAdd = newValue - currentSeconds
            if let date = Calendar.current.date(byAdding: .second, value: secondsToAdd, to: self) {
                self = date
            }
        }
    }

    /// Get and set minute
    var minute: Int {

        get {
            return Calendar.current.component(.minute, from: self)
        }
        set {

            let allowedRange = Calendar.current.range(of: .minute, in: .hour, for: self)!

            guard allowedRange.contains(newValue)
            else {
                return
            }

            let currentMinutes = Calendar.current.component(.minute, from: self)
            let minutesToAdd = newValue - currentMinutes

            if let date = Calendar.current.date(byAdding: .minute, value: minutesToAdd, to: self) {

                self = date
            }
        }
    }

    /// Get and set hour
    var hour: Int {

        get {
            return Calendar.current.component(.hour, from: self)
        }
        set {

            let allowedRange = Calendar.current.range(of: .hour, in: .day, for: self)!

            guard allowedRange.contains(newValue)
            else {
                return
            }

            let currentHour = Calendar.current.component(.hour, from: self)
            let hoursToAdd = newValue - currentHour

            if let date = Calendar.current.date(byAdding: .hour, value: hoursToAdd, to: self) {

                self = date
            }
        }
    }

    /// Get and set day
    var day: Int {

        get {
            return Calendar.current.component(.day, from: self)
        }
        set {

            let allowedRange = Calendar.current.range(of: .day, in: .month, for: self)!

            guard allowedRange.contains(newValue)
            else {
                return
            }

            let currentDay = Calendar.current.component(.day, from: self)
            let daysToAdd = newValue - currentDay

            if let date = Calendar.current.date(byAdding: .day, value: daysToAdd, to: self) {

                self = date
            }
        }
    }

    /// Get and set month
    var month: Int {

        get {
            return Calendar.current.component(.month, from: self)
        }
        set {

            let allowedRange = Calendar.current.range(of: .month, in: .year, for: self)!

            guard allowedRange.contains(newValue)
            else {
                return
            }

            let currentMonth = Calendar.current.component(.month, from: self)
            let monthsToAdd = newValue - currentMonth

            if let date = Calendar.current.date(byAdding: .month, value: monthsToAdd, to: self) {

                self = date
            }
        }
    }

    /// Get and set year
    var year: Int {

        get {
            return Calendar.current.component(.year, from: self)
        }
        set {

            guard newValue > 0
            else {
                return
            }

            let currentYear = Calendar.current.component(.year, from: self)
            let yearsToAdd = newValue - currentYear

            if let date = Calendar.current.date(byAdding: .year, value: yearsToAdd, to: self) {

                self = date
            }
        }
    }
}

/// Convenience calendar
public extension Date {

    mutating func add(_ component: Calendar.Component, value: Int) {
        self = Calendar.current.date(byAdding: component, value: value, to: self)!
    }
}
