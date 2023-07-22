//
//  LoginAddBestFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
class LoginAddBestFriendVC : AllowApproachVC {
    //이전 VC 상속
    
    var searchFriendBar : UISearchBar = UISearchBar()
    
    override func makeSubView(){
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요")
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    override func makeConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            searchFriendBar.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
        ])
    }
    
   override func makeAddTarget(){
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipBtnFunc(_:)))
        self.nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
       searchFriendBar.searchTextField.addTarget(self, action: #selector(searchFriend(_:)), for: .editingChanged)
    }
    
    @objc func nextView(_: UIButton){
        setFriendData()
        let loginSuccessVC = LoginSuccessVC()
        self.navigationController?.pushViewController(loginSuccessVC, animated: true)
    }
    @objc override func skipBtnFunc(_: UIBarButtonItem){
        let loginSuccessView = LoginSuccessVC()
        navigationController?.pushViewController(loginSuccessView, animated: true)
    }
    
    @objc func setLabel(){
        titleLabel.text = "정말 친한 친구,\n'찐친'을 골라주세요!"
        subtitleLabel.text = "자신과 정말 친한 찐친들의 연락처를 골라주세요.\n\n2개월에 한 번씩 알림을 보내드릴게요.\n연락 주기는 추후에 변경이 가능합니다!"
    }
    //일부 글씨만 두껍게 수정해야 함
    let friendData = Friends.shared
    
    var checked: Array<Bool> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var date: Array<String> = []
    var tableView = UITableView(frame: .zero, style: .plain)
    
    var dic: [String:Info] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        getData()
        
        setTableView()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        
        setLabel()
    }
    @objc func getData(){
        for key in friendData.dic.keys{
            nameList.append(friendData.dic[key]!.name)
            numberList.append(key)
            checked.append(false)
            date.append(friendData.dic[key]!.time)
            let info: Info = Info(
                name: friendData.dic[key]!.name,
                nickName: "",
                bestFriend: false,
                alram: false,
                time: friendData.dic[key]!.time)
            dic[key] = info
        }
    }
    @objc func setFriendData(){
        let fre = Friends.shared
        var i=0
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        for key in dic.keys{
            let ddic = dic[key]
            if ddic!.bestFriend == true{
                var addInfo: Info = Info(
                    name:ddic!.name,
                    nickName: "",
                    bestFriend: true,
                    alram: true,
                    time:formatter.string(from: Date())
                )
                fre.dic[key] = addInfo
            }
            i=i+1
        }
    }
    
}
extension LoginAddBestFriendVC{
    @objc func searchFriend(_:UISearchBar){
        print("searchFriend")
        var friendName: String = ""
        if let name = searchFriendBar.text{
            friendName = name
        }
        loadFriendArray(name: friendName)
    }
    @objc func loadFriendArray(name: String){
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
        var bestFriendCh: Array<Bool> = []
        if name == ""{
            for key in dic.keys{
                let dics = dic[key]
                nameCh.append(dics!.name)
                numberCh.append(key)
                bestFriendCh.append(dics!.bestFriend)
            }
        }else{
            for key in dic.keys{
                let dics = dic[key]
                if dics!.name.contains(name){
                    nameCh.append(dics!.name)
                    numberCh.append(key)
                    bestFriendCh.append(dics!.bestFriend)
                }
            }
        }
        nameList = nameCh
        numberList = numberCh
        checked = bestFriendCh
        tableView.reloadData()
        setTableView()
        nextBtn = setNextBtn(view: self, title: "다음")
        makeAddTarget()
    }
}
extension LoginAddBestFriendVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "friendList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "friendList")
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
    if (checked[indexPath.row]==true) {
        cell.accessoryView = UIImageView(image:selectedImage)
    }
    else if (checked[indexPath.row]==false) {
        cell.accessoryView = UIImageView(image:unSelectedImage)
    }
            cell.textLabel?.text = nameList[indexPath.row]
            cell.detailTextLabel?.text = numberList[indexPath.row]
            
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
            cell.detailTextLabel?.textColor = UIColor.systemGray2
            checked.append(false)
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let cell = tableView.cellForRow(at: indexPath)
        
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
        if (checked[indexPath.row]==false) {
            cell?.accessoryView = UIImageView(image:selectedImage)
            checked[indexPath.row]=true
            let info:Info = Info(
                name: dic[numberList[indexPath.row]]!.name,
                nickName: "",
                bestFriend: true,
                alram: false,
                time: "")
            dic[numberList[indexPath.row]] = info
        } else {
            cell?.accessoryView = UIImageView(image:unSelectedImage)
            checked[indexPath.row]=false
            let info:Info = Info(
                name: dic[numberList[indexPath.row]]!.name,
                nickName: "",
                bestFriend: false,
                alram: false,
                time: "")
            dic[numberList[indexPath.row]] = info
        }
    }
    
    
    func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat{
        return 60
        //row 두께 설정
    }
    
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchFriendBar.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}
