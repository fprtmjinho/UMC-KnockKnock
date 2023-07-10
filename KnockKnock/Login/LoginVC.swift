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
            emailBtn.layer.cornerRadius = 25
            //모서리 둥글게
            emailBtn.clearButtonMode = .whileEditing
            //clear모드 설정
            return emailBtn
        }()
        
        let PasswordText : UITextField = {
            let passwordBtn = UITextField()
            passwordBtn.placeholder = "비밀번호"
            passwordBtn.addLeftPadding()
            passwordBtn.backgroundColor = .systemGray6
            passwordBtn.layer.cornerRadius = 25
            passwordBtn.clearButtonMode = .whileEditing
            passwordBtn.isSecureTextEntry = true
            return passwordBtn
        }()
        
        let LoginButton : UIButton={
            let loginBtn = UIButton()
            loginBtn.setTitle("로그인", for: .normal)
            loginBtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            loginBtn.layer.cornerRadius = 25
            loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            return loginBtn
        }()
        
        let ForgetPassword : UIButton = {
            let FpBtn =  UIButton()
           FpBtn.setTitle("비밀번호를 잊으셨나요?", for: .normal)
            FpBtn.setTitleColor(UIColor.systemGray, for: .normal)
            FpBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
           
            FpBtn.setUnderLine()
            //setUnderLine extension으로 설정
            
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
            let kakao = UIButton()
            kakao.layer.cornerRadius = 32.5
            
            kakao.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            kakao.setImage(Image.kakaoIMG, for: .normal)
            return kakao
        }()
        
        let ForFaceBtn : UIButton = {
           let face = UIButton()
            face.layer.cornerRadius = 32.5
            face.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            face.setImage(Image.facebookIMG, for: .normal)
            //아이콘 수정 필요 -> 세 아이콘 모두
            return face
        }()
        
        let ForGoogleBtn : UIButton = {
            let google = UIButton()
            google.layer.cornerRadius = 32.5
            google.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            google.setImage(Image.googleIMG, for: .normal)
            return google
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
        ForFaceBtn.translatesAutoresizingMaskIntoConstraints = false
        ForGoogleBtn.translatesAutoresizingMaskIntoConstraints = false
        EasyLogin.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_1.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_2.translatesAutoresizingMaskIntoConstraints = false
        NotYet.translatesAutoresizingMaskIntoConstraints = false
        SignUp.translatesAutoresizingMaskIntoConstraints = false
            
            
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            Title.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Title.heightAnchor.constraint(equalToConstant: 80),
            
            EmailText.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 80),
            EmailText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            EmailText.widthAnchor.constraint(equalToConstant: 330),
            EmailText.heightAnchor.constraint(equalToConstant: 50),
            PasswordText.topAnchor.constraint(equalTo: EmailText.bottomAnchor, constant: 10),
            PasswordText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            PasswordText.widthAnchor.constraint(equalToConstant: 330),
            PasswordText.heightAnchor.constraint(equalToConstant: 50),
            LoginButton.topAnchor.constraint(equalTo: PasswordText.bottomAnchor, constant: 20),
            LoginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            LoginButton.widthAnchor.constraint(equalToConstant: 330),
            LoginButton.heightAnchor.constraint(equalToConstant: 50),
            ForgetPassword.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 20),
            ForgetPassword.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ForgetPassword.widthAnchor.constraint(equalToConstant: 180),
            ForgetPassword.heightAnchor.constraint(equalToConstant: 20),
                
            
            ForFaceBtn.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 130),
            ForFaceBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ForFaceBtn.widthAnchor.constraint(equalToConstant: 65),
            ForFaceBtn.heightAnchor.constraint(equalToConstant: 65),

            ForKakaoBtn.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 130),
            ForKakaoBtn.trailingAnchor.constraint(equalTo: ForFaceBtn.leadingAnchor, constant: -20),
            ForKakaoBtn.widthAnchor.constraint(equalToConstant: 65),
            ForKakaoBtn.heightAnchor.constraint(equalToConstant: 65),

            ForGoogleBtn.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 130),
            ForGoogleBtn.leadingAnchor.constraint(equalTo: ForFaceBtn.trailingAnchor, constant: 20),
            ForGoogleBtn.widthAnchor.constraint(equalToConstant: 65),
            ForGoogleBtn.heightAnchor.constraint(equalToConstant: 65),
                
                
            EasyLogin.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            EasyLogin.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 90),
            LoginGuide_1.trailingAnchor.constraint(equalTo: EasyLogin.leadingAnchor, constant: -20),
            LoginGuide_1.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 100),
            LoginGuide_1.heightAnchor.constraint(equalToConstant: 1),
            LoginGuide_1.widthAnchor.constraint(equalToConstant: 105),
            LoginGuide_2.leadingAnchor.constraint(equalTo: EasyLogin.trailingAnchor, constant: 20),
            LoginGuide_2.topAnchor.constraint(equalTo: ForgetPassword.bottomAnchor, constant: 100),
            LoginGuide_2.heightAnchor.constraint(equalToConstant: 1),
            LoginGuide_2.widthAnchor.constraint(equalToConstant: 105),
                
                
            NotYet.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90),
            NotYet.topAnchor.constraint(equalTo: ForFaceBtn.bottomAnchor, constant: 55),
            SignUp.topAnchor.constraint(equalTo: ForFaceBtn.bottomAnchor, constant: 55),
            SignUp.leadingAnchor.constraint(equalTo: NotYet.trailingAnchor, constant: 5),
            SignUp.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -90)
        ])
            
        
    }
    func makeSubView(){
        view.addSubview(Title)
                
        view.addSubview(EmailText)
        view.addSubview(PasswordText)
        view.addSubview(LoginButton)
        view.addSubview(ForgetPassword)
        
        view.addSubview(ForKakaoBtn)
        view.addSubview(ForFaceBtn)
        view.addSubview(ForGoogleBtn)
            
        view.addSubview(EasyLogin)
        view.addSubview(LoginGuide_1)
        view.addSubview(LoginGuide_2)
            
        view.addSubview(NotYet)
        view.addSubview(SignUp)
}
    
    func makeAddTarget(){
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
        
    }
    @objc func loginSuccess(_: UIButton){
        //로그인 성공여부 판별하는 로직 짜야함(서버랑 얘기하고 구현)
//        if(){
//            nextView()
//        }else{
//            return
//        }
    }
    @objc func nextView(){
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
        
        //시작 버튼 누르면 tabbarcontroller로 이동
        //방식 수정 필요
        
    }
    @objc func signUpFunc(_:UIButton){
        let LoginNavigationController = UINavigationController(rootViewController: LoginFirstVC())
        
        LoginNavigationController.modalPresentationStyle = .fullScreen
        self.present(LoginNavigationController, animated: true, completion: nil)
        
    }
        
    }





        



    
    
    

