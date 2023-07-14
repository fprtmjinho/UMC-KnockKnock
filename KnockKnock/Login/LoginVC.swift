//
//  LoginVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
class LoginVC : UIViewController {

        
        let Title : UILabel = {
           let title = UILabel()
            title.text = "knock knock"
            //글씨체 수정 필요
            title.textColor = #colorLiteral(red: 1, green: 0.1743352413, blue: 0.4743140936, alpha: 1)
            title.font = UIFont.boldSystemFont(ofSize: 40)
            
            return title
        }()
        
        let EmailText : UITextField = {
            let emailBtn = UITextField()
            emailBtn.placeholder = "이메일 주소"
            emailBtn.addLeftPadding()
            emailBtn.backgroundColor = .systemGray6
            emailBtn.layer.cornerRadius = 20
            //모서리 둥글게
            emailBtn.clearButtonMode = .whileEditing
            //clear모드 설정
            return emailBtn
        }()
    //image 첨부 필요
        
        let PasswordText : UITextField = {
            let passwordBtn = UITextField()
            passwordBtn.placeholder = "비밀번호"
            passwordBtn.addLeftPadding()
            passwordBtn.backgroundColor = .systemGray6
            passwordBtn.layer.cornerRadius = 20
            passwordBtn.clearButtonMode = .whileEditing
            passwordBtn.isSecureTextEntry = true
            return passwordBtn
        }()
    //image 첨부 필요
        
        let LoginButton : UIButton={
            let btn = UIButton()
            var title = AttributedString("로그인")
            title.font = UIFont.boldSystemFont(ofSize: 20)
            
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .capsule
            config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            config.attributedTitle = title
            
            btn.configuration = config
            return btn
        }()
        
        let ForgetPassword : UIButton = {
            let FpBtn =  UIButton()
           FpBtn.setTitle("비밀번호를 잊으셨나요?", for: .normal)
            FpBtn.setTitleColor(UIColor.systemGray, for: .normal)
            FpBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
           
            FpBtn.setUnderLine()
           
            return FpBtn
        }()
        
        let EasyLogin : UITextField = {
           let easylogin = UITextField()
            easylogin.text = "간편 로그인"
            easylogin.textColor = .systemGray
            easylogin.font = UIFont.systemFont(ofSize: 15)
            return easylogin
        }()
        
        let LoginGuide_1 : UIView = {
            let lineView = UIView()
            lineView.backgroundColor = .systemGray
            return lineView
        }()
        
        let LoginGuide_2 : UIView = {
            let lineView = UIView()
            lineView.backgroundColor = .systemGray
            return lineView
        }()
        
        
        
        let ForKakaoBtn : UIButton = {
            let btn = UIButton()
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .capsule
            config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            config.image = UIImage(named: "kakao talk")?.resizeImageTo(size: CGSize(width: 30, height: 30) )
            btn.configuration = config
            return btn
        }()
    
        
        let ForNaverBtn : UIButton = {
            let btn = UIButton()
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .capsule
            config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            config.image = UIImage(named: "naver")?.resizeImageTo(size: CGSize(width: 30, height: 30) )
            btn.configuration = config
            return btn
        }()
        
        let ForGoogleBtn : UIButton = {
            let btn = UIButton()
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .capsule
            config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            config.image = UIImage(named: "google")?.resizeImageTo(size: CGSize(width: 30, height: 30) )
            btn.configuration = config
            return btn
        }()
        
        let NotYet : UIButton = {
          let notyet = UIButton()
            notyet.setTitle("아직 회원이 아니신가요?", for: .normal)
            notyet.setTitleColor(.systemGray, for: .normal)
            notyet.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            return notyet
        }()
        let SignUp : UIButton = {
           let enternew = UIButton()
            enternew.setTitle("가입하기", for: .normal)
            enternew.setTitleColor(.systemGray, for: .normal)
            enternew.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            enternew.setUnderLine()
            return enternew
        }()
        
    func makeConstraint(){
        Title.translatesAutoresizingMaskIntoConstraints = false
        EmailText.translatesAutoresizingMaskIntoConstraints = false
        LoginButton.translatesAutoresizingMaskIntoConstraints = false
        PasswordText.translatesAutoresizingMaskIntoConstraints = false
        ForgetPassword.translatesAutoresizingMaskIntoConstraints = false
        ForKakaoBtn.translatesAutoresizingMaskIntoConstraints = false
        ForNaverBtn.translatesAutoresizingMaskIntoConstraints = false
        ForGoogleBtn.translatesAutoresizingMaskIntoConstraints = false
        EasyLogin.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_1.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_2.translatesAutoresizingMaskIntoConstraints = false
        NotYet.translatesAutoresizingMaskIntoConstraints = false
        SignUp.translatesAutoresizingMaskIntoConstraints = false
            
            
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            Title.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Title.heightAnchor.constraint(equalToConstant: 80),
            
            //y축 고정
            PasswordText.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            PasswordText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            PasswordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            PasswordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            EmailText.bottomAnchor.constraint(equalTo: PasswordText.topAnchor, constant: -10),
            EmailText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            EmailText.widthAnchor.constraint(equalTo: PasswordText.widthAnchor),
            EmailText.heightAnchor.constraint(equalTo: PasswordText.heightAnchor),
            EmailText.heightAnchor.constraint(equalToConstant: 45),
            
            
            LoginButton.topAnchor.constraint(equalTo: PasswordText.bottomAnchor, constant: 20),
            LoginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            LoginButton.widthAnchor.constraint(equalTo: EmailText.widthAnchor),
            LoginButton.heightAnchor.constraint(equalTo: EmailText.heightAnchor),
            
            
            ForgetPassword.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 20),
            ForgetPassword.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ForgetPassword.widthAnchor.constraint(equalToConstant: 180),
            ForgetPassword.heightAnchor.constraint(equalToConstant: 20),
            
            
            EasyLogin.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            EasyLogin.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 70),
            LoginGuide_1.trailingAnchor.constraint(equalTo: EasyLogin.leadingAnchor, constant: -20),
            LoginGuide_1.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 80),
            LoginGuide_1.heightAnchor.constraint(equalToConstant: 1),
            LoginGuide_1.widthAnchor.constraint(equalToConstant: 105),
            LoginGuide_2.leadingAnchor.constraint(equalTo: EasyLogin.trailingAnchor, constant: 20),
            LoginGuide_2.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 80),
            LoginGuide_2.heightAnchor.constraint(equalToConstant: 1),
            LoginGuide_2.widthAnchor.constraint(equalToConstant: 105),
            
            
            
          
            
            
            ForNaverBtn.topAnchor.constraint(equalTo: EasyLogin.bottomAnchor, constant: 20),
            ForNaverBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ForNaverBtn.widthAnchor.constraint(equalToConstant: 50),
            ForNaverBtn.heightAnchor.constraint(equalToConstant: 50),
            
            
            ForKakaoBtn.topAnchor.constraint(equalTo: EasyLogin.bottomAnchor, constant: 20),
            ForKakaoBtn.trailingAnchor.constraint(equalTo: ForNaverBtn.leadingAnchor, constant: -20),
            ForKakaoBtn.widthAnchor.constraint(equalTo : ForNaverBtn.widthAnchor),
            ForKakaoBtn.heightAnchor.constraint(equalTo : ForNaverBtn.heightAnchor),
                
            

            ForGoogleBtn.topAnchor.constraint(equalTo: EasyLogin.bottomAnchor, constant: 20),
            ForGoogleBtn.leadingAnchor.constraint(equalTo: ForNaverBtn.trailingAnchor, constant: 20),
            ForGoogleBtn.widthAnchor.constraint(equalTo : ForNaverBtn.widthAnchor),
            ForGoogleBtn.heightAnchor.constraint(equalTo : ForNaverBtn.heightAnchor),
                
                
                
                
            NotYet.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            NotYet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            SignUp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            SignUp.leadingAnchor.constraint(equalTo: NotYet.trailingAnchor),
            SignUp.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70)
        ])
            
        
    }
    func makeSubView(){
        view.addSubview(Title)
                
        view.addSubview(EmailText)
        view.addSubview(PasswordText)
        view.addSubview(LoginButton)
        view.addSubview(ForgetPassword)
        
        view.addSubview(ForKakaoBtn)
        view.addSubview(ForNaverBtn)
        view.addSubview(ForGoogleBtn)
            
        view.addSubview(EasyLogin)
        view.addSubview(LoginGuide_1)
        view.addSubview(LoginGuide_2)
            
        view.addSubview(NotYet)
        view.addSubview(SignUp)
}
    
    func makeAddTarget(){
        self.ForgetPassword.addTarget(self, action: #selector(findPasswordFunc(_:)), for: .touchUpInside)
        self.SignUp.addTarget(self, action: #selector(signUpFunc(_:)), for: .touchUpInside)
        self.LoginButton.addTarget(self, action: #selector(loginSuccess(_:)), for: .touchUpInside)
        //회원가입 뷰로 이동
        
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
      
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func findPasswordFunc(_: UIButton){
        let findPasswordVC = FindPasswordVC()
        navigationController?.pushViewController(findPasswordVC, animated: true)
    }
    
    @objc func loginSuccess(_: UIButton){
        //로그인 성공여부 판별하는 로직 짜야함(서버랑 얘기하고 구현)
//        if(){
//            nextView()
//        }else{
//            return
//        }
    }
  
    @objc func signUpFunc(_:UIButton){
        let loginFirstVC = LoginFirstVC()
        
        self.navigationController?.pushViewController(loginFirstVC, animated: true)
    }
        
    }









        



    
    
    

