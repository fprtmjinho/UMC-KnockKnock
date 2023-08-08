//
//  LoginSecondVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
class LoginSecondVC : UIViewController{
    
    var sendEmail: Bool = false // 인증코드 전송했는지 확인
    var emailAuthentication: Bool = false // 인증 여부
    
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
    
    
    let emailBtn : UIButton = {
        let btn = UIButton()
        var title = AttributedString("이메일로 인증코드 보내기")
        title.font =  UIFont.systemFont(ofSize: 15, weight: .semibold)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
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
        config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        btn.configuration = config
        return btn
    }()
    
    
    var email: String = ""
    var emailForCode : String = ""
    var code : String = ""
    
    
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
        view.addSubview(emailBtn)
        view.addSubview(emailCheckLabel)
        view.addSubview(emailCheckText)
        view.addSubview(emailCheckBtn)
        
        
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    func makeConstraint(){
        num4.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailAlertLabel.translatesAutoresizingMaskIntoConstraints = false
        emailBtn.translatesAutoresizingMaskIntoConstraints = false
        emailCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        emailCheckText.translatesAutoresizingMaskIntoConstraints = false
        emailCheckBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
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
            
            emailBtn.topAnchor.constraint(equalTo: emailAlertLabel.bottomAnchor, constant: 8),
            emailBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailBtn.heightAnchor.constraint(equalToConstant: 45),
            
            emailCheckLabel.topAnchor.constraint(equalTo: emailBtn.bottomAnchor, constant: 40),
            emailCheckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            emailCheckText.topAnchor.constraint(equalTo: emailCheckLabel.bottomAnchor, constant: 7),
            emailCheckText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailCheckText.heightAnchor.constraint(equalToConstant: 45),
            emailCheckText.widthAnchor.constraint(equalToConstant: 220),
            
            
            emailCheckBtn.topAnchor.constraint(equalTo: emailCheckLabel.bottomAnchor, constant: 7),
            emailCheckBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            emailCheckBtn.heightAnchor.constraint(equalToConstant: 45),
            emailCheckBtn.leadingAnchor.constraint(equalTo: emailCheckText.trailingAnchor, constant: 5)
            
            
        ])
        
    }
    
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(touchNextBtn(_:)), for: .touchUpInside)
        self.emailBtn.addTarget(self, action: #selector(emailBtnPressed(_:)), for: .touchUpInside)
        self.emailCheckBtn.addTarget(self, action: #selector(emailCheckBtnPressed(_:)), for: .touchUpInside)
        
    }
    
    @objc func emailCheckBtnPressed(_: UIButton) { // 이메일 인증번호 확인 버튼 눌렀을 때
        
        if emailCodeEmptyCheck() {
            showAlert(message: "이메일 인증코드를 입력하세요.")
            return
        }
        
        if sendEmail == true {
            let emailCheckBody = EmailCheckRequest(email: emailText.text!, code: emailCheckText.text!)
            
            let emailCheckURLString = "http://43.200.240.251/member/authentication"
            guard let emailCheckURL = URL(string: emailCheckURLString) else {
                print("이메일 인증코드 확인 URL 가져올 수 없음.")
                return
            }
            
            var emailCheckRequest = URLRequest(url: emailCheckURL)
            emailCheckRequest.httpMethod = "POST"
            emailCheckRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                let jsonData = try JSONEncoder().encode(emailCheckBody)
                emailCheckRequest.httpBody = jsonData
            } catch {
                print("JSON 인코딩에 실패하였음.")
                return
            }
            
            URLSession.shared.dataTask(with: emailCheckRequest) { data, response, error in
                
                guard let data = data else {
                    print("이메일 인증코드 확인 Response를 받아오지 못했음.")
                    return
                }
                do {
                    let emailCheckResquestResult = try JSONDecoder().decode(EmailCheckRequestResult.self, from: data)
                    print("response: \(emailCheckResquestResult)")
                    if emailCheckResquestResult.message! == "인증이 완료되었습니다." {
                        self.emailAuthentication = true
                        DispatchQueue.main.async {
                            self.showAlert(message: "인증되셨습니다.")
                            self.emailCheckBtn.isEnabled = false // 버튼 비활성화
                        }
                    }
                    else {                        DispatchQueue.main.async {
                            self.showAlert(message: "유효하지 않는 인증코드입니다.")
                        }
                    }
                } catch {
                    print("이메일 인증코드 확인 Response를 디코딩하는데 실패하였음.")
                }
            }.resume()
            
        }
        else {
            showAlert(message: "이메일 인증 코드를 먼저 전송받아주세요.")
        }
    }
    
    
    @objc func emailBtnPressed(_: UIButton) {
        if let emailText = emailText.text{
            email = emailText
        }
        if emailInvalidCheck() {
            emailText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            emailText.layer.borderWidth = 2
            emailAlertLabel.textColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            emailAlertLabel.text = "이메일을 입력해주세요."
        } else {
            emailText.layer.borderWidth = 0
            emailAlertLabel.textColor = #colorLiteral(red: 0, green: 0.6676340103, blue: 0, alpha: 1)
            emailAlertLabel.text = "해당 이메일로 인증코드를 전송하였습니다."
            sendEmail = true
            
            // 이메일 보내는 작업
            let emailRequestBody = EmailRequest(email: emailText.text!)
            
            let emailURLString = "http://43.200.240.251/member/emailcode"
            guard let emailURL = URL(string: emailURLString) else {
                print("이메일 인증 URL 가져올 수 없음.")
                return
            }
            
            var emailRequest = URLRequest(url: emailURL)
            emailRequest.httpMethod = "POST"
            emailRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                let jsonData = try JSONEncoder().encode(emailRequestBody)
                emailRequest.httpBody = jsonData
            } catch {
                print("JSON 인코딩에 실패하였음.")
                return
            }
            
            URLSession.shared.dataTask(with: emailRequest) { data, response, error in
                
                guard let data = data else {
                    print("이메일 코드 전송 성공 여부 Response를 받아오지 못했음.")
                    return
                }
                do {
                    let emailRequestResult = try JSONDecoder().decode(EmailReqestResult.self, from: data)
                    print("response: \(emailRequestResult)")
                } catch {
                    print("이메일 코드 전송 Response를 디코딩하는데 실패하였음.")
                }
                
            }.resume()
        }
    }
    
    @objc func touchNextBtn(_:UIButton){
        if let emailText = emailText.text{
            email = emailText
        }
        let checkOne: Bool = emailCheck()
        if(checkOne){
            return
        }
        if emailAuthentication != true {
            showAlert(message: "이메일 인증 단계를 완료해주세요.")
        }
        
        UserDefaults.standard.set(email, forKey: "email")
        // 데이터 동기화
        UserDefaults.standard.synchronize()
        nextView()
        
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
    
    func emailInvalidCheck()->Bool{
        if(email == "" || !email.contains("@")){
            return true
        }
        else{
            return false
        }
    }
    
    func emailCodeEmptyCheck() -> Bool {
        if emailCheckText.text == "" {
            return true
        }
        else {
            return false
        }
    }
    
    @objc func nextView(){
        let nextView = LoginThirdVC()
        self.navigationController?.pushViewController(nextView, animated: true)
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
}
