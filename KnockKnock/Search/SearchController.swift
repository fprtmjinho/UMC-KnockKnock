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
    var tableView = UITableView(frame: .zero, style: .plain)
    
    let friendData = Friends.shared
    
    var checked: Array<Bool> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var nickNameList: Array<String> = []
    var alramList: Array<Bool> = []
    var timeList: Array<String> = []
    var hiddenList: Array<Bool> = []
    
    func makeAddTarget(){
        searchFriendBar.searchTextField.addTarget(self, action: #selector(searchFriend(_:)), for: .editingChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        view.backgroundColor = .white
        getData()
        customNavigationBar()
        makeSubView()
        makeConstraint()
        setTableView()
        makeAddTarget()
        setTitle()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getData()
        sortData()
        tableView.reloadData()
        setTableView()
    }
    @objc func sortData(){

        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList, zip(nickNameList,zip(numberList, zip(checked,zip(alramList,timeList).map{($0,$1)}).map{($0, $1)}).map{($0, $1)}).map{($0, $1)}).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        nickNameList = combinedList.map {$0.1.0}
        numberList = combinedList.map { $0.1.1.0 }
        checked = combinedList.map { $0.1.1.1.0 }
        alramList = combinedList.map {$0.1.1.1.1.0}
        timeList = combinedList.map{$0.1.1.1.1.1}
        friendData.name = nameList
        friendData.number = numberList
        friendData.bestFriend = checked
        friendData.alram = alramList
        friendData.time = timeList
    }
    @objc func searchFriend(_:UISearchBar){
        print("searchFriend")
        var friendName: String = ""
        if let name = searchFriendBar.text{
            friendName = name
        }
        loadFriendArray(name: friendName)
    }
    @objc func loadFriendArray(name: String){
        if name == ""{
            hiddenList = friendData.hidden
        }else{
            var i=0;
            for listName in nameList{
                if !listName.contains(name){
                    var index = nameList.firstIndex(of: listName)
                    hiddenList[index!] = true
                }else{
                    hiddenList[i] = false
                }
                i=i+1
            }
        }
        print(hiddenList)
        tableView.reloadData()
        //hidden에 의한 업데이트는 됨 근데 tableview를 클릭시 리스트가 뒤죽박죽임
        
    }
    @objc func setTitle(){
        var nickName: String = loadLocalName()//loadNickName()
        Label1.text = "\(nickName)님,\n연락하고 싶은 분이 생겼나요?"
    }
    @objc func loadLocalName()->String{
        var me = MyData.shared
        return me.name
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
    
    @objc func nextView(index:IndexPath) {
        let nextView = FriendProfileVC()
        friendData.choiceIndex = index
        nextView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextView, animated: true)
    }
    @objc func getData(){
        nameList = friendData.name
        nickNameList = friendData.nickName
        numberList = friendData.number
        checked = friendData.bestFriend
        alramList = friendData.alram
        timeList = friendData.time
        hiddenList = friendData.hidden
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
extension SearchController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendList")
        var selected = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        var unSelected = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height:30))
        if checked[indexPath.row] == true{
            cell?.accessoryView = UIImageView(image:selected)
        }else{
            cell?.accessoryView = UIImageView(image:unSelected)
        }
        cell?.textLabel?.text = nameList[indexPath.row]
        print(nameList[indexPath.row])
        //전화번호가 안나타남...
        //cell?.detailTextLabel?.text = numberList[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell?.textLabel?.textColor = UIColor.black
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell?.detailTextLabel?.textColor = UIColor.black
        return cell!
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        nextView(index:indexPath)
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
        
    }
    
    
    func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
        return 60
        //row 두께 설정
    }
    
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "friendList")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchFriendBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-10)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}
