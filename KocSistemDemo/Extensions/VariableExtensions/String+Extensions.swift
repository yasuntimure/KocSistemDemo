//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

extension String {

    var isNotEmpty: Bool {
        return !isEmpty
    }

    func upperCasedTR() -> String {
        return self.uppercased(with: Locale.TR)
    }

    func lowerCasedTR() -> String {
        return self.lowercased(with: Locale.TR)
    }
}

extension String {

    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }

    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }

    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }

    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }

    func makeACall() {
        if self.isValid(regex: .phone) {
            if let url = URL(string: "tel:\(self.onlyDigits())"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}


extension String {
    func format() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"  // Note: S is fractional second
        if let dateFromString = dateFormater.date(from: self) { // "Nov 25, 2015, 4:31 AM" as NSDate
            let newFormater = DateFormatter()
            newFormater.dateFormat = "dd.MM.yy   HH:mm"
            let stringFromDate = newFormater.string(from: dateFromString)
            return stringFromDate
        } else {
            return "----"
        }
    }
}





