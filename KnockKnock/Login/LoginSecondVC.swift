//
//  LoginSecondVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
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
    
    let emailAlertLabel: UILabel = {
       let emailAlertLabel = UILabel()
        emailAlertLabel.text = "이메일을 입력해주세요."
        emailAlertLabel.textColor = .white
        emailAlertLabel.font = UIFont.boldSystemFont(ofSize: 14)
        return emailAlertLabel
    }()
    
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
        fourthText1.placeholder = "6자리 이상 입력해주세요."
        fourthText1.backgroundColor = .systemGray6
        fourthText1.layer.cornerRadius = 20
        fourthText1.addLeftPadding()
        fourthText1.clearButtonMode = .whileEditing
        fourthText1.isSecureTextEntry = true
        return fourthText1
    }()
    //글자 수 6개 이상이어야 통과하도록 수정해야 함
    
    let passwordAlertLabel: UILabel = {
       let passwordAlertLabel = UILabel()
        passwordAlertLabel.text = "비밀번호를 입력해주세요."
        passwordAlertLabel.textColor = .white
        passwordAlertLabel.font = UIFont.boldSystemFont(ofSize: 14)
        return passwordAlertLabel
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
        fourthText2.placeholder = "다시 한번 입력해주세요."
        fourthText2.backgroundColor = .systemGray6
        fourthText2.layer.cornerRadius = 20
        fourthText2.addLeftPadding()
        fourthText2.clearButtonMode = .whileEditing
        fourthText2.isSecureTextEntry = true
        return fourthText2
    }()
    
    let passwordCheckAlertLabel: UILabel = {
       let passwordCheckAlertLabel = UILabel()
        passwordCheckAlertLabel.text = "비밀번호를 재입력해주세요."
        passwordCheckAlertLabel.textColor = .white
        passwordCheckAlertLabel.font = UIFont.boldSystemFont(ofSize: 14)
        return passwordCheckAlertLabel
    }()
    
    let lastLabel : UILabel = {
        let label = UILabel()
        label.text = "다음이 마지막 단계입니다!"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    
    var email: String = ""
    var password: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
    
    }

extension LoginSecondVC {
    func makeSubView(){
        view.addSubview(num4)
        view.addSubview(emailLabel)
        view.addSubview(emailText)
        view.addSubview(emailAlertLabel)
        view.addSubview(num5)
        view.addSubview(passwordLabel)
        view.addSubview(passwordText)
        view.addSubview(passwordAlertLabel)
        view.addSubview(passwordCheckLabel)
        view.addSubview(passwordCheckText)
        view.addSubview(passwordCheckAlertLabel)
        view.addSubview(lastLabel)
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    func makeConstraint(){
        num4.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailAlertLabel.translatesAutoresizingMaskIntoConstraints = false
        num5.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordAlertLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckText.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckAlertLabel.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            num4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            num4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num4.widthAnchor.constraint(equalToConstant: 25),
            num4.heightAnchor.constraint(equalToConstant: 25),
            emailLabel.topAnchor.constraint(equalTo: num4.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailText.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailText.heightAnchor.constraint(equalToConstant: 45),
            emailAlertLabel.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 5),
            emailAlertLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            emailAlertLabel.heightAnchor.constraint(equalToConstant: 17),
            
            num5.topAnchor.constraint(equalTo: emailAlertLabel.bottomAnchor, constant: 30),
            num5.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -10),
            num5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num5.widthAnchor.constraint(equalToConstant: 25),
            num5.heightAnchor.constraint(equalToConstant: 25),
            
            passwordLabel.bottomAnchor.constraint(equalTo: passwordText.topAnchor, constant: -10),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            passwordText.topAnchor.constraint(equalTo: view.centerYAnchor),
            passwordText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordText.heightAnchor.constraint(equalToConstant: 45),
            passwordAlertLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 5),
            passwordAlertLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            passwordAlertLabel.heightAnchor.constraint(equalToConstant: 17),
            
            passwordCheckLabel.topAnchor.constraint(equalTo: passwordAlertLabel.bottomAnchor, constant: 30),
            passwordCheckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordCheckText.topAnchor.constraint(equalTo: passwordCheckLabel.bottomAnchor, constant: 10),
            passwordCheckText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordCheckText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordCheckText.heightAnchor.constraint(equalToConstant: 45),
            passwordCheckAlertLabel.topAnchor.constraint(equalTo: passwordCheckText.bottomAnchor, constant: 5),
            passwordCheckAlertLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            passwordCheckAlertLabel.heightAnchor.constraint(equalToConstant: 17),
            
            lastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastLabel.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -10),
            
        ])
        
    }
    
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(touchNextBtn(_:)), for: .touchUpInside)
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
        
        
        var passwordSame : String = ""
        if let passwordText = passwordText.text{
            password = passwordText
        }
        if let passwordSameText = passwordCheckText.text{
            passwordSame = passwordSameText
        }
        let checkTwo : Bool = passwordCheck()
        if (checkTwo){
            return
        }
        if (password != passwordSame){
            passwordCheckText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            passwordCheckText.layer.borderWidth = 2
            passwordCheckAlertLabel.textColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            return
        }else{
            passwordCheckText.layer.borderWidth = 0
            passwordCheckAlertLabel.textColor = .white
            UserDefaults.standard.set(password, forKey: "password")
            
            // 데이터 동기화
            UserDefaults.standard.synchronize()
            nextView()
        }
    }
        
        //이메일이 빈칸이거나 형식이 틀리면 타이틀 강조 (@를 포함하지 않거나 다른 조건(추가해야함))
        func emailCheck()->Bool{
            if(email == "" || !email.contains("@")){
                emailText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
                emailText.layer.borderWidth = 2
                emailAlertLabel.textColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
                return true
            }
            else{
                emailText.layer.borderWidth = 0
                emailAlertLabel.textColor = .white
                return false
            }
        }
        
        
        func passwordCheck()->Bool{
            if (password == ""){
                passwordText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
                passwordText.layer.borderWidth = 2
                passwordAlertLabel.textColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
                return true
            }
            else{
                passwordText.layer.borderWidth = 0
                passwordAlertLabel.textColor = .white
                return false
            }
        }
        
    @objc func nextView(){
        let allowApproachVC = AllowApproachVC()
        self.navigationController?.pushViewController(allowApproachVC, animated: true)
    }
}
