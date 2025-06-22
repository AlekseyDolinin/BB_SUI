import Foundation
import UIKit

public extension UIViewController {
        
    func showLoader(addBlure: Bool = false) {
        if addBlure == true {
            var blureStyle: UIBlurEffect.Style!
            blureStyle = AppTheme.shared.basicTheme == .dark ? .dark : .light
            let blurEffect = UIBlurEffect(style: blureStyle)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(blurEffectView)
        }
        //
        let loader = Loader()
        view.addSubview(loader)
        view.isUserInteractionEnabled = false
        //
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoader() {
        view.subviews.forEach { v in
            if v is Loader {
                v.removeFromSuperview()
                view.isUserInteractionEnabled = true
            }
            if v is UIVisualEffectView {
                v.removeFromSuperview()
            }
        }
    }
}
