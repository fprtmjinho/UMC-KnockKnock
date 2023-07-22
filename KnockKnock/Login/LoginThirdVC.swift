//
//  LoginThirdVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
class LoginThirdVC : UIViewController {
    var nextBtn : UIButton = UIButton()
    
    
    let lastLabel : UILabel = {
        let label = UILabel()
        label.text = "다음이 마지막 단계입니다!"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
}
extension LoginThirdVC {
    func makeSubView(){
        view.addSubview(lastLabel)
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    func makeConstraint(){
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastLabel.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -10),
        ])
    }
    func makeAddTarget(){
        nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
    }
    @objc func nextView(_: UIButton){
        let allowApproachVC = AllowApproachVC()
        self.navigationController?.pushViewController(allowApproachVC, animated: true)
    }
}
