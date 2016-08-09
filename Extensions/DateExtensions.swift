//
//  DateExtensions.swift
//  SwiftierSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//

import Foundation
public extension NSDate {
    
    
    public var calendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
    
    
    public var timeZone: NSTimeZone {
        return self.calendar.timeZone
    }
    
    
    public var nanosecond: Int {
        return calendar.component(.Nanosecond, fromDate: self)
    }
    
    
    public var second: Int {
        get {
            return calendar.component(.Second, fromDate: self)
        }
		set {
			// FIXME:
            //self = NSDate(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: hour, minute: minute, second: newValue, nanosecond: nanosecond)
			self.second = newValue
        }
    }
    
    
    public var minute: Int {
        get {
            return calendar.component(.Minute, fromDate: self)
        }
        set {
			// FIXME:
            //self = NSDate(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: hour, minute: newValue, second: second, nanosecond: nanosecond)
			self.minute = newValue
        }
    }
    
    
    public var hour: Int {
        get {
            return calendar.component(.Hour, fromDate: self)
        }
        set {
			// FIXME:
            //self = NSDate(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: newValue, minute: minute, second: second, nanosecond: nanosecond)
			self.hour = newValue
        }
    }
    
    
    public var day: Int {
        get {
            return calendar.component(.Day, fromDate: self)
        }
        set {
			// FIXME:
            //self = NSDate(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: newValue, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
			self.day = newValue
        }
    }
    
    
    public var weekday: Int {
        return calendar.component(.Weekday, fromDate: self)
    }
    
    
    public var weekOfMonth: Int {
        return calendar.component(.WeekOfMonth, fromDate: self)
    }
    
    
    public var weekOfYear: Int {
        return calendar.component(.WeekOfYear, fromDate: self)
    }
    
    
    public var month: Int {
        get {
            return calendar.component(.Month, fromDate: self)
        }
        set {
			// FIXME:
            //self = NSDate(calendar: calendar, timeZone: timeZone, era: era, year: year, month: newValue, day: day, hour: hour, minute: minute, second: newValue, nanosecond: nanosecond)
			self.month = newValue
        }
    }
    
    
    public var year: Int {
        get {
            return calendar.component(.Year, fromDate: self)
        }
        set {
			// FIXME:
            //self = NSDate(calendar: calendar, timeZone: timeZone, era: era, year: newValue, month: month, day: day, hour: hour, minute: minute, second: newValue, nanosecond: nanosecond)
			self.year = newValue
        }
    }
    
    
    public var era: Int {
        return calendar.component(.Era, fromDate: self)
    }
    
    
    public var quarter: Int {
        return calendar.component(.Quarter, fromDate: self)
    }
    
    
    public var isInToday: Bool {
        return self.day == NSDate().day && self.month == NSDate().month && self.year == NSDate().year
    }

	// FIXME: couldnt find legacy equalivents
    /*
    public func add(component: Calendar.Component, value: Int) {
        switch component {
            
        case .second:
            self = calendar.date(byAdding: .second, value: value, to: self) ?? self
            break
            
        case .minute:
            self = calendar.date(byAdding: .minute, value: value, to: self) ?? self
            break
            
        case .hour:
            self = calendar.date(byAdding: .hour, value: value, to: self) ?? self
            break
            
        case .day:
            self = calendar.date(byAdding: .day, value: value, to: self) ?? self
            break
            
        case .weekOfYear, .weekOfMonth:
            self = calendar.date(byAdding: .day, value: value * 7, to: self) ?? self
            break
            
        case .month:
            self = calendar.date(byAdding: .month, value: value, to: self) ?? self
            break
            
        case .year:
            self = calendar.date(byAdding: .year, value: value, to: self) ?? self
            break
            
        default:
            break
        }
    }
    
    // FIXME: test
    /// Return beginning of given date component
    public func beginning(of component: Calendar.Component) -> Date {
        
        switch component {
            
        case .second:
            return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)) ?? self
            
        case .minute:
            return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)) ?? self
            
        case .hour:
            return calendar.date(from: calendar.dateComponents([.year, .month, .day, .hour], from: self)) ?? self
            
        case .day:
            return self.calendar.startOfDay(for: self)
            
        case .weekOfYear, .weekOfMonth:
            return calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) ?? self
            
        case .month:
            return calendar.date(from: calendar.dateComponents([.year, .month], from: self)) ?? self
            
        case .year:
            return calendar.date(from: calendar.dateComponents([.year], from: self)) ?? self
            
        default:
            return self
        }
    }
    
    // FIXME: test
    /// Create a new Date
    public init(calendar: Calendar?, timeZone: TimeZone?, era: Int?, year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?, nanosecond: Int?) {
        
        let calendar = calendar ?? Calendar.current
        let timeZone = timeZone ?? TimeZone.current
        let era = era ?? Date().era
        let year = year ?? Date().year
        let month = month ?? Date().month
        let day = day ?? Date().day
        let hour = hour ?? Date().hour
        let minute = minute ?? Date().minute
        let second = second ?? Date().second
        let nanosecond = nanosecond ?? Date().nanosecond
        
        let components = DateComponents(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        
        self = calendar.date(from: components) ?? Date()
    }
	*/
}
