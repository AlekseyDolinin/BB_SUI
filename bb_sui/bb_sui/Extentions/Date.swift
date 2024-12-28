import Foundation

extension Date {

    enum TypeDate: String {
        
        case two = "dd.MM.YY"
        case three = "dd.MM.YYYY"
        case four = "HH:mm"
        case five = "HH:mm | dd.MM.YY"
        case six = "yyyy-MM-dd"
        case seven = "EEEE, dd MMM"
        case nine = "dd MMMM"
        case ten = "dd MMMM YYYY"
        case eleven = "dd"
        case twelve = "MMMM"
        case thirteen = "dd.MM"
        case fifteen = "yyyy-MM-dd HH:mm:ss"
        
    }

    func type(_ type: TypeDate) -> String {
        return type.rawValue
    }
}


extension Date {
    
    func toFormat(_ format: TypeDate) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: AppLanguage.shared.language)
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
