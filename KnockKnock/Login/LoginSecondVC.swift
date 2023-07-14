//
//  LoginSecondVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
import CoreData
class LoginSecondVC : UIViewController{
    
    var nextBtn : UIButton = UIButton()
    
    let num4 : UILabel = {
       let num4 = UILabel()
        num4.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num4.text = "4"
        num4.textColor = .white
        num4.textAlignment = .center
        num4.font = UIFont.boldSystemFont(ofSize: 20)
        num4.clipsToBounds = true
        num4.layer.cornerRadius = 12.5
        return num4
    }()
    
    let emailLabel : UILabel = {
       let forthlabel = UILabel()
        forthlabel.text = "사용하실\n이메일을 입력하세요"
        forthlabel.font = UIFont.boldSystemFont(ofSize: 20)
        forthlabel.numberOfLines = 2
        return forthlabel
    }()
    let emailText : UITextField = {
        let forthtext = UITextField()
        forthtext.placeholder = "knock@knock.com"
        forthtext.backgroundColor = .systemGray6
        forthtext.layer.cornerRadius = 20
        forthtext.addLeftPadding()
        forthtext.clearButtonMode = .whileEditing
      
        return forthtext
    }()
    
    
    func makeSubView(){
        view.addSubview(num4)
        view.addSubview(emailLabel)
        view.addSubview(emailText)
        
    }
    
    func makeConstraint(){
        num4.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailText.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            num4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            num4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num4.widthAnchor.constraint(equalToConstant: 25),
            num4.heightAnchor.constraint(equalToConstant: 25),
            emailLabel.topAnchor.constraint(equalTo: num4.bottomAnchor, constant: 5),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailText.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailText.heightAnchor.constraint(equalToConstant: 45),

        ])
        
    }
    var email: String = ""
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(touchNextBtn(_:)), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        nextBtn = setNextBtn(view: self, title: "다음")
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    @objc func touchNextBtn(_:UIButton){
        if let emailText = emailText.text{
            email = emailText
        }
        let checkOne: Bool = emailCheck()
        if(checkOne){
            return
        }
        UserDefaults.standard.set(email, forKey: "email")

        // 데이터 동기화
        UserDefaults.standard.synchronize()
        nextView()
    }
    //이메일이 빈칸이거나 형식이 틀리면 타이틀 강조 (@를 포함하지 않거나 다른 조건(추가해야함))
    @objc func emailCheck()->Bool{
        if(email == "" || !email.contains("@")){
            emailText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            emailText.layer.borderWidth = 2
            return true
        }
        else{
            emailText.layer.borderWidth = 0
            return false
        }
    }
    @objc func nextView(){
        let loginThirdVC = LoginThirdVC()
        self.navigationController?.pushViewController(loginThirdVC, animated: true)
    }
}
