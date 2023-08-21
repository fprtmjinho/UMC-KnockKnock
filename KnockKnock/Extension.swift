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



extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
    
    func addLeftImage(image : UIImage){
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: image.size.width, height: image.size.height))
        let view = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + 20, height: image.size.height))
        imageView.image = image
        view.addSubview(imageView)
        self.leftView = view
        self.leftViewMode = .always
    }
 
}

extension UITextView {
    func addPadding() {
        self.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15);
    }
}

extension UIImage {
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // 비트맵 그래픽 배경에 이미지 다시 그리기
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        // 현재 비트맵 그래픽 배경에서 이미지 가져오기
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        
        // 비트맵 환경 제거
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

extension UIViewController {
    
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
    
    
    func setNextBtn(view : UIViewController, title : String) -> UIButton{
        let nextBtn : UIButton = {
           let nextbtn = UIButton()
            var title = AttributedString(title)
            title.font = UIFont.boldSystemFont(ofSize: 20)
            
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            config.cornerStyle = .capsule
            config.attributedTitle = title
            
            nextbtn.tintColor = .white
            nextbtn.configuration = config
            return nextbtn
        }()
        
        self.view.addSubview(nextBtn)
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nextBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        return nextBtn
    }
    

    func setSearchBar(VC : UIViewController, title : String) -> UISearchBar{
        let searchBar : UISearchBar = {
            let searchBar = UISearchBar()

            searchBar.placeholder = title
            searchBar.isTranslucent = false
            searchBar.searchBarStyle = .minimal
            searchBar.searchTextField.backgroundColor = .systemGray6
            searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
            searchBar.searchTextField.layer.cornerRadius = 20
            searchBar.searchTextField.layer.masksToBounds = true
            searchBar.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])),
                                     for: .search, state: .normal)

            return searchBar
        }()

        VC.view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        return searchBar
    }

}


extension UILabel {
    //템플릿에 사용
    //라벨 누르면 텍스트 복사
    
    func CopyOnLabel() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(sender:)))
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture) // tapGestureRecognizer를 라벨에 붙인다.
    }
    
    @objc private func labelTapped(sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else {
            return
        }
        UIPasteboard.general.string = label.text // 텍스트가 복사됨
    }
    
}

extension BasePaddingLabel {
    
    func textguideExtension(){
        self.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemGray6
        self.numberOfLines = 0
        self.CopyOnLabel()
        
        let padding = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
        
        let size = self.sizeThatFits( CGSize(width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        self.lineBreakMode = .byCharWrapping
        self.frame.size.width = size.width
        self.frame.size.height = size.height
        
    }
}

extension UIView {
    func handleEditFunc(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        self.endEditing(true)
    }
}
