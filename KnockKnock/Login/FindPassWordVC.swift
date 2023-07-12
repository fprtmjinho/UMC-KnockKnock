//
//  FindPassWordVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/12.
//

import UIKit
class FindPassWordVC : UIViewController{
    
    let emailLabel : UILabel = {
       let label = UILabel()
        label.text = "이메일 계정"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let emailText : UITextField = {
        let text = UITextField()
        text.placeholder = "이메일 입력"
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 20
        text.addLeftPadding()
        text.clearButtonMode = .whileEditing
        return text
    }()
    
    let emailBtn : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        btn.layer.cornerRadius = 20
        btn.setTitle("인증번호 요청", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
    }()
    
    let emailCheckLabel : UILabel = {
       let label = UILabel()
        label.text = "인증번호"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let emailCheckText : UITextField = {
        let text = UITextField()
        text.placeholder = "인증번호를 입력하세요"
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 20
        text.addLeftPadding()
        text.clearButtonMode = .whileEditing
        return text
    }()
    
    let emailCheckBtn : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 20
        btn.setTitle("인증번호 확인", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
    }()
    //인증번호 입력하면 색 변경
    
    
    let findBtn : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        btn.setTitle("비밀번호 찾기", for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    func makeSubView(){
        view.addSubview(emailLabel)
        view.addSubview(emailText)
        view.addSubview(emailBtn)
        view.addSubview(emailCheckLabel)
        view.addSubview(emailCheckText)
        view.addSubview(emailCheckBtn)
        view.addSubview(findBtn)
    }
    
    func makeConstraint(){
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailBtn.translatesAutoresizingMaskIntoConstraints = false
        emailCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        emailCheckText.translatesAutoresizingMaskIntoConstraints = false
        emailCheckBtn.translatesAutoresizingMaskIntoConstraints = false
        findBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailText.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 7),
            emailText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailText.heightAnchor.constraint(equalToConstant: 40),
            emailText.widthAnchor.constraint(equalToConstant: 220),
            
            emailBtn.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 7),
            emailBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailBtn.heightAnchor.constraint(equalToConstant: 40),
            emailBtn.widthAnchor.constraint(equalTo: emailText.widthAnchor, multiplier: 0.4),
            
            emailCheckLabel.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 40),
            emailCheckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailCheckText.topAnchor.constraint(equalTo: emailCheckLabel.bottomAnchor, constant: 7),
            emailCheckText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailCheckText.heightAnchor.constraint(equalToConstant: 40),
            emailCheckText.widthAnchor.constraint(equalToConstant: 220),
            
            emailCheckBtn.topAnchor.constraint(equalTo: emailCheckLabel.bottomAnchor, constant: 7),
            emailCheckBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailCheckBtn.heightAnchor.constraint(equalToConstant: 40),
            emailCheckBtn.widthAnchor.constraint(equalTo: emailCheckText.widthAnchor, multiplier: 0.4),
            
            
            findBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            findBtn.heightAnchor.constraint(equalToConstant: 50),
            findBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            findBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            
        ])
        
    }
    
    func makeAddTarget(){
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.navigationController?.isNavigationBarHidden = false
        self.title = "비밀번호 찾기"
        view.backgroundColor = .white
        
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
}
