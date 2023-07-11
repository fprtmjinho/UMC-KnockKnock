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
        fourthText1.placeholder = "6자리 이상 입력해 주세요."
        fourthText1.backgroundColor = .systemGray6
        fourthText1.layer.cornerRadius = 20
        fourthText1.addLeftPadding()
        fourthText1.clearButtonMode = .whileEditing
        fourthText1.isSecureTextEntry = true
        return fourthText1
    }()
    //글자 수 6개 이상이어야 통과하도록 수정해야 함
    
    
    let passwordCheckLabel: UILabel = {
        let fourthlabel2 = UILabel()
        fourthlabel2.text = "비밀번호 확인"
        fourthlabel2.font = UIFont.boldSystemFont(ofSize: 20)
        return fourthlabel2
        
        //fourthLabel1에서 비밀번호 입력 되어야 활성화, 색 변경
    }()
    
    let passwordCheckText: UITextField = {
        let fourthText2 = UITextField()
        fourthText2.placeholder = "다시 한번 입력해 주세요."
        fourthText2.backgroundColor = .systemGray6
        fourthText2.layer.cornerRadius = 20
        fourthText2.addLeftPadding()
        fourthText2.clearButtonMode = .whileEditing
        fourthText2.isSecureTextEntry = true
        return fourthText2
    }()
    
    let lastLabel : UILabel = {
        let label = UILabel()
        label.text = "다음이 마지막 단계입니다!"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
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
        view.addSubview(lastLabel)
        view.addSubview(nextBtn)
    }
    
    func makeConstraint(){
        num5.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckText.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
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
            
            lastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastLabel.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -10),
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
            passwordCheckText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            passwordCheckText.layer.borderWidth = 2
            return
        }else{
            passwordCheckText.layer.borderWidth = 0
            UserDefaults.standard.set(password, forKey: "password")

            // 데이터 동기화
            UserDefaults.standard.synchronize()
            nextView()
        }
    }
    @objc func passwordCheck()->Bool{
        if (password == ""){
            passwordText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            passwordText.layer.borderWidth = 2
            return true
        }
        else{
            passwordText.layer.borderWidth = 0
            return false
        }
    }
    
    @objc func nextView(){
        let allowApproachVC = AllowApproachVC()
        self.navigationController?.pushViewController(allowApproachVC, animated: true)
    }
    
    
}
