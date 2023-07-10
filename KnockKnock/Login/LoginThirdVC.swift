//
//  LoginThirdVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/10.
//

import UIKit
import CoreData
class LoginThirdVC: UIViewController{
    
    let num5: UILabel = {
        let num5 = UILabel()
        num5.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num5.text = "5"
        num5.textColor = .white
        num5.textAlignment = .center
        num5.font = UIFont.boldSystemFont(ofSize: 20)
        num5.clipsToBounds = true
        num5.layer.cornerRadius = 12.5
        return num5
    }()
    
    let passwordLabel: UILabel = {
        let fourthlabel1 = UILabel()
        fourthlabel1.text = "비밀번호 입력"
        fourthlabel1.font = UIFont.boldSystemFont(ofSize: 20)
        return fourthlabel1
    }()
    
    let passwordText: UITextField = {
        let fourthText1 = UITextField()
        fourthText1.backgroundColor = .systemGray6
        fourthText1.layer.cornerRadius = 20
        fourthText1.addLeftPadding()
        fourthText1.clearButtonMode = .whileEditing
        fourthText1.isSecureTextEntry = true
        return fourthText1
    }()
    
    let passwordCheckLabel: UILabel = {
        let fourthlabel2 = UILabel()
        fourthlabel2.text = "비밀번호 확인"
        fourthlabel2.font = UIFont.boldSystemFont(ofSize: 20)
        return fourthlabel2
        
        //fourthLabel1에서 비밀번호 입력 되어야 활성화, 색 변경
    }()
    
    let passwordCheckText: UITextField = {
        let fourthText2 = UITextField()
        fourthText2.backgroundColor = .systemGray6
        fourthText2.layer.cornerRadius = 20
        fourthText2.addLeftPadding()
        fourthText2.clearButtonMode = .whileEditing
        fourthText2.isSecureTextEntry = true
        return fourthText2
    }()
    
    let nextBtn: UIButton = {
        let nextbtn = UIButton()
        nextbtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        nextbtn.setTitle("다음", for: .normal)
        nextbtn.tintColor = .white
        nextbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextbtn.layer.cornerRadius = 25
        return nextbtn
    }()
    
    func makeSubView(){
        view.addSubview(num5)
        view.addSubview(passwordLabel)
        view.addSubview(passwordText)
        view.addSubview(passwordCheckLabel)
        view.addSubview(passwordCheckText)
        view.addSubview(nextBtn)
    }
    
    func makeConstraint(){
        num5.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckText.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            num5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            num5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num5.widthAnchor.constraint(equalToConstant: 25), num5.heightAnchor.constraint(equalToConstant: 25),
            passwordLabel.topAnchor.constraint(equalTo: num5.bottomAnchor, constant: 5),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordText.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordText.heightAnchor.constraint(equalToConstant: 45),
            
            passwordCheckLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 40),
            passwordCheckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordCheckText.topAnchor.constraint(equalTo: passwordCheckLabel.bottomAnchor, constant: 10),
            passwordCheckText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordCheckText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordCheckText.heightAnchor.constraint(equalToConstant: 45),
            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
             nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)])
        
    }
    var password: String = ""
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(touchNextBtn(_:)), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    @objc func touchNextBtn(_:UIButton){
        var passwordSame : String = ""
        if let passwordText = passwordText.text{
            password = passwordText
        }
        if let passwordSameText = passwordCheckText.text{
            passwordSame = passwordSameText
        }
        let checkOne: Bool = passwordCheck()
        if (checkOne){
            return
        }
        if (password != passwordSame){
            passwordCheckLabel.textColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            return
        }else{
            passwordCheckLabel.textColor = .black
            UserDefaults.standard.set(password, forKey: "password")

            // 데이터 동기화
            UserDefaults.standard.synchronize()
            nextView()
        }
    }
    @objc func passwordCheck()->Bool{
        if (password == ""){
            passwordLabel.textColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            return true
        }
        else{
            passwordLabel.textColor = .black
            return false
        }
    }
    
    @objc func nextView(){
        let loginSuccessVC = LoginSuccessVC()
        self.navigationController?.pushViewController(loginSuccessVC, animated: true)
    }
    
    
}
