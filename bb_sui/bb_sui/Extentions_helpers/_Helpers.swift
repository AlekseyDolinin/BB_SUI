import Foundation

final class GetURL {
    static let shared = GetURL()
    func get(link: String) -> URL {
        let fullLink = LocalStorage.shared.url + link
        return URL(string: fullLink) ?? URL(fileURLWithPath: "")
    }
}

final class GetFullNameUser {
    static let shared = GetFullNameUser()
    func get(surName: String, middleName: String, name: String) -> String {
        let fullName = "\(surName) \(name) \(middleName)"
        return fullName
    }
}
