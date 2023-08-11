//
//  LoginSuccessView.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
import Alamofire

class LoginSuccessVC : UIViewController {
    
    let signUpURLString = "http://43.200.240.251/member/signup"
    
    var startBtn : UIButton = UIButton()
    
    let checkIMg : UIImageView = {
        let checkImg = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])
        checkImg.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        return checkImg
    }()
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let signInLabel : UILabel = {
        let label = UILabel()
        label.text = "회원가입 되었습니다."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let readHowtoUseBtn : UIButton = {
        let nextbtn = UIButton()
        var title = AttributedString("앱 사용법 익히기")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .white
        config.cornerStyle = .capsule
        config.attributedTitle = title
        config.baseForegroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        config.background.strokeColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        nextbtn.configuration = config
        return nextbtn
    }()
    
    
    
    
    var nickName: String = ""
    var sex: String = ""
    var birthday: String = ""
    var email: String = ""
    var password: String = ""
    var name: String = "123"
    var userPhone: String = "010-XXXX-XXXX"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        debugingFunction()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
    }
    
}

extension LoginSuccessVC {
    func makeSubView(){
        view.addSubview(checkIMg)
        view.addSubview(welcomeLabel)
        view.addSubview(signInLabel)
        view.addSubview(readHowtoUseBtn)
        startBtn = setNextBtn(view: self, title: "시작하기")
    }
    
    func makeConstraint(){
        checkIMg.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        readHowtoUseBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkIMg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkIMg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            checkIMg.widthAnchor.constraint(equalToConstant: 90),
            checkIMg.heightAnchor.constraint(equalToConstant: 90),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: checkIMg.bottomAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signInLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signInLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            signInLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            readHowtoUseBtn.bottomAnchor.constraint(equalTo: startBtn.topAnchor, constant: -10),
            readHowtoUseBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            readHowtoUseBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            readHowtoUseBtn.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    func makeAddTarget(){
        self.readHowtoUseBtn.addTarget(self, action: #selector(readHowtoUseFunc(_:)), for: .touchUpInside)
        self.startBtn.addTarget(self, action: #selector(startBtnFunc(_:)), for: .touchUpInside)
        
    }
    
    func debugingFunction(){
        // 데이터 가져오기
        if let nickName = UserDefaults.standard.string(forKey: "nickName"),
           let sex = UserDefaults.standard.string(forKey: "sex"),
           let birthday = UserDefaults.standard.string(forKey: "birthday"),
           let email = UserDefaults.standard.string(forKey: "email"),
           let password = UserDefaults.standard.string(forKey: "password"){
            // 가져온 값 사용
            self.nickName = nickName
            self.sex = sex
            self.email = email
            self.birthday = birthday
            self.password = password
        } else {
            // 저장된 데이터가 없을 경우 기본값 또는 처리할 로직 설정
            print("No data found.")
        }
        performSignUp()
        setName()
        deleteData()
    }
    
    func performSignUp() {
        let signUpData = SignUpData(memberGender: sex, nickName: nickName, email: email, birthday: birthday, password: password)
        
        AF.upload(multipartFormData: { multipartFormData in
            if let signUpJSONData = try? JSONEncoder().encode(signUpData) {
                multipartFormData.append(signUpJSONData, withName: "request", mimeType: "application/json")
            }
            
            if let profileImage = UIImage(named: "karim"),
               let profileImageData = profileImage.jpegData(compressionQuality: 0.9) {
                multipartFormData.append(profileImageData, withName: "profileImage", fileName: "profileImage.jpeg", mimeType: "image/jpeg")
            }
        }, to: signUpURLString)
        .response { response in
            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode {
                    print("HTTP Status Code: \(statusCode)")
                    
                    if let responseData = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let signUpResponse = try decoder.decode(SignUpResponse.self, from: responseData)
                            print("Sign Up Response: \(signUpResponse)")
                        } catch {
                            print("JSON Decoding Error: \(error)")
                        }
                    }
                    
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        
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
    
    @objc func setName(){
        welcomeLabel.text = "\(nickName)님 환영합니다!"
        //nickName이 안뜸 흠
    }
    func deleteData(){
        UserDefaults.standard.removeObject(forKey: "nickName")
        UserDefaults.standard.removeObject(forKey: "sex")
        UserDefaults.standard.removeObject(forKey: "birthday")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
    }
    @objc func startBtnFunc(_: UIButton){
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    @objc func readHowtoUseFunc(_: UIButton){
        navigationController?.pushViewController(HowtouseVC(), animated: true)
    }
}
