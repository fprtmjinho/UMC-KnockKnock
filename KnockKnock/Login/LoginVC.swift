//
//  LoginVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
class LoginVC : UIViewController {
    
    let loginURLString = "http://\(Server.url)/member/login"
    
    let Title : UIImageView = UIImageView(image: UIImage(named: "title"))
    
    let EmailText : UITextField = {
        let emailBtn = UITextField()
        emailBtn.placeholder = "이메일 주소"
        emailBtn.backgroundColor = .systemGray6
        
        let emailimage = UIImage(named: "mail")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        emailBtn.addLeftImage(image: emailimage!)
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
        
        let passwordimage = UIImage(named: "key")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        passwordBtn.addLeftImage(image: passwordimage!)
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
    
    
    
    let naverBtn : UIButton = {
        let btn = UIButton()
        var title = AttributedString("네이버로 간편로그인하기")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .light)
        var config = UIButton.Configuration.plain()
        config.attributedTitle = title
        config.background.strokeColor = #colorLiteral(red: 0.131085664, green: 0.8754685521, blue: 0.2015054226, alpha: 1)
        config.baseForegroundColor = .black
        config.cornerStyle = .capsule
        let naverimage = UIImage(named: "naverIcon")!.resizeImageTo(size: CGSize(width: 20, height: 20))
        config.image = naverimage
        config.imagePadding = 10
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
    let userNotiCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        handleEditFunc()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        requestAuthNoti()
        requestSendNoti(seconds: 3)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func findPasswordFunc(_: UIButton){
        let findPasswordVC = FindPasswordVC()
        self.navigationController?.pushViewController(findPasswordVC, animated: true)
    }
    
    @objc func loginSuccess(_: UIButton){
        // 이메일과 비밀번호 유효성 검사
        let isEmailValid = isEmailValidFormat(email: EmailText.text)
        let isPasswordValid = isPasswordValidFormat(password: PasswordText.text)
        
        let loginRequestBody = LoginRequestBody(email: EmailText.text!, password: PasswordText.text!)
        
        guard let url = URL(string: loginURLString) else {
            showAlert(message: "서버 URL을 만들 수 없습니다.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(loginRequestBody)
            request.httpBody = jsonData
        } catch {
            showAlert(message: "JSON 인코딩에 실패하였습니다.")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                self.showAlert(message: "응답 데이터를 받아오지 못했습니다.")
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                
                if loginResponse.message == "로그인 성공" {
                    
                    DispatchQueue.main.async {
                        
                        guard let httpResponse = response as? HTTPURLResponse,
                              let headers = httpResponse.allHeaderFields as? [String: String] else {
                            return
                        }
                        
                        // 헤더에서 토큰 가져오기
                        let accessToken = headers["Authorization"]!
                        let refreshToken = headers["Refresh-Token"]!
                        print(accessToken)
                        UserDefaults.standard.set(accessToken, forKey: "Authorization")
                        UserDefaults.standard.set(refreshToken, forKey: "Refresh-Token")
                        
                        // User 정보를 가져오기 위한 URL
                        let userURLString = "http://\(Server.url)/member"
                        
                            guard let userURL = URL(string: userURLString) else {
                                self.showAlert(message: "유저 정보를 가져올 수 없습니다.")
                                return
                            }

                            var userRequest = URLRequest(url: userURL)
                            userRequest.httpMethod = "GET"
                            userRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
                            URLSession.shared.dataTask(with: userRequest) { data, response, error in
                                
                                guard let data = data else {
                                    self.showAlert(message: "유저 정보를 받아오지 못했습니다.")
                                    return
                                }
                                do {
                                    let user = try JSONDecoder().decode(User.self, from: data)
                                    print("유저 정보: \(user)")
                                    var me = MyData.shared
                                    me.name = user.nickName
                                    me.profileImageUrl = user.profileImageUrl
                                } catch {
                                    self.showAlert(message: "유저 정보 디코딩에 실패하였습니다.")
                                }
                            }.resume()
                        
                        let tabBarController = TabBarController()
                        tabBarController.modalPresentationStyle = .fullScreen
                        self.present(tabBarController, animated: true, completion: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.showAlert(message: "로그인에 실패하였습니다.")
                    }
                }
            } catch {
                self.showAlert(message: "JSON 디코딩에 실패하였습니다.")
            }
        }.resume()
        
    }
    
    
    @objc func signUpFunc(_:UIButton){
        let loginFirstVC = LoginFirstVC()
        
        self.navigationController?.pushViewController(loginFirstVC, animated: true)
    }
    
}


extension LoginVC {
    func makeSubView(){
        view.addSubview(Title)
        
        view.addSubview(EmailText)
        view.addSubview(PasswordText)
        view.addSubview(LoginButton)
        view.addSubview(ForgetPassword)
        view.addSubview(naverBtn)
        
        view.addSubview(EasyLogin)
        view.addSubview(LoginGuide_1)
        view.addSubview(LoginGuide_2)
        
        view.addSubview(NotYet)
        view.addSubview(SignUp)
    }
    
    func makeConstraint(){
        Title.translatesAutoresizingMaskIntoConstraints = false
        EmailText.translatesAutoresizingMaskIntoConstraints = false
        LoginButton.translatesAutoresizingMaskIntoConstraints = false
        PasswordText.translatesAutoresizingMaskIntoConstraints = false
        ForgetPassword.translatesAutoresizingMaskIntoConstraints = false
        naverBtn.translatesAutoresizingMaskIntoConstraints = false
        EasyLogin.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_1.translatesAutoresizingMaskIntoConstraints = false
        LoginGuide_2.translatesAutoresizingMaskIntoConstraints = false
        NotYet.translatesAutoresizingMaskIntoConstraints = false
        SignUp.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            Title.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            Title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85),
            Title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85),
            Title.heightAnchor.constraint(equalToConstant: 30),
            
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
            
            naverBtn.topAnchor.constraint(equalTo: EasyLogin.bottomAnchor, constant: 20),
            naverBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            naverBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            naverBtn.heightAnchor.constraint(equalToConstant: 50),
            
            NotYet.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            NotYet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            SignUp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            SignUp.leadingAnchor.constraint(equalTo: NotYet.trailingAnchor),
            SignUp.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80)
        ])
    }
    
    func makeAddTarget(){
        self.ForgetPassword.addTarget(self, action: #selector(findPasswordFunc(_:)), for: .touchUpInside)
        self.SignUp.addTarget(self, action: #selector(signUpFunc(_:)), for: .touchUpInside)
        self.LoginButton.addTarget(self, action: #selector(loginSuccess(_:)), for: .touchUpInside)
        //회원가입 뷰로 이동
        self.naverBtn.addTarget(self, action: #selector(easyLoginfunc(_:)), for: .touchUpInside)
        
    }
    
    @objc func easyLoginfunc(_:UIButton){
        //간편 로그인
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        // 메시지 폰트 사이즈 설정
        let attributedMessage = NSMutableAttributedString(string: message)
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        attributedMessage.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedMessage.length))
        
        let fontSize: CGFloat = 16
        attributedMessage.addAttribute(.font, value: UIFont.systemFont(ofSize: fontSize), range: NSRange(location: 0, length: attributedMessage.length))
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func isEmailValidFormat(email: String?) -> Bool {
        guard let email = email else { return false }
        return email.contains("@")
    }
    
    func isPasswordValidFormat(password: String?) -> Bool {
        guard let password = password else { return false }
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
}
extension LoginVC{
    // 알림 권한 설정
    func requestAuthNoti() {
        let notiAuthOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        userNotiCenter.requestAuthorization(options: notiAuthOptions) { (success, error) in
            guard success else {return}
            //self.requestSendNoti(seconds: 3)
        }
    }
    // 알림 전송
    func requestSendNoti(seconds: Double) {
        let notiContent = UNMutableNotificationContent()
        notiContent.title = "'KnockKnock'에서 알림을 보내고자 합니다."
        notiContent.body = "경고, 사운드 및 아이콘 배지가 알림에 포함될 수 있습니다. 설정에서 이를 구성할 수 있습니다."
        notiContent.userInfo = ["targetScene": "LoginVC"] // 푸시 받을때 오는 데이터

        // 알림이 trigger되는 시간 설정
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: notiContent,
            trigger: trigger
        )

        userNotiCenter.add(request) { (error) in
            print(#function, error)
        }
    }
}
