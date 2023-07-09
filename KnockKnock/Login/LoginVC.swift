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
        
        let EmailButton : UITextField = {
            let emailBtn = UITextField()
            emailBtn.placeholder = "이메일 주소"
            //padding 설정 해야 함
            emailBtn.backgroundColor = .systemGray6
            emailBtn.layer.cornerRadius = 25
            //모서리 둥글게
            emailBtn.clearButtonMode = .whileEditing
            emailBtn.leftViewMode = .always
            emailBtn.addLeftPadding()

            //clear모드 설정
            return emailBtn
        }()
        
        let PasswordButton : UITextField = {
            let passwordBtn = UITextField()
            passwordBtn.placeholder = "비밀번호"
            //padding 설정 해야 함
            passwordBtn.backgroundColor = .systemGray6
            passwordBtn.layer.cornerRadius = 25
            passwordBtn.clearButtonMode = .whileEditing
            passwordBtn.isSecureTextEntry = true
            passwordBtn.addLeftPadding()
            
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
            kakao.layer.cornerRadius = 32
            //둥근 모양 설정
            
            kakao.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            kakao.setImage(Image.kakaoIMG, for: .normal)
            return kakao
        }()
        
        let ForFaceBtn : UIButton = {
           let face = UIButton()
            face.layer.cornerRadius = 32
            face.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            face.setImage(Image.facebookIMG, for: .normal)
            //아이콘 수정 필요 -> 세 아이콘 모두
            return face
        }()
        
        let ForGoogleBtn : UIButton = {
            let google = UIButton()
            google.layer.cornerRadius = 32
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
        let EnterNew : UIButton = {
           let enternew = UIButton()
            enternew.setTitle("가입하기", for: .normal)
            enternew.setTitleColor(.systemGray, for: .normal)
            enternew.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            enternew.setUnderLine()
            return enternew
        }()
    func makeConstraint(){
        Title.translatesAutoresizingMaskIntoConstraints = false
        EmailButton.translatesAutoresizingMaskIntoConstraints = false
        LoginButton.translatesAutoresizingMaskIntoConstraints = false
        PasswordButton.translatesAutoresizingMaskIntoConstraints = false
        ForgetPassword.translatesAutoresizingMaskIntoConstraints = false
        
        ForKakaoBtn.translatesAutoresizingMaskIntoConstraints = false
        ForFaceBtn.translatesAutoresizingMaskIntoConstraints = false
        ForGoogleBtn.translatesAutoresizingMaskIntoConstraints = false
        EasyLogin.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_1.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_2.translatesAutoresizingMaskIntoConstraints = false
        NotYet.translatesAutoresizingMaskIntoConstraints = false
        EnterNew.translatesAutoresizingMaskIntoConstraints = false
            
            
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            Title.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Title.heightAnchor.constraint(equalToConstant: 80),
            
            EmailButton.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 80),
            EmailButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            EmailButton.widthAnchor.constraint(equalToConstant: 330),
            EmailButton.heightAnchor.constraint(equalToConstant: 50),
            PasswordButton.topAnchor.constraint(equalTo: EmailButton.bottomAnchor, constant: 10),
            PasswordButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            PasswordButton.widthAnchor.constraint(equalToConstant: 330),
            PasswordButton.heightAnchor.constraint(equalToConstant: 50),
            LoginButton.topAnchor.constraint(equalTo: PasswordButton.bottomAnchor, constant: 20),
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
            EnterNew.topAnchor.constraint(equalTo: ForFaceBtn.bottomAnchor, constant: 55),
            EnterNew.leadingAnchor.constraint(equalTo: NotYet.trailingAnchor, constant: 5),
            EnterNew.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -90)
        ])
            
        
    }
    func makeSubView(){
        view.addSubview(Title)
                
        view.addSubview(EmailButton)
        view.addSubview(PasswordButton)
        view.addSubview(LoginButton)
        view.addSubview(ForgetPassword)
        
        view.addSubview(ForKakaoBtn)
        view.addSubview(ForFaceBtn)
        view.addSubview(ForGoogleBtn)
            
        view.addSubview(EasyLogin)
        view.addSubview(LoginGuide_1)
        view.addSubview(LoginGuide_2)
            
        view.addSubview(NotYet)
        view.addSubview(EnterNew)
    }
    func buttonClick(){
        self.LoginButton.addTarget(self, action: #selector(loginFunc(_:)), for: .touchUpInside)
        self.EnterNew.addTarget(self, action: #selector(signUpFunc(_:)), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
    }
    @objc func loginFunc(_:UIButton){
        let mainPage = mainPage()
        self.navigationController?.pushViewController(mainPage, animated: true)
    }
    
    @objc func signUpFunc(_:UIButton){
        let loginFirstVC = LoginFirstVC()
        self.navigationController?.pushViewController(loginFirstVC, animated: true)
    }
        
}




extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
        
extension UIButton {
    func setUnderLine(){
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: title.count)
                        )
        setAttributedTitle(attributedString, for: .normal)
    }
}


    
    
    

