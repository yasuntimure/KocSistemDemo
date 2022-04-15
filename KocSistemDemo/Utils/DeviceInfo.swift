//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation
import UIKit

struct DeviceInfo {
    static func model() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        _ = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return  UIDevice.current.localizedModel
    }

    static func UUIDString() -> String {
//        if let UUIDString = KeychainService.getValue(Keys.kDeviceID), UUIDString != "" {
//            return UUIDString
//        }
//        else {
            let UUIDString = UIDevice.current.identifierForVendor?.uuidString ?? ""
//            KeychainService.setValue(Keys.kDeviceID, value: UUIDString)
            return UUIDString
//        }
    }

    static func deviceUniqeId() -> String {

        return  DeviceInfo.UUIDString()
    }

    static func name() -> String {
        return  UIDevice.current.name
    }

    static func systemName() -> String {
        return "ios"
    }

    static func systemVersion() -> String {
        let osV = ProcessInfo().operatingSystemVersion
        let fullVersion = String(format:"%d.%d.%d", osV.majorVersion, osV.minorVersion, osV.patchVersion)
        return  fullVersion
    }

    static func getDeviceValidationInfo () -> String {
        return UUIDString()
    }

    static func appVersion () -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }

    static func getDeviceChallengeResponse(salt: String) -> String {
        // let challenge = Hash.sha512(value: DeviceInfo.UUIDString()) + "|" + salt
        // return challenge
        return ""
    }

    static func machineName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        return machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
    }
}
