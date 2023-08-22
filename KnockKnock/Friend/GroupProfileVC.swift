//
//  GroupProfileVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
class GroupProfileVC : UIViewController {
    let groupProfileView : GroupProfileView = {
       let view = GroupProfileView()
        return view
    }()
    
    let scrollView : UIScrollView = UIScrollView()
    
    
    let group = Group.shared
    
    var searchPlace: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        view.backgroundColor = .white
        setNavigationBar()
        handleEditFunc()
        editNavigationBarBtn()
        print("index : \(UserDefaults.standard.integer(forKey: "index"))")
        getData()
        
//        setMap()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        location()
        
        print("group : \(group.choiceIndex!)")
        print("index : \(UserDefaults.standard.integer(forKey: "index"))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        groupProfileView.membertableView.reloadData()
       // groupProfileView.settableView()
        makeAddTarget()
    }
}

extension GroupProfileVC {
    func makeSubView(){
        view.addSubview(scrollView)
        scrollView.addSubview(groupProfileView)
    }
    
    func makeConstraint(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        groupProfileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            groupProfileView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            groupProfileView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            groupProfileView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            groupProfileView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            groupProfileView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        let contentViewHeight = groupProfileView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
    }
    func makeAddTarget(){
        groupProfileView.groupAlarmSwitch.addTarget(self, action: #selector(groupAlarmSwitchFunc(_:)), for: .touchUpInside)
        
    }
    @objc func editmemberBtnFunc(_: UIButton){
        let groupmemberVC = GroupMemberVC()
        navigationController?.pushViewController(groupmemberVC, animated: true)
    }
    
    @objc func groupAlarmSwitchFunc(_: UIButton){
        //그룹 알림 on/off 설정
    }
    
    func editNavigationBarBtn(){
        let editbtn = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNavigationBarBtnFunc(_:)))
        editbtn.tintColor = .systemGray2
        navigationItem.rightBarButtonItem = editbtn
    }
    
    @objc func editNavigationBarBtnFunc(_: UINavigationItem){
        navigationController?.pushViewController(EditGroupVC(), animated: true)
    }
    func getData(){
        
        let URLString = "http://\(Server.url)/gathering/\(UserDefaults.standard.integer(forKey: "index"))"
        print(URLString)
        guard let url = URL(string: URLString) else {
            print("서버 URL을 만들 수 없습니다.")
            return
        }
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Authorization": accessToken!]
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            guard let data = data else {
                print("그룹 정보를 받아오지 못했습니다.")
                return
            }
            do {
                var nameCh: Array<String> = []
                var numberCh: Array<String> = []
                var bestCh: Array<Bool> = []
                let decodedData = try JSONDecoder().decode(Gathering.self, from: data)
                for member in decodedData.gatheringMembers{
                    nameCh.append(member.friendName)
                    numberCh.append(member.phoneNumber!)
                    bestCh.append(member.bestFriend)
                }
                DispatchQueue.main.async {
                        self.groupProfileView.nameList = nameCh
                        self.groupProfileView.numberList = numberCh
                        self.groupProfileView.bestFriendList = bestCh
                        self.title = decodedData.title
                        self.searchPlace = decodedData.location
                        self.groupProfileView.place.text = self.searchPlace
                        self.groupProfileView.sortData()
                        self.groupProfileView.membertableView.reloadData()
                    }
            } catch {
                print("그룹 정보 디코딩에 실패하였습니다.")
            }
        }.resume()
    }
    
    func location() {
        let URLString = "http://\(Server.url)/gathering/\(UserDefaults.standard.integer(forKey: "index"))/location"
        
        print(URLString)
        
        guard let url = URL(string: URLString) else {
            print("서버 URL을 만들 수 없습니다.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
            guard let data = data else {
                print("그룹 정보를 받아오지 못했습니다.")
                return
            }
        }.resume()
    }
    
}
