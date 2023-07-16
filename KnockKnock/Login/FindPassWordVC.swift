//
//  FindPassWordVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/12.
//

import UIKit
class FindPasswordVC : UIViewController{
    
    var nextBtn : UIButton = UIButton()
    
    let emailLabel : UILabel = {
       let label = UILabel()
        label.text = "이메일 계정"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let emailText : UITextField = {
        let text = UITextField()
        text.placeholder = "이메일을 입력해주세요"
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 20
        text.addLeftPadding()
        text.clearButtonMode = .whileEditing
        return text
    }()
    
    let emailBtn : UIButton = {
       let btn = UIButton()
        var title = AttributedString("이메일로 인증코드 보내기")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .semibold)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.baseBackgroundColor = .systemGray6
        config.baseForegroundColor = .systemGray
        config.cornerStyle = .capsule
        btn.configuration = config
        return btn
    }()
    
    let emailCheckLabel : UILabel = {
       let label = UILabel()
        label.text = "인증코드"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let emailCheckText : UITextField = {
        let text = UITextField()
        text.placeholder = "인증코드를 입력해주세요"
        text.backgroundColor = .systemGray6
        text.layer.cornerRadius = 20
        text.addLeftPadding()
        text.clearButtonMode = .whileEditing
        return text
    }()
    
    let emailCheckBtn : UIButton = {
       let btn = UIButton()
        var title = AttributedString("확인하기")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .semibold)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.baseBackgroundColor = .systemGray6
        config.baseForegroundColor = .systemGray
        config.cornerStyle = .capsule
        btn.configuration = config
        return btn
    }()
    //인증번호 입력하면 색 변경

    func makeSubView(){
        view.addSubview(emailLabel)
        view.addSubview(emailText)
        view.addSubview(emailBtn)
        view.addSubview(emailCheckLabel)
        view.addSubview(emailCheckText)
        view.addSubview(emailCheckBtn)
     
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    func makeConstraint(){
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailBtn.translatesAutoresizingMaskIntoConstraints = false
        emailCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        emailCheckText.translatesAutoresizingMaskIntoConstraints = false
        emailCheckBtn.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailText.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 7),
            emailText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailText.heightAnchor.constraint(equalToConstant: 40),
            emailText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            emailBtn.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 7),
            emailBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailBtn.heightAnchor.constraint(equalToConstant: 40),
            
            emailCheckLabel.topAnchor.constraint(equalTo: emailBtn.bottomAnchor, constant: 40),
            emailCheckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            emailCheckText.topAnchor.constraint(equalTo: emailCheckLabel.bottomAnchor, constant: 7),
            emailCheckText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailCheckText.heightAnchor.constraint(equalToConstant: 40),
            emailCheckText.widthAnchor.constraint(equalToConstant: 220),
            
            
            emailCheckBtn.topAnchor.constraint(equalTo: emailCheckLabel.bottomAnchor, constant: 7),
            emailCheckBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            emailCheckBtn.heightAnchor.constraint(equalToConstant: 40),
            emailCheckBtn.leadingAnchor.constraint(equalTo: emailCheckText.trailingAnchor, constant: 5)
         
        ])
        
    }
    
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(touchNextBtn(_:)), for: .touchUpInside)
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
    
    var emailForCode : String = ""
    var code : String = ""
    
    
    @objc func touchNextBtn(_: UIButton){
        
        if let emailtext = emailText.text{
            emailForCode = emailtext
        }
        if let codetext = emailCheckText.text{
            code = codetext
        }
        
        let checkOne: Bool = emailCheck()
        let checkTwo: Bool = codeCheck()
        if(checkOne||checkTwo){
            return
        }
        
        // 데이터 저장
        //UserDefaults.standard.set(emailForCode, forKey: "email")
        //UserDefaults.standard.set(code, forKey: "code")

        // 데이터 동기화
        UserDefaults.standard.synchronize()
        
        nextView()
        //인증 완료해야 다음 버튼 활성화
    }
    
    //emailCheck
    func emailCheck() -> Bool{
        if(emailForCode == ""){
            emailBtn.configuration?.baseBackgroundColor = .systemGray6
            emailBtn.configuration?.baseForegroundColor = .systemGray
        }
        else{
            emailBtn.configuration?.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            emailBtn.configuration?.baseForegroundColor = .white
        }
   
    }
    
    //codeCheck
    func codeCheck() -> Bool{
        if(code == ""){
            //코드 입력 전
            emailCheckBtn.configuration?.baseBackgroundColor = .systemGray6
            emailCheckBtn.configuration?.baseForegroundColor = .systemGray
            
        }
        else{
            //코드가 일치하면
            emailCheckBtn.configuration?.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            emailCheckBtn.configuration?.baseForegroundColor = .white
        }
        
    }
    
    
    @objc func nextView(){
        let toChangePasswordVC = ToChangePasswordVC()
        self.navigationController?.pushViewController(toChangePasswordVC, animated: true)
    }
    
    
    
}
