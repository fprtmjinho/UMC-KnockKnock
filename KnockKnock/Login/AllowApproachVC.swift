//
//  AllowApproachVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
class AllowApproachVC : UIViewController {
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.text = "연락처 권한을\n허락해주세요!"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleLabel : UILabel = {
       let label = UILabel()
        label.text = "시작하기 전에 회원님의 연락처를\n불러오려고 해요.\n\n스마트폰에서 연락처 접근 권한을 물어보면\n'승인'을 선택해주세요!"
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let stepGuide : UIStackView = {
        let now = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 3))
        now.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        now.layer.cornerRadius = 5
        let circle1 = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
        circle1.backgroundColor = .systemGray4
        circle1.layer.cornerRadius = 1.5
        let circle2 = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
        circle2.backgroundColor = .systemGray4
        circle2.layer.cornerRadius = 1.5
        
        let stepGuide = UIStackView(frame: CGRect(x: 0, y: 0, width: 25, height: 5))
        stepGuide.spacing = 3
        stepGuide.axis = .horizontal
        stepGuide.addArrangedSubview(now)
        stepGuide.addArrangedSubview(circle1)
        stepGuide.addArrangedSubview(circle2)
        return stepGuide
    }()
    //코드 수정 필요
    
    
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
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(nextBtn)
        view.addSubview(stepGuide)
    }
    
    func makeConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        stepGuide.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
             nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            stepGuide.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepGuide.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -5)
        
        ])
        
    }
    
    func makeAddTarget(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBtnFunc(_:)))
        self.nextBtn.addTarget(self, action: #selector(popUpFunc(_:)), for: .touchUpInside)
    }
    
    @objc func popUpFunc(_: UIButton){
        
       let alert = UIAlertController(title: "'낙낙'이(가) 사용자의 연락처에\n접근하려고 합니다.",
                                     message: "App required contact permission to\nread phone number of mobile",
                                     preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default){ action in
            //handler
            let loginAddFriendVC = LoginAddFriendVC()
            self.navigationController?.pushViewController(loginAddFriendVC, animated: true)
        }
        let notok = UIAlertAction(title: "허용 안 함", style: .cancel){ action in
            
        }
        
        alert.addAction(ok)
        alert.addAction(notok)
        
        self.present(alert, animated: true)
    }
    
    @objc func skipBtnFunc(_: UIBarButtonItem){
        let loginSuccessView = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessView, animated: true)
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
