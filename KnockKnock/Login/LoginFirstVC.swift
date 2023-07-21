//
//  LoginFirstVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/07.
//

import UIKit
class LoginFirstVC : UIViewController {
    
    var nextBtn : UIButton = UIButton()
    
    let num1 : UILabel = {
       let num1 = UILabel()
        num1.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num1.text = "1"
        num1.textColor = .white
        num1.textAlignment = .center
        num1.font = UIFont.boldSystemFont(ofSize: 20)
        num1.clipsToBounds = true
        num1.layer.cornerRadius = 12.5
        return num1
    }()
    
    let nameLabel : UILabel = {
       let firstlabel = UILabel()
        firstlabel.text = "뭐라고 불러드릴까요?"
        firstlabel.font = UIFont.boldSystemFont(ofSize: 20)
        return firstlabel
    }()
    let nameText : UITextField = {
        let firsttext = UITextField()
        firsttext.backgroundColor = .systemGray6
        firsttext.layer.cornerRadius = 20
        firsttext.addLeftPadding()
        firsttext.clearButtonMode = .whileEditing
        return firsttext
    }()
    //글자수 현황 체크 필요
    
    let num2 : UILabel = {
       let num2 = UILabel()
        num2.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num2.text = "2"
        num2.textColor = .white
        num2.textAlignment = .center
        num2.font = UIFont.boldSystemFont(ofSize: 20)
        num2.clipsToBounds = true
        num2.layer.cornerRadius = 12.5
        return num2
    }()

    let sexLabel : UILabel = {
       let secondlabel = UILabel()
        secondlabel.text = "성별을 알려주세요 !"
        secondlabel.font = UIFont.boldSystemFont(ofSize: 20)
        return secondlabel
    }()
    
    let manButton : UIButton = {
     let secondchoice1 = UIButton()
        secondchoice1.setTitle("남성", for: .normal)
        secondchoice1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        secondchoice1.setTitleColor(.gray, for: .normal)
        secondchoice1.backgroundColor = .systemGray6
        secondchoice1.layer.cornerRadius = 20
        return secondchoice1
    }()
    
    let womanButton : UIButton = {
     let secondchoice2 = UIButton()
        secondchoice2.setTitle("여성", for: .normal)
        secondchoice2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        secondchoice2.setTitleColor(.gray, for: .normal)
        secondchoice2.backgroundColor = .systemGray6
        secondchoice2.layer.cornerRadius = 20
            
        return secondchoice2
    }()
    
    let num3 : UILabel = {
       let num3 = UILabel()
        num3.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num3.text = "3"
        num3.textColor = .white
        num3.textAlignment = .center
        num3.font = UIFont.boldSystemFont(ofSize: 20)
        num3.clipsToBounds = true
        num3.layer.cornerRadius = 12.5
        return num3
    }()
    
    let birthdayLabel : UILabel = {
       let thirdlabel = UILabel()
        thirdlabel.text = "생년월일 6자리를 입력해주세요!"
        thirdlabel.font = UIFont.boldSystemFont(ofSize: 20)
        return thirdlabel
    }()
    
    let birthdayText : UITextField = {
        let thirdtext = UITextField()
        thirdtext.placeholder = "생년월일 6자리"
        thirdtext.backgroundColor = .systemGray6
        thirdtext.layer.cornerRadius = 20
        thirdtext.addLeftPadding()
        thirdtext.clearButtonMode = .whileEditing
        return thirdtext
    }()
    
      
    
    
    var nickName: String = ""
    var sex: String = ""
    var birthday: String = ""
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
        navigationController?.isNavigationBarHidden = false
        
    }
   
}

extension LoginFirstVC {
    func makeSubView(){
        view.addSubview(num1)
        view.addSubview(nameLabel)
        view.addSubview(nameText)
        view.addSubview(num2)
        view.addSubview(sexLabel)
        view.addSubview(manButton)
        view.addSubview(womanButton)
        view.addSubview(num3)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayText)
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    
    func makeConstraint(){
        num1.translatesAutoresizingMaskIntoConstraints = false
        num2.translatesAutoresizingMaskIntoConstraints = false
        num3.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameText.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        manButton.translatesAutoresizingMaskIntoConstraints = false
        womanButton.translatesAutoresizingMaskIntoConstraints = false
        birthdayText.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            num1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            num1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num1.widthAnchor.constraint(equalToConstant: 25),
            num1.heightAnchor.constraint(equalToConstant: 25),
            nameLabel.topAnchor.constraint(equalTo: num1.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameText.widthAnchor.constraint(equalToConstant: 250),
            nameText.heightAnchor.constraint(equalToConstant: 45),
            
            num2.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 40),
            num2.bottomAnchor.constraint(equalTo: sexLabel.topAnchor, constant: -5),
            num2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num2.widthAnchor.constraint(equalToConstant: 25),
            num2.heightAnchor.constraint(equalToConstant: 25),
            sexLabel.bottomAnchor.constraint(equalTo: manButton.topAnchor, constant: -5),
            sexLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            sexLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            manButton.bottomAnchor.constraint(lessThanOrEqualTo: num3.topAnchor, constant: -40),
            manButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            manButton.widthAnchor.constraint(equalToConstant: 160),
            manButton.heightAnchor.constraint(equalTo : nameText.heightAnchor),
            womanButton.bottomAnchor.constraint(equalTo: manButton.bottomAnchor),
            womanButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            womanButton.widthAnchor.constraint(equalToConstant: 160),
            womanButton.heightAnchor.constraint(equalTo : nameText.heightAnchor),
            
            num3.bottomAnchor.constraint(equalTo: birthdayLabel.topAnchor, constant: -5),
            num3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num3.widthAnchor.constraint(equalToConstant: 25),
            num3.heightAnchor.constraint(equalToConstant: 25),
            birthdayLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            birthdayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            birthdayText.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 10),
            birthdayText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            birthdayText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            birthdayText.heightAnchor.constraint(equalTo : nameText.heightAnchor),
            
        ])
        
    }
    
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(touchNextBtn(_:)), for: .touchUpInside)
        self.manButton.addTarget(self, action: #selector(choiceMan(_:)), for: .touchUpInside)
        self.womanButton.addTarget(self, action: #selector(choiceWoman(_:)), for: .touchUpInside)
    }
    @objc func choiceMan(_:UIButton){
        let color = manButton.backgroundColor
        if color == #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1){
            womanButton.backgroundColor = .systemGray6
        }
        else{
            manButton.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            manButton.setTitleColor(.white, for: .normal)
            womanButton.backgroundColor = .systemGray6
            womanButton.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func choiceWoman(_:UIButton){
        let color = womanButton.backgroundColor
        if color == #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1){
            manButton.backgroundColor = .systemGray6}
        else{
            womanButton.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            womanButton.setTitleColor(.white, for: .normal)
            manButton.backgroundColor = .systemGray6
            manButton.setTitleColor(.gray, for: .normal)
        }
    }
    @objc func touchNextBtn(_:UIButton){
        //var sexType: Bool = true
        let choieColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        // 성별 선택(string)
        if (manButton.backgroundColor == choieColor){
            sex = "man"
        }
        else if(womanButton.backgroundColor == choieColor){
            sex = "woman"
        }
        if let nameText = nameText.text{
            nickName = nameText
        }
        if let birthdayText = birthdayText.text{
            birthday = birthdayText
        }
        // 입력 안된 정보 있을때
        let checkOne: Bool = nickNameCheck()
        let checkTwo: Bool = sexCheck()
        let checkThird: Bool = birthdayCheck()
        if(checkOne||checkTwo||checkThird){
            return
        }
        // 데이터 저장
        UserDefaults.standard.set(nickName, forKey: "nickName")
        UserDefaults.standard.set(sex, forKey: "sex")
        UserDefaults.standard.set(birthday, forKey: "birthday")

        // 데이터 동기화
        UserDefaults.standard.synchronize()
        nextView()
    }
    // 별명 체크
    @objc func nickNameCheck()-> Bool{
        // 별명이 빈칸이면 별명 입력창을 빨간색으로 강조
        if(nickName==""){
            nameText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            nameText.layer.borderWidth = 2
            return true
        }
        // 아니면 검정색
        else{
            nameText.layer.borderWidth = 0
            return false
        }
        
    }
    // 성별 체크
    @objc func sexCheck()-> Bool{
        // 성별이 선택 안되었으면 버튼 두 개 빨간색으로 강조
        if(sex==""){
            manButton.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            manButton.layer.borderWidth = 2
            womanButton.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            womanButton.layer.borderWidth = 2
            return true
        }
       
        else{
            womanButton.layer.borderWidth = 0
            manButton.layer.borderWidth = 0
            return false
        }
    }
    // 생년월일 체크
    @objc func birthdayCheck()-> Bool{
        // 생년월일이 빈칸이거나 6자리가 아니면 생년월일 입력창을 빨간색으로 강조
        if(birthday==""||birthday.count != 6){
            birthdayText.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            birthdayText.layer.borderWidth = 2
            return true
        }
        else{
            birthdayText.layer.borderWidth = 0
            return false
        }
    }
    @objc func nextView(){
        let loginSecondVC = LoginSecondVC()
        setMyData()
        self.navigationController?.pushViewController(loginSecondVC, animated: true)
    }
    @objc func setMyData(){
        let me = MyData.shared
        me.name = nickName
        me.sex = sex
        me.birthday = birthday
    }
}



