//
//  GetInformatioinVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
class GetInformationVC : UIViewController {
    
    let searchFriendBar : UISearchBar = {
       let searchFriendBar = UISearchBar()
        
        searchFriendBar.placeholder = "친구를 검색해주세요!"
        searchFriendBar.backgroundColor = .none
        searchFriendBar.isTranslucent = true
        searchFriendBar.searchBarStyle = .minimal
        searchFriendBar.searchTextField.backgroundColor = .systemGray6
        
      
        searchFriendBar.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])),
                                 for: .search, state: .normal)
        
      
        return searchFriendBar
    }()
    //custom 필요
    
    let addBtn : UIButton = {
       let addBtn = UIButton()
        addBtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        addBtn.setTitle("추가하기", for: .normal)
        addBtn.tintColor = .white
        addBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        addBtn.layer.cornerRadius = 25
        
        return addBtn
    }()
    
    
    
    func makeSubView(){
        view.addSubview(searchFriendBar)
        view.addSubview(addBtn)
    }
    
    func makeConstraint(){
        searchFriendBar.translatesAutoresizingMaskIntoConstraints = false
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchFriendBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchFriendBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            addBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addBtn.heightAnchor.constraint(equalToConstant: 50),
            addBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "주소록 불러오기"
        setNavigationBar()
        makeSubView()
        makeConstraint()
    }
}
