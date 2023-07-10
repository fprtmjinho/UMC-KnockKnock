//
//  LoginThirdVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/10.
//

import UIKit

class LoginThirdVC: UIViewController{
    
    let num5: UILabel = {
        let num5 = UILabel()
        num5.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num5.text = "5"
        num5.textColor = .white
        num5.textAlignment = .center
        num5.font = UIFont.boldSystemFont(ofSize: 20)
        num5.clipsToBounds = true
        num5.layer.cornerRadius = 12.5
        return num5
    }()
    
    let fourthLabel1: UILabel = {
        let fourthlabel1 = UILabel()
        fourthlabel1.text = "비밀번호 입력"
        fourthlabel1.font = UIFont.boldSystemFont(ofSize: 20)
        return fourthlabel1
    }()
    
    let fourthText1: UITextField = {
        let fourthText1 = UITextField()
        fourthText1.backgroundColor = .systemGray6
        fourthText1.layer.cornerRadius = 20
        fourthText1.addLeftPadding()
        fourthText1.clearButtonMode = .whileEditing
        fourthText1.isSecureTextEntry = true
        return fourthText1
    }()
    
    let fourthLabel2: UILabel = {
        let fourthlabel2 = UILabel()
        fourthlabel2.text = "비밀번호 확인"
        fourthlabel2.font = UIFont.boldSystemFont(ofSize: 20)
        return fourthlabel2
        
        //fourthLabel1에서 비밀번호 입력 되어야 활성화, 색 변경
    }()
    
    let fourthText2: UITextField = {
        let fourthText2 = UITextField()
        fourthText2.backgroundColor = .systemGray6
        fourthText2.layer.cornerRadius = 20
        fourthText2.addLeftPadding()
        fourthText2.clearButtonMode = .whileEditing
        fourthText2.isSecureTextEntry = true
        return fourthText2
    }()
    
    let nextBtn: UIButton = {
        let nextbtn = UIButton()
        nextbtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        nextbtn.setTitle("다음", for: .normal)
        nextbtn.tintColor = .white
        nextbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextbtn.layer.cornerRadius = 25
        return nextbtn
    }()
    
    func makeSubView(){
        view.addSubview(num5)
        view.addSubview(fourthLabel1)
        view.addSubview(fourthText1)
        view.addSubview(fourthLabel2)
        view.addSubview(fourthText2)
        view.addSubview(nextBtn)
    }
    
    func makeConstraint(){
        num5.translatesAutoresizingMaskIntoConstraints = false
        fourthLabel1.translatesAutoresizingMaskIntoConstraints = false
        fourthText1.translatesAutoresizingMaskIntoConstraints = false
        fourthLabel2.translatesAutoresizingMaskIntoConstraints = false
        fourthText2.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            num5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            num5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num5.widthAnchor.constraint(equalToConstant: 25), num5.heightAnchor.constraint(equalToConstant: 25),
            fourthLabel1.topAnchor.constraint(equalTo: num5.bottomAnchor, constant: 5),
            fourthLabel1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            fourthText1.topAnchor.constraint(equalTo: fourthLabel1.bottomAnchor, constant: 10),
            fourthText1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            fourthText1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            fourthText1.heightAnchor.constraint(equalToConstant: 45),
            
            fourthLabel2.topAnchor.constraint(equalTo: fourthText1.bottomAnchor, constant: 40),
            fourthLabel2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            fourthText2.topAnchor.constraint(equalTo: fourthLabel2.bottomAnchor, constant: 10),
            fourthText2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            fourthText2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            fourthText2.heightAnchor.constraint(equalToConstant: 45),
            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
             nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)])
        
    }
    
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
    }
    
    @objc func nextView(_: UIButton){
        let loginSuccessVC = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
}
