//
//  ChangePasswordVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/14.
//

import UIKit
class ChangePasswordVC : UIViewController {
    
    var changePasswordBtn : UIButton = UIButton()
    
    let passwordLabel: UILabel = {
        let fourthlabel1 = UILabel()
        fourthlabel1.text = "신규 비밀번호"
        fourthlabel1.font = UIFont.boldSystemFont(ofSize: 20)
        return fourthlabel1
    }()
    
    let passwordText: UITextField = {
        let fourthText1 = UITextField()
        fourthText1.placeholder = "6자리 이상 입력해주세요."
        fourthText1.backgroundColor = .systemGray6
        fourthText1.layer.cornerRadius = 20
        fourthText1.addLeftPadding()
        fourthText1.clearButtonMode = .whileEditing
        fourthText1.isSecureTextEntry = true
        return fourthText1
    }()
    //글자 수 8개 이상이어야 통과하도록 수정해야 함
    
    
    let passwordCheckLabel: UILabel = {
        let fourthlabel2 = UILabel()
        fourthlabel2.text = "비밀번호 확인"
        fourthlabel2.font = UIFont.boldSystemFont(ofSize: 20)
        return fourthlabel2
        
        //fourthLabel1에서 비밀번호 입력 되어야 활성화, 색 변경
    }()
    
    let passwordCheckText: UITextField = {
        let fourthText2 = UITextField()
        fourthText2.placeholder = "다시 입력해주세요."
        fourthText2.backgroundColor = .systemGray6
        fourthText2.layer.cornerRadius = 20
        fourthText2.addLeftPadding()
        fourthText2.clearButtonMode = .whileEditing
        fourthText2.isSecureTextEntry = true
        return fourthText2
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        handleEditFunc()
        self.title = "비밀번호 변경"
        
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
        
    }
}

extension ChangePasswordVC {
    func makeSubView(){
        view.addSubview(passwordLabel)
        view.addSubview(passwordText)
        view.addSubview(passwordCheckLabel)
        view.addSubview(passwordCheckText)
        changePasswordBtn = setNextBtn(view: self, title: "비밀번호 변경")
    }
    
    func makeConstraint(){
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordCheckText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            passwordText.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordText.heightAnchor.constraint(equalToConstant: 45),
            
            passwordCheckLabel.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 30),
            passwordCheckLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordCheckText.topAnchor.constraint(equalTo: passwordCheckLabel.bottomAnchor, constant: 10),
            passwordCheckText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordCheckText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordCheckText.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    func makeAddTarget(){
        self.changePasswordBtn.addTarget(self, action: #selector(changePasswordFunc(_:)), for: .touchUpInside)
    }
    
    @objc func changePasswordFunc(_: UIButton){
        //비밀번호 변경
        
        let changePasswordBody = ChangePassword(memberId: UserDefaults.standard.integer(forKey: "memberId"), newPassword: passwordText.text!)
        
        print(changePasswordBody)
        
        let changePasswordURLString = "http://\(Server.url)/forgot-password/change-password"
        
        guard let changePasswordURL = URL(string: changePasswordURLString) else {
            print("비밀번호 변경 URL 가져올 수 없음.")
            return
        }
        
        var changePasswordRequest = URLRequest(url: changePasswordURL)
        changePasswordRequest.httpMethod = "POST"
        changePasswordRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(changePasswordBody)
            changePasswordRequest.httpBody = jsonData
        } catch {
            print("JSON 인코딩에 실패하였음.")
            return
        }
        
        URLSession.shared.dataTask(with: changePasswordRequest) {
            data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            
            guard let data = data else {
                print("비밀번호 변경 전송 성공 여부 Response를 받아오지 못했음.")
                return
            }
            
            do {
                let changePasswordResponse = try JSONDecoder().decode(ChangePasswordResponse.self, from: data)
                print("response: \(changePasswordResponse)")
            } catch {
                print("비밀번호 변경 전송 Response를 디코딩하는데 실패하였음.")
            }
        }.resume()
        
        navigationController?.popToRootViewController(animated: true)
    }
}
