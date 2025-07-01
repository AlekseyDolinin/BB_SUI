import SwiftyJSON
import UIKit
import Combine

@Observable
final class AppLanguage {
    
    static let shared = AppLanguage()
        
    var dict = JSON()
    
    var language = "ru-RU"
    
    private var taskFirstLoadDictionary: Task<Void, Never>?
        
    func setLanguage(languageFromCookie: String) {
        language = languageFromCookie
        // первая установка словаря
        if taskFirstLoadDictionary == nil {
            taskFirstLoadDictionary = Task(priority: .userInitiated) {
                await getDictionary()
                taskFirstLoadDictionary = nil
            }
        }
    }
    
    private func getDictionary() async {
        let link = Endpoint.path(.getLanguageDictionary)
        let response = await API.shared._request(link)
        if let json = response?.json {
            dict = json
        }
    }
        
    func changeLanguageFromMenuApp() {
        Task(priority: .userInitiated) {
            await changeLanguageInBack()
            await getDictionary()
        }
    }
    
    private func changeLanguageInBack() async {
        let parameters: [String : Any] = ["lang_code": language]
        let link = Endpoint.path(.lang)
        let _ = await API.shared._request(link, method: .post, parameters: parameters)
    }
}
