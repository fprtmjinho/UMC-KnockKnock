//
//  SearchController.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/25.
//
import UIKit
class SearchController : UIViewController{
    //친구 찾기 페이지
    
    var searchFriendBar : UISearchBar = UISearchBar()
    
    let backgroundView: UIView = {
        let backgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = backgroundView.bounds
        gradientLayer.colors = [UIColor(red: 1.0, green: 0.0, blue: 0.376, alpha: 1.0).cgColor,
                                UIColor(red: 1.0, green: 0.541, blue: 0.0, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        return backgroundView
    }()
    
    let Label1 : UILabel = {
        let label1 = UILabel()
        label1.text = "Name님,\n연락하고 싶은 분이 생겼나요?"
        label1.textColor = .white
        label1.backgroundColor = .clear
        label1.font = UIFont.boldSystemFont(ofSize: 23)
        label1.numberOfLines = 2
        return label1
    }()
    
    let Label2 : UILabel = {
        let label2 = UILabel()
        label2.text = "낙낙은 당신이 알고 있는 사람들과의\n재연결 혹은 새시작을 응원합니다"
        label2.textColor = .white
        label2.backgroundColor = .clear
        label2.font = UIFont.systemFont(ofSize: 17)
        label2.numberOfLines = 2
        return label2
    }()
    
    
    func makeSubView(){
        view.addSubview(backgroundView)
        view.addSubview(Label1)
        view.addSubview(Label2)
        
        searchFriendBar = setSearchBar(VC: self, title: "친구를 검색해주세요!")
    }
    
    func makeConstraint(){
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        Label1.translatesAutoresizingMaskIntoConstraints = false
        Label2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 250),
            
            Label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 7),
            Label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            Label2.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 10),
            Label2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            searchFriendBar.centerYAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            
        ])
        
    }
    func makeAddTarget(){
        searchFriendBar.searchTextField.addTarget(self, action: #selector(searchFriend(_:)), for: .editingChanged)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        view.backgroundColor = .white
        customNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setTitle()
        
        
        
        let button : UIButton = {
            //임시로 지정한 friendProfileVC로 넘기기 위한 버튼
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
            button.setTitle("Go to FriendProfile", for: .normal)
            return button
        }()
        
        //button 임시 지정
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        button.addTarget(self, action: #selector(buttonFunc(_:)), for: .touchUpInside)
        
    }
    
    
    @objc func searchFriend(_:UISearchBar){
        var friendName: String = ""
        if let name = searchFriendBar.text{
            friendName = name
        }
        loadFriendArray(name: friendName)
    }
    @objc func loadFriendArray(name: String){
        
    }
    @objc func setTitle(){
        var nickName: String = loadNickName()
        Label1.text = "\(nickName)님,\n연락하고 싶은 분이 생겼나요?"
    }
    @objc func loadNickName()->String{
        var nickName: String = ""
        //여기에 로그인한 uid로 서버에서 nickName을 불러온다
        return nickName
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            backgroundView.frame = backgroundView.bounds
            if let gradientLayer = backgroundView.layer.sublayers?.first as? CAGradientLayer {
                gradientLayer.frame = backgroundView.bounds
            }
        }
    
    @objc func buttonFunc(_: UIButton) {
        let nextView = FriendProfileVC()
        nextView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    
}

extension SearchController {
    func customNavigationBar(){
        
        let addFriendBtn : UIBarButtonItem = {
            let addFriendBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriendBtnPressed(_:)))
            addFriendBtn.tintColor = .white
            return addFriendBtn
        }()
        
        let getInformationBtn : UIBarButtonItem = {
            let icon = UIImage(named: "upload")
            
            let getInformationBtn = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(getInformationBtnPressed(_:)))
            getInformationBtn.image = UIImage(systemName: "tray.and.arrow.down")
            getInformationBtn.tintColor = .white
            return getInformationBtn
        }()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 0
        //아이콘 간의 간격 조절을 위한 아아템
        
        navigationItem.rightBarButtonItems = [addFriendBtn, spacer, getInformationBtn]
        
    }
    
    @objc func addFriendBtnPressed(_: UIButton){
        let addFriendVC = AddFriendVC()
        addFriendVC.hidesBottomBarWhenPushed = true
        //push할 때 tabBar 숨김처리
        navigationController?.pushViewController(addFriendVC, animated: true)
        //연락처 추가 뷰로 넘어감
    }
    
    @objc func getInformationBtnPressed(_: UIButton){
        let getInformationVC = GetInformationVC()
        getInformationVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(getInformationVC, animated: true)
        //주소록 불러오기 뷰로 전환
    }
    
    
}
