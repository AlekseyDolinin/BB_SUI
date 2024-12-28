import SwiftUICore

extension Font {

    enum FontSize: CGFloat {
        case size_12 = 12
        case size_14 = 14
        case size_16 = 16
        case size_18 = 18
        case size_20 = 20
        case size_24 = 24
        case size_30 = 30
        case size_32 = 32
        case size_34 = 34
        case size_48 = 48
    }
    
    static func ptRoot_Regular(size: FontSize) -> Font {
        return Font.custom("PTRootUI-Regular", size: size.rawValue)
    }
    static func ptRoot_Medium(size: FontSize) -> Font {
        return Font.custom("PTRootUI-Medium", size: size.rawValue)
    }
    static func ptRoot_Bold(size: FontSize) -> Font {
        return Font.custom("PTRootUI-Bold", size: size.rawValue)
    }
}


