import SwiftyJSON
import UIKit
import Combine

public var gDict: JSON!

final class AppLanguage {
    
    static let shared = AppLanguage()
        
    @Published var dict = JSON()
    
    var language = "ru-RU"
    
    private var taskFirstLoadDictionary: Task<Void, Never>?
        
    func setLanguage(languageFromCookie: String) {
        language = languageFromCookie
        // первая установка словаря
        if gDict == nil && taskFirstLoadDictionary == nil {
            taskFirstLoadDictionary = Task(priority: .userInitiated) {
                await getDictionary()
                taskFirstLoadDictionary = nil
            }
        }
    }
    
    private func getDictionary() async {
        let link = Endpoint.path(.getLanguageDictionary)
        let json = await API.shared._request(link)
        if let json = json {
//            gDict = json
//            dict = json
        }
    }
        
    func changeLanguageFromMenuApp(index: Int) {
        if index == 0 { language = "ru-RU" }
        if index == 1 { language = "en-US" }
        Task(priority: .userInitiated) {
            await changeLanguageInBack()
            await getDictionary()
            print(gDict)
        }
    }
    
    private func changeLanguageInBack() async {
        let parameters: [String : Any] = ["lang_code": language]
        let link = Endpoint.path(.lang)
        _ = await API.shared._request(link, method: .post, parameters: parameters)
    }
}
