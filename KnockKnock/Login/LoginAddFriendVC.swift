//
//  LoginAddFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
class LoginAddFriendVC : AllowApproachVC {

    let searchFriendBar : UISearchBar = {
        let searchFriendBar = UISearchBar()
        
        searchFriendBar.placeholder = "친구를 검색해주세요!"
        searchFriendBar.backgroundColor = .systemGray6
        searchFriendBar.isTranslucent = false
        
        searchFriendBar.searchTextField.backgroundColor = .systemGray6
        searchFriendBar.layer.cornerRadius = 25
        searchFriendBar.clipsToBounds = true
        searchFriendBar.searchBarStyle = .default
        searchFriendBar.barTintColor = .systemGray6
        
        
        searchFriendBar.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])),
                                 for: .search, state: .normal)
        
        return searchFriendBar
    }()
    
   override func makeSubView(){
       view.addSubview(titleLabel)
       view.addSubview(subtitleLabel)
       view.addSubview(searchFriendBar)
        view.addSubview(nextBtn)
    }
    
    override func makeConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchFriendBar.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            searchFriendBar.topAnchor.constraint(greaterThanOrEqualTo: subtitleLabel.bottomAnchor),
            searchFriendBar.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
            nextBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
             nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        
        ])
    }
    
   override func makeAddTarget(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBtnFunc(_:)))
        nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
     
    }
    
    
    @objc func nextView(_: UIButton){
        let loginAddBFVC = LoginAddBestFriendVC()
        self.navigationController?.pushViewController(loginAddBFVC, animated: true)
    }
    @objc override func skipBtnFunc(_: UIBarButtonItem){
        let loginSuccessView = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessView, animated: true)
    }
    
    func setLabel(){
        titleLabel.text = "연락할 친구를\n추가하세요!"
        subtitleLabel.text = "시기와 상관없이 언젠가 연락할 사람의 연락처를\n추가해주세요.\n\n6개월에 한 번씩 알림을 보내드릴게요.\n연락 주기는 추후에 변경이 가능합니다!"
    }
    //일부 글씨만 두껍게 수정해야 함
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setLabel()
        
        
    }
}


extension LoginAddFriendVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
    
    
}
