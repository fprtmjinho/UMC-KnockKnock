//
//  ToChangePasswordVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/17.
//

import UIKit
class ToChangePasswordVC : UIViewController {
    let checkIMg : UIImageView = {
            let checkImg = UIImageView()
            let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])
            checkImg.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
            return checkImg
        }()

        let loginLabel : UILabel = {
            let label = UILabel()
            label.text = "로그인 되었습니다!"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 23)
            return label
        }()

        let changePasswordBtn : UIButton = {
            let btn = UIButton()
            btn.setTitle("비밀번호 변경하기 >", for: .normal)
            btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
            return btn
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

extension ToChangePasswordVC {
    func makeSubView(){
        view.addSubview(checkIMg)
        view.addSubview(loginLabel)
        view.addSubview(changePasswordBtn)
    }

    func makeConstraint(){
        checkIMg.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        changePasswordBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            checkIMg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkIMg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            checkIMg.widthAnchor.constraint(equalToConstant: 90),
            checkIMg.heightAnchor.constraint(equalToConstant: 90),
            loginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: checkIMg.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            changePasswordBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            changePasswordBtn.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            changePasswordBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            changePasswordBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)

        ])

    }

    func makeAddTarget(){
        self.changePasswordBtn.addTarget(self, action: #selector(changePasswordBtnFunc(_:)), for: .touchUpInside)
    }

    @objc func changePasswordBtnFunc(_: UIButton){
        let changePasswordVC = ChangePasswordVC()
        navigationController?.pushViewController(changePasswordVC, animated: true)
    }
}
