//
//  LoginFirstVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/07.
//

import UIKit
import CoreData
class LoginFirstVC : UIViewController {
    
    let num1 : UILabel = {
       let num1 = UILabel()
        num1.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num1.text = "1"
        num1.textColor = .white
        num1.textAlignment = .center
        num1.font = UIFont.boldSystemFont(ofSize: 20)
        num1.layer.cornerRadius = 30
        return num1
    }()
    
    let firstLabel : UILabel = {
       let firstlabel = UILabel()
        firstlabel.text = "뭐라고 불러드릴까요?"
        firstlabel.font = UIFont.boldSystemFont(ofSize: 20)
        return firstlabel
    }()
    let firstText : UITextField = {
        let firsttext = UITextField()
        firsttext.backgroundColor = .systemGray6
        firsttext.layer.cornerRadius = 25
        //padding 필요
        firsttext.addLeftPadding()
        
        return firsttext
    }()
    
    let num2 : UILabel = {
       let num2 = UILabel()
        num2.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num2.text = "2"
        num2.textColor = .white
        num2.textAlignment = .center
        num2.font = UIFont.boldSystemFont(ofSize: 20)
        num2.layer.cornerRadius = 30
        return num2
    }()

    let secondLabel : UILabel = {
       let secondlabel = UILabel()
        secondlabel.text = "성별을 알려주세요 !"
        secondlabel.font = UIFont.boldSystemFont(ofSize: 20)
        return secondlabel
    }()
    
    let secondChoice1 : UIButton = {
     let secondchoice1 = UIButton()
        secondchoice1.setTitle("남성", for: .normal)
        secondchoice1.tintColor = .gray
        secondchoice1.backgroundColor = .systemGray6
        secondchoice1.layer.cornerRadius = 25
        return secondchoice1
    }()
    
    let secondChoice2 : UIButton = {
     let secondchoice2 = UIButton()
        secondchoice2.setTitle("여성", for: .normal)
        secondchoice2.tintColor = .gray
        secondchoice2.backgroundColor = .systemGray6
        secondchoice2.layer.cornerRadius = 25
        return secondchoice2
    }()
    
    let num3 : UILabel = {
       let num3 = UILabel()
        num3.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num3.text = "3"
        num3.textColor = .white
        num3.textAlignment = .center
        num3.font = UIFont.boldSystemFont(ofSize: 20)
        num3.layer.cornerRadius = 30
        return num3
    }()
    
    let thirdLabel : UILabel = {
       let thirdlabel = UILabel()
        thirdlabel.text = "생년월일 6자리를 입력해주세요!"
        thirdlabel.font = UIFont.boldSystemFont(ofSize: 20)
        //padding 필요
        return thirdlabel
    }()
    
    let thirdText : UITextField = {
        let thirdtext = UITextField()
        thirdtext.backgroundColor = .systemGray6
        thirdtext.layer.cornerRadius = 25
        
        thirdtext.addLeftPadding()
        return thirdtext
    }()
    
    let nextBtn : UIButton = {
       let nextbtn = UIButton()
        nextbtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        nextbtn.setTitle("다음", for: .normal)
        nextbtn.tintColor = .white
        nextbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        nextbtn.layer.cornerRadius = 25
        return nextbtn
    }()
      
    func makeSubView(){
        view.addSubview(num1)
        view.addSubview(firstLabel)
        view.addSubview(firstText)
        view.addSubview(num2)
        view.addSubview(secondLabel)
        view.addSubview(secondChoice1)
        view.addSubview(secondChoice2)
        view.addSubview(num3)
        view.addSubview(thirdLabel)
        view.addSubview(thirdText)
        view.addSubview(nextBtn)
    }
    
    
    func makeConstraint(){
        num1.translatesAutoresizingMaskIntoConstraints = false
        num2.translatesAutoresizingMaskIntoConstraints = false
        num3.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstText.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondChoice1.translatesAutoresizingMaskIntoConstraints = false
        secondChoice2.translatesAutoresizingMaskIntoConstraints = false
        thirdText.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            num1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            num1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num1.widthAnchor.constraint(equalToConstant: 30),
            num1.heightAnchor.constraint(equalToConstant: 30),
            firstLabel.topAnchor.constraint(equalTo: num1.bottomAnchor, constant: 8),
            firstLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            firstLabel.heightAnchor.constraint(equalToConstant: 40),
            firstText.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 8),
            firstText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            firstText.widthAnchor.constraint(equalToConstant: 250),
            firstText.heightAnchor.constraint(equalToConstant: 50),
            
            num2.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 90),
            num2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num2.widthAnchor.constraint(equalToConstant: 30),
            num2.heightAnchor.constraint(equalToConstant: 30),
            secondLabel.topAnchor.constraint(equalTo: num2.bottomAnchor, constant: 8),
            secondLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            secondLabel.heightAnchor.constraint(equalToConstant: 40),
            secondChoice1.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 8),
            secondChoice1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            secondChoice1.widthAnchor.constraint(equalToConstant: 160),
            secondChoice1.heightAnchor.constraint(equalToConstant: 50),
            secondChoice2.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 8),
            secondChoice2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            secondChoice2.widthAnchor.constraint(equalToConstant: 160),
            secondChoice2.heightAnchor.constraint(equalToConstant: 50),
            
            num3.topAnchor.constraint(equalTo: secondChoice1.bottomAnchor, constant: 90),
            num3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num3.widthAnchor.constraint(equalToConstant: 30),
            num3.heightAnchor.constraint(equalToConstant: 30),
            thirdLabel.topAnchor.constraint(equalTo: num3.bottomAnchor, constant: 8),
            thirdLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            thirdText.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 10),
            thirdText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            thirdText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            thirdText.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.topAnchor.constraint(equalTo: thirdText.bottomAnchor, constant: 80),
            nextBtn.heightAnchor.constraint(equalToConstant: 60),
            nextBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            
            
            
        
        ])
    }
    func buttonClick(){
        self.secondChoice1.addTarget(self, action: #selector(choiceMan(_:)), for: .touchUpInside)
        self.secondChoice2.addTarget(self, action: #selector(choiceWoman(_:)), for: .touchUpInside)
        self.nextBtn.addTarget(self, action:#selector(touchNextBtn(_:)), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        buttonClick()
    }
    
    @objc func touchNextBtn(_:UIButton){
        var nickName: String = ""
        var birthday: String = ""
        var sexType: Bool = true
        var sex: String = ""
        let choieColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        // 성별 선택(string)
        if (secondChoice1.backgroundColor == choieColor){
            sex = "man"
        }
        else if(secondChoice2.backgroundColor == choieColor){
            sex = "woman"
        }
        // 성별 선택(bool)
        if sex=="man"{
            sexType=true
        }
        else if sex=="woman"{
            sexType=false
        }
        
        if let nameText = firstText.text{
            nickName = nameText
        }
        if let dayText = thirdText.text{
            birthday = dayText
        }
        savePersonalInfo(nickName: nickName, sex: sexType, birthday: birthday)
    }
    
    @objc func savePersonalInfo(nickName: String, sex: Bool, birthday: String) {
        print(nickName)
        print(sex)
        print(birthday)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Core Data entity 이름
        let entityName = "Person"
        
        // Entity 생성 및 관리 객체(context)에 추가
        if let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext) {
            let person = NSManagedObject(entity: entity, insertInto: managedContext)
            
            // 저장할 정보 설정
            person.setValue(nickName, forKeyPath: "nickName")
            person.setValue(sex, forKeyPath: "sex")
            person.setValue(birthday, forKey: "birthday")
            
            // 변경 내용 저장
            do {
                try managedContext.save()
                print("Data saved successfully.")
            } catch let error as NSError {
                print("Failed to save data. Error: \(error), \(error.userInfo)")
            }
        }
    }
    @objc func choiceMan(_:UIButton){
        let color = secondChoice1.backgroundColor
        if color == #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1){
            secondChoice1.backgroundColor = .systemGray6
        }
        else{
            secondChoice1.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            secondChoice2.backgroundColor = .systemGray6
        }
    }
    @objc func choiceWoman(_:UIButton){
        let color = secondChoice2.backgroundColor
        if color == #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1){
            secondChoice2.backgroundColor = .systemGray6}
        else{
            secondChoice2.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            secondChoice1.backgroundColor = .systemGray6
        }
    }
}

