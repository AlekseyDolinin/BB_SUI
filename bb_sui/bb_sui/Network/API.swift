import Foundation
import SwiftyJSON
import UIKit

typealias Response_ = (json: JSON, code: Int, data: Data)

final class API: NSObject {
    
    static let shared = API()
        
    static var imageCash = NSCache<NSString, UIImage>() 
        
    ///
    func _requestImage(link: String) async -> UIImage {
        let fullLink = URL(string: link)?.scheme == nil ? (LocalStorage.shared.url + link) : link
        // проверка есть ли закешированое изображение
        if let cashImage = API.imageCash.object(forKey: fullLink as NSString) {
            return cashImage
        } else {
            guard let url = URL(string: fullLink) else { return UIImage() }
            var request = URLRequest(url: url)
            setCookieInRequest(&request)
            request.httpMethod = HTTPMethod.get.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                guard let image = UIImage(data: data) else { return UIImage() }
                API.imageCash.setObject(image, forKey: url.absoluteString as NSString)
                return image
            } catch {
                print("Ошибка: \(error)")
                return UIImage()
            }
        }
    }
    
    
//    ///
//    func getSVG(url: URL) async -> UIImage {
//        var request = URLRequest(url: url)
//        setCookieInRequest(&request)
//        do {
//            let session = URLSession(configuration: .default)
//            let (data, _) = try await session.data(for: request)
//            let receivedImage: SVGKImage = SVGKImage(data: data)
//            return receivedImage.uiImage.withRenderingMode(.alwaysTemplate)
//        } catch {
//            print("Ошибка load svg: \(error.localizedDescription.debugDescription).")
//            return UIImage()
//        }
//    }
    
    
    ///
    func _request(_ link: String,
                         method: HTTPMethod = .get,
                         parameters: Any? = nil,
                         needCookie: Bool = true) async -> Response_? {
        guard let url = URL(string: link) else { return nil }
        var request = URLRequest(url: url)
        if needCookie { setCookieInRequest(&request) }
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 30
        if parameters != nil {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters!, options: .prettyPrinted)
            } catch let error {
                print("error_add_parameters: \(error.localizedDescription)")
                return nil
            }
        }
        do {
            let session = URLSession(configuration: URLSessionConfiguration.default,
                                     delegate: nil,
                                     delegateQueue: .current)
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else { return nil }
            getCookies(response: httpResponse)
            return Response_(json: JSON(data), code: httpResponse.statusCode, data: data)
        } catch {
//            ErrorAlert.shared.show(detail: error.localizedDescription)
//            print("Неожиданная_ошибка_: \(error.localizedDescription.debugDescription).")
            return nil
        }
    }
    
//    ///
//    func sendMultipartFormData(dataRequest: MultipartFormDataRequest, completion: @escaping () -> ()) {
//        URLSession.shared.dataTask(with: dataRequest) { data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse else { return }
//            if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
//                completion()
//            } else {
//                do {
//                    let json = try JSON(data: data ?? Data())
//                    ErrorAlert.shared.show(detail: json["detail"].stringValue)
//                } catch let error {
//                    ErrorAlert.shared.show(detail: error.localizedDescription)
//                }
//            }
//        }.resume()
//    }
    
    ///
    private func getCookies(response: HTTPURLResponse) {
        guard let url = response.url else { return }
        guard let fields = response.allHeaderFields as? [String: String] else { return }
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: fields, for: url)
        HTTPCookieStorage.shared.setCookies(cookies, for: url, mainDocumentURL: nil)
        for cookie in cookies {
            if cookie.name == "language" {
                AppLanguage.shared.setLanguage(languageFromCookie: cookie.value)
            }
        }
    }
    
//    ///
//    private func parseError(httpResponse: HTTPURLResponse, json: JSON) {
//        /// 400 - нет доступа к объекту (возможно заблокирован в админнке)
//        if httpResponse.statusCode == 400 {
//            print(httpResponse)
//            ErrorAlert.shared.show(detail: json["detail"].stringValue, needBack: true)
//            return
//        }
//        
//        if httpResponse.statusCode >= 400 && httpResponse.statusCode != 401 {
//            print("httpResponse: \(httpResponse)")
//            let detail = (json["detail"].string == nil) ? "\(httpResponse.statusCode)" : json["detail"].stringValue
//            // игнорировать если не авторизован
//            if httpResponse.statusCode == 401 {
//                print("!!!! 401 !!!!!")
//            } else {
//                ErrorAlert.shared.show(detail: detail)
//            }
//        }
//    }
    
    //
    func setCookieInRequest(_ request_: inout URLRequest) {
        guard let savedCookie = UserDefaults.standard.dictionary(forKey: .cookiesKey) else { return }
        guard let dictionary = savedCookie["cookie_dict"] as? Dictionary<String, Any> else { return }
        guard let value: String = dictionary["Value"] as? String else { return }
        guard let name: String = dictionary["Name"] as? String else { return }
        let cookies_header = "\(name)=\(value);"/* + " language=\(AppLanguage.shared.language.rawValue);"*/
        request_.setValue(cookies_header, forHTTPHeaderField: "Cookie")
    }
    
    enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
        case put     = "PUT"
        case delete  = "DELETE"
    }
    
}

//extension API: URLSessionDelegate {
//    
//    public func urlSession(_ session: URLSession, didBecomeInvalidWithError error: (any Error)?) {
//        print("didBecomeInvalidWithError")
//    }
//    
//    public func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
//        print("urlSessionDidFinishEvents")
//    }
//}
