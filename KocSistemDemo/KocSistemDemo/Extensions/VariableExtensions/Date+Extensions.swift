//
//  Date+Extensions.swift
//  LTLMobile
//
//  Created by Eyüp Yasuntimur on 17.10.2021.
//

import Foundation

extension Date {
    
    func toString() -> String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY/MM/dd"
        
        // return date to string
        return dateFormatter.string(from: self)
    }
    
}
