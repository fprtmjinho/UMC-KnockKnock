//
//  LoginSuccessView.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
class LoginSuccessVC : UIViewController {
    
    let checkIMg : UIImageView = {
        let checkImg = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])
        checkImg.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        return checkImg
    }()
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "환영합니다!"
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
    
    let startBtn : UIButton = {
        let startbtn = UIButton()
        startbtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        startbtn.setTitle("시작하기", for: .normal)
        startbtn.tintColor = .white
        startbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        startbtn.layer.cornerRadius = 25
        return startbtn
    }()
    
    
    func makeSubView(){
        view.addSubview(checkIMg)
        view.addSubview(welcomeLabel)
        view.addSubview(signInLabel)
        view.addSubview(startBtn)
    }
    
    func makeConstraint(){
        checkIMg.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        startBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkIMg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            checkIMg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            checkIMg.widthAnchor.constraint(equalToConstant: 90),
            checkIMg.heightAnchor.constraint(equalToConstant: 90),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: checkIMg.bottomAnchor, constant: 20),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 40),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signInLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signInLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            signInLabel.widthAnchor.constraint(equalToConstant: 40),
            signInLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            startBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startBtn.heightAnchor.constraint(equalToConstant: 50),
            startBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            startBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
    }
    var nickName: String = ""
    var sex: String = ""
    var birthday: String = ""
    var email: String = ""
    var password: String = ""
    func makeAddTarget(){
        self.startBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        debugingFunction()
    }
    func debugingFunction(){
        // 데이터 가져오기
        if let nickName = UserDefaults.standard.string(forKey: "nickName"),
           let sex = UserDefaults.standard.string(forKey: "sex"),
           let birthday = UserDefaults.standard.string(forKey: "birthday"),
           let email = UserDefaults.standard.string(forKey: "email"),
           let password = UserDefaults.standard.string(forKey: "password"){
            // 가져온 값 사용
            print(nickName)
            print(sex)
            print(birthday)
            print(email)
            print(password)
        } else {
            // 저장된 데이터가 없을 경우 기본값 또는 처리할 로직 설정
            print("No data found.")
        }
    }
    @objc func nextView(_: UIButton){
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
        
        //시작 버튼 누르면 tabbarcontroller로 이동
        //방식 수정 필요
        
    }
}
