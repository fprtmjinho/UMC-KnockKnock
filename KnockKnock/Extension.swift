//
//  Extension.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/09.
//

import UIKit

extension UIButton {
    func setUnderLine(){
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: title.count)
                        )
        setAttributedTitle(attributedString, for: .normal)
    }
}


extension UIViewController{
    func setNavigationBar(){
        //UINavigationBar.appearance().isTranslucent = false
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        //let navigationBar = self.navigationController!.navigationBar
        //let appearance = UINavigationBarAppearance()
        //appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20)]
        
        //navigationBar.standardAppearance = appearance
        //navigationBar.compactAppearance = appearance
        //navigationBar.scrollEdgeAppearance = appearance
        
        //navigatioinBar Custom 필요 -> 크기 수정
    }
}


extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
 
}
