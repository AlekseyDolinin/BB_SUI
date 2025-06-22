import SwiftUICore
import UIKit
import SwiftyJSON

final class AppTheme {
    
    static let shared = AppTheme()
    
    static var BB_PrimaryUI: Color = Color(hex: "#f5e76e")
    static var BB_BGPrimary: Color = Color(hex: "#1a1a1a")
    static var BB_BGSecondary: Color = .gray
    static var BB_BGTertiary: Color = .black
    
    static var BB_TextUI: Color = .white
    static var BB_TextHigh: Color = Color(hex: "#ffffff")
    static var BB_TextPrimary: Color = Color(hex: "#ffffff")
    static var BB_TextSecondary: Color = .white
    
    static var BB_TextMedium: Color = .white.opacity(0.7)
    static var BB_TextDisabled: Color = .white.opacity(0.5)
    
    static var BB_Red: Color = .red
    static var BB_Green: Color = .green
    static var BB_Warning: Color = .orange
    
    static var Surface_BB_00db: Color = .black
    
    enum AppColorTheme {
        case dark
        case light
    }
    
    var themeJSON: JSON! {
        didSet {
            if themeJSON != nil {
                setThemeColors()
            }
        }
    }
    
    var basicTheme: AppColorTheme = .dark
    
    private func setThemeColors() {
        print("colors: \(themeJSON["colors"])")
        basicTheme = themeJSON["basic_theme"].stringValue == "dark" ? .dark : .light
        createColorTheme()
    }
    
    private func createColorTheme() {
        let colors = themeJSON["colors"]
        
        AppTheme.BB_PrimaryUI = Color(hex: colors["TextUI2"].stringValue)
        AppTheme.BB_BGPrimary = Color(hex: colors["BGPrimary"].stringValue)
        
        AppTheme.BB_TextHigh = Color(hex: colors["TextPrimary"].stringValue)
        AppTheme.BB_TextPrimary = Color(hex: colors["TextUI1"].stringValue)
        AppTheme.BB_TextSecondary = Color(hex: colors["TextUI1"].stringValue)
                
        AppTheme.BB_TextUI = Color(hex: colors["TextPrimary"].stringValue)
        AppTheme.BB_TextMedium = AppTheme.BB_TextUI.opacity(0.7)
        AppTheme.BB_TextDisabled = AppTheme.BB_TextUI.opacity(0.5)
        
        AppTheme.BB_BGSecondary = setColor(basic: AppTheme.BB_BGPrimary, dark: 0.1, light: -0.04)
        AppTheme.BB_BGTertiary = setColor(basic: AppTheme.BB_BGPrimary, dark: -0.06, light: -0.06)
                
        AppTheme.BB_Red = Color(hex: colors["FixedUIRed"].stringValue)
        AppTheme.BB_Green = Color(hex: colors["FixedUIGreen"].stringValue)
        AppTheme.BB_Warning = Color(hex: colors["Warning"].stringValue)
        
        AppTheme.Surface_BB_00db = setColor(basic: AppTheme.BB_BGPrimary, dark: -0.06, light: -0.06)


        
        
        
        
        
        
        
//        UIColor.BB_SecondaryUI = UIColor.hexStringToUIColor(hex: colors["TextUI1"].stringValue)
//        UIColor.BB_TextOnPrimary = UIColor.hexStringToUIColor(hex: colors["TextUIButtonChange"].stringValue)
//        // other
//        UIColor.BB_BGTertiary = AppTheme.createBGTertiary()
//        //
//        UIColor.BB_SPPrimary = AppTheme.createSPPrimary()
//        UIColor.BB_SPSecondary = AppTheme.createSPSecondary()
//        UIColor.BB_SPWhite = AppTheme.createSPWhite()
//        // Surface
//        UIColor.Surface_BB_01db = AppTheme.createSurface_BB_01db()
//        UIColor.Surface_BB_02db = AppTheme.createSurface_BB_02db()
//        UIColor.Surface_BB_03db = AppTheme.createSurface_BB_03db()
//        // Primary_brand
//        UIColor.DEL_PrimaryBRAND = AppTheme.createDEL_PrimaryBRAND()
//        // Secondary_Brand
//        UIColor.DEL_SecondaryBRAND = AppTheme.createDEL_SecondaryBRAND()
//        // Text_ui
//        UIColor.BB_TextPrimary = createBB_TextPrimary()
//        UIColor.BB_TextOnPrimaryHigh = createBB_TextOnPrimaryHigh()
//        UIColor.BB_TextOnPrimaryMedium = createBB_TextOnPrimaryMedium()
//        UIColor.BB_TextOnPrimaryDisabled = createBB_TextOnPrimaryDisabled()
//        //
//        UIColor.BB_SPOutline1 = createBB_SPOutline1()
//        UIColor.BB_SPOutline2 = createBB_SPOutline2()
    }
    
    
    private func setColor(basic: Color, dark: CGFloat, light: CGFloat) -> Color {
        let components = UIColor(basic).cgColor.components
        if AppTheme.shared.basicTheme == .dark {
            return Color(hue:           Double(components![0]),
                         saturation:    Double(components![1]),
                         brightness:    Double(components![2]) + dark)
        } else {
            return Color(hue:           Double(components![0]),
                         saturation:    Double(components![1]),
                         brightness:    Double(components![2]) + light)
        }
    }
    

    
//    private class func createBB_TextPrimary() -> Color {
//        return .BB_PrimaryUI
//    }
    
    
//

//    
//    private class func createSPPrimary() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .white.withAlphaComponent(0.12)
//        } else {
//            return .black.withAlphaComponent(0.12)
//        }
//    }
//    
//    private class func createSPSecondary() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .white.withAlphaComponent(0.08)
//        } else {
//            return .black.withAlphaComponent(0.08)
//        }
//    }
//    
//    private class func createSPWhite() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .white.withAlphaComponent(0.5)
//        } else {
//            return .black.withAlphaComponent(0.5)
//        }
//    }
//    
//    private class func createSurface_BB_01db() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return UIColor(hue: UIColor.BB_BGTertiary.hsba.h, saturation: UIColor.BB_BGTertiary.hsba.s, brightness: UIColor.BB_BGTertiary.hsba.b + 0.06, alpha: 1.0)
//        } else {
//            return UIColor(hue: UIColor.BB_BGTertiary.hsba.h, saturation: UIColor.BB_BGTertiary.hsba.s, brightness: UIColor.BB_BGTertiary.hsba.b + 0.06, alpha: 1.0)
//        }
//    }
//    
//    private class func createSurface_BB_02db() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return UIColor(hue: UIColor.BB_BGTertiary.hsba.h, saturation: UIColor.BB_BGTertiary.hsba.s, brightness: UIColor.BB_BGTertiary.hsba.b + 0.16, alpha: 1.0)
//        } else {
//            return UIColor(hue: UIColor.BB_BGTertiary.hsba.h, saturation: UIColor.BB_BGTertiary.hsba.s, brightness: UIColor.BB_BGTertiary.hsba.b - 0.02, alpha: 1.0)
//        }
//    }
//    
//    private class func createSurface_BB_03db() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return UIColor(hue: UIColor.BB_BGTertiary.hsba.h, saturation: UIColor.BB_BGTertiary.hsba.s, brightness: UIColor.BB_BGTertiary.hsba.b + 0.24, alpha: 1.0)
//        } else {
//            return UIColor(hue: UIColor.BB_BGTertiary.hsba.h, saturation: UIColor.BB_BGTertiary.hsba.s, brightness: UIColor.BB_BGTertiary.hsba.b + 0.24, alpha: 1.0)
//        }
//    }
//    
//    private class func createDEL_PrimaryBRAND() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .BB_PrimaryUI
//        } else {
//            return .BB_PrimaryUI
//        }
//    }
//    
//    private static func createDEL_SecondaryBRAND() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .BB_SecondaryUI
//        } else {
//            return .BB_SecondaryUI
//        }
//    }
//
//

//    private class func createBB_TextOnPrimaryHigh() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .BB_TextOnPrimary.withAlphaComponent(0.9)
//        } else {
//            return .BB_TextOnPrimary.withAlphaComponent(0.9)
//        }
//    }
//    
//    private class func createBB_TextOnPrimaryMedium() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .BB_TextOnPrimary.withAlphaComponent(0.7)
//        } else {
//            return .BB_TextOnPrimary.withAlphaComponent(0.7)
//        }
//    }
//    
//    private class func createBB_TextOnPrimaryDisabled() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return .BB_TextOnPrimary.withAlphaComponent(0.5)
//        } else {
//            return .BB_TextOnPrimary.withAlphaComponent(0.5)
//        }
//    }
//    
//    private class func createBB_SPOutline1() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return UIColor(hue: UIColor.BB_BGPrimary.hsba.h, saturation: UIColor.BB_BGPrimary.hsba.s, brightness: UIColor.BB_BGPrimary.hsba.b + 0.3, alpha: 1.0)
//        } else {
//            return UIColor(hue: UIColor.BB_BGPrimary.hsba.h, saturation: UIColor.BB_BGPrimary.hsba.s, brightness: UIColor.BB_BGPrimary.hsba.b - 0.2, alpha: 1.0)
//        }
//    }
//    
//    private class func createBB_SPOutline2() -> UIColor {
//        if AppTheme.basicTheme == "dark" {
//            return UIColor(hue: UIColor.BB_BGPrimary.hsba.h, saturation: UIColor.BB_BGPrimary.hsba.s, brightness: UIColor.BB_BGPrimary.hsba.b + 0.3, alpha: 1.0)
//        } else {
//            return UIColor(hue: UIColor.BB_BGPrimary.hsba.h, saturation: UIColor.BB_BGPrimary.hsba.s, brightness: UIColor.BB_BGPrimary.hsba.b - 0.4, alpha: 1.0)
//        }
//    }
}






extension UIColor {
    
    var hsba:(h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return (h: h, s: s, b: b, a: a)
    }
}
