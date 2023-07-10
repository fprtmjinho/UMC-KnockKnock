//
//  LoginSecondVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/08.
//

import UIKit
class LoginSecondVC : UIViewController{
    
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
    
    let forthLabel : UILabel = {
       let forthlabel = UILabel()
        forthlabel.text = "사용하실\n이메일을 입력하세요"
        forthlabel.font = UIFont.boldSystemFont(ofSize: 20)
        forthlabel.numberOfLines = 2
        return forthlabel
    }()
    let forthText : UITextField = {
        let forthtext = UITextField()
        forthtext.backgroundColor = .systemGray6
        forthtext.layer.cornerRadius = 20
        forthtext.addLeftPadding()
        forthtext.clearButtonMode = .whileEditing
      
        return forthtext
    }()
    
    let nextBtn : UIButton = {
       let nextbtn = UIButton()
        nextbtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        nextbtn.setTitle("다음", for: .normal)
        nextbtn.tintColor = .white
        nextbtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        nextbtn.layer.cornerRadius = 25
        return nextbtn
    }()
    
    func makeSubView(){
        view.addSubview(num4)
        view.addSubview(forthLabel)
        view.addSubview(forthText)
        view.addSubview(nextBtn)
    }
    
    func makeConstraint(){
        num4.translatesAutoresizingMaskIntoConstraints = false
        forthLabel.translatesAutoresizingMaskIntoConstraints = false
        forthText.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            num4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            num4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num4.widthAnchor.constraint(equalToConstant: 25),
            num4.heightAnchor.constraint(equalToConstant: 25),
            forthLabel.topAnchor.constraint(equalTo: num4.bottomAnchor, constant: 5),
            forthLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            forthText.topAnchor.constraint(equalTo: forthLabel.bottomAnchor, constant: 10),
            forthText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            forthText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            forthText.heightAnchor.constraint(equalToConstant: 45),
            
            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
    }
    
    func makeAddTarget(){
        self.nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
    }
    
    @objc func nextView(_: UIButton){
        let loginThirdVC = LoginThirdVC()
        navigationController?.pushViewController(loginThirdVC, animated: true)
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
