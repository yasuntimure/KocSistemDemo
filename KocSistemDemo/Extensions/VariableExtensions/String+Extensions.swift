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
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
            return UIImage(data: data)
        }
        return nil
    }
}


extension String {
/// Returns a SPCScene.Image from a string. Use to generate an image, based on an emoji string.
    func image() -> UIImage {
        let size = CGSize(width: 80, height: 80)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 70)])
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return image

        } else {
            return UIImage()
        }
    }
}




