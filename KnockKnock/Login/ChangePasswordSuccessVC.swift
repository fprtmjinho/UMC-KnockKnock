//
//  ChangePasswordSuccessVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/06.
//

import UIKit
class ChangePasswordSuccessVC : UIViewController {
    
    let checkIMg : UIImageView = {
            let checkImg = UIImageView()
            let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])
            checkImg.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
            return checkImg
        }()

        let successLabel : UILabel = {
            let label = UILabel()
            label.text = "비밀번호가 재설정 되었습니다!"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 23)
            return label
        }()
    
    let logintoLabel : UILabel = {
        let label = UILabel()
        label.text = "로그인 페이지로 이동합니다"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
    }

}

extension ChangePasswordSuccessVC {
    func makeSubView(){
        view.addSubview(checkIMg)
        view.addSubview(successLabel)
        view.addSubview(logintoLabel)
    }

    func makeConstraint(){
        checkIMg.translatesAutoresizingMaskIntoConstraints = false
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        logintoLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            checkIMg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkIMg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            checkIMg.widthAnchor.constraint(equalToConstant: 90),
            checkIMg.heightAnchor.constraint(equalToConstant: 90),
            successLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            successLabel.topAnchor.constraint(equalTo: checkIMg.bottomAnchor, constant: 20),
            successLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
           successLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            logintoLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logintoLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 5),
            logintoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            logintoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)

        ])

    }
}
