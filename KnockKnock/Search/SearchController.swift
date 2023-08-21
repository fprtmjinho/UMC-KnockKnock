//
//  SearchController.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/25.
//
import UIKit
import SDWebImage
class SearchController : UIViewController{
    //친구 찾기 페이지
    
    let searchBar : UISearchBar = {
        let searchBar = UISearchBar()

        searchBar.placeholder = "친구를 검색해주세요!"
        searchBar.isTranslucent = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .white
        searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)])),
                                 for: .search, state: .normal)

        searchBar.layer.shadowColor = UIColor.black.cgColor
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        searchBar.layer.shadowRadius = 4
        searchBar.layer.shadowOpacity = 0.3
        return searchBar
    }()
    
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
    
    
    
    var tableView = UITableView(frame: .zero, style: .plain)
    
    let friendData = Friends.shared
    let me = MyData.shared
    
    var keyList: Array<Int> = []
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var nickNameList: Array<String> = []
    var bestFriendList: Array<Bool> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        handleEditFunc()
        view.backgroundColor = .white
        print("SearchController")
        getServerData()
//        getData()
//        sortData()
        customNavigationBar()
        makeSubView()
        makeConstraint()
        setTableView()
        makeAddTarget()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        var nickName: String = loadLocalName()
        Label1.text = "\(nickName)님,\n연락하고 싶은 분이 생겼나요?"
        getServerData()
//        getData()
//        sortData()
//        tableView.reloadData()
//        setTableView()
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
        //return searchName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "friendList")

        let selected = UIImage(named: "BF")?.resizeImageTo(size: CGSize(width: 65, height: 25))
        let unSelected = UIImage(named: "expand")?.resizeImageTo(size: CGSize(width: 25, height:25))
        if bestFriendList[indexPath.row] == true{
            cell.accessoryView = UIImageView(image: selected)
        }else{
            cell.accessoryView = UIImageView(image:unSelected)
        }
        cell.backgroundColor = .systemGray6
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = UIColor.systemGray2
        return cell
       
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteServerData(index: keyList[indexPath.row])
            friendData.dic1[keyList[indexPath.row]] = nil
            nameList.remove(at: indexPath.row)
            nickNameList.remove(at: indexPath.row)
            numberList.remove(at: indexPath.row)
            bestFriendList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //remove 확인용 alarm 필요
        }
        //화이팅!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        friendSelect(index:indexPath)
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-10)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}

extension SearchController {
    func makeSubView(){
        view.addSubview(backgroundView)
        view.addSubview(Label1)
        view.addSubview(Label2)
        view.addSubview(searchBar)
        
    }
    
    func makeConstraint(){
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        Label1.translatesAutoresizingMaskIntoConstraints = false
        Label2.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 250),
            
            Label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 7),
            Label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            Label2.topAnchor.constraint(equalTo: Label1.bottomAnchor, constant: 10),
            Label2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            searchBar.centerYAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
        ])
        
    }
    func makeAddTarget(){
        searchBar.searchTextField.addTarget(self, action: #selector(searchFriend(_:)), for: .editingChanged)
    }
    
    @objc func sortData(){
        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList, zip(nickNameList,zip(numberList, zip(bestFriendList,keyList).map{($0, $1)}).map{($0, $1)}).map{($0, $1)}).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        nickNameList = combinedList.map {$0.1.0}
        numberList = combinedList.map { $0.1.1.0 }
        bestFriendList = combinedList.map { $0.1.1.1.0 }
        keyList = combinedList.map { $0.1.1.1.1}
    }
    
    @objc func searchFriend(_:UISearchBar){
        print("searchFriend")
        var friendName: String = ""
        if let name = searchBar.text{
            friendName = name
        }
        loadFriendArray(name: friendName)
    }
    @objc func loadFriendArray(name: String){
        var keyCh: Array<Int> = []
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
        var nickNameCh: Array<String> = []
        var bestFriendCh: Array<Bool> = []
        if name == ""{
            for key in friendData.dic1.keys{
                let dic = friendData.dic1[key]
                keyCh.append(key)
                nameCh.append(dic!.name)
                nickNameCh.append(dic!.nickName)
                numberCh.append(dic!.number)
                bestFriendCh.append(dic!.bestFriend)
            }
        }else{
            for key in friendData.dic1.keys{
                let dic = friendData.dic1[key]
                if dic!.name.contains(name){
                    keyCh.append(key)
                    nameCh.append(dic!.name)
                    nickNameCh.append(dic!.nickName)
                    numberCh.append(dic!.number)
                    bestFriendCh.append(dic!.bestFriend)
                }
            }
        }
        keyList = keyCh
        nameList = nameCh
        nickNameList = nickNameCh
        numberList = numberCh
        bestFriendList = bestFriendCh
        sortData()
        tableView.reloadData()
        setTableView()
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
    
    @objc func friendSelect(index:IndexPath) {
        let friendSelect = FriendProfileVC()
        friendData.choiceIndex = keyList[index.row]
        friendSelect.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(friendSelect, animated: true)
    }
//    @objc func getData(){
//        var nameCh: Array<String> = []
//        var numberCh: Array<String> = []
//        var nickNameCh: Array<String> = []
//        var bestFriendCh: Array<Bool> = []
//        var alramCh: Array<Bool> = []
//        var timeCh: Array<String> = []
//        requestFriendData()
//    }
//    func requestFriendData(){
//
//    }
    @objc func getServerData(){
        let friendURLString = "http://\(Server.url)/friends"
        guard let friendURL = URL(string: friendURLString) else {
            print("친구 정보를 가져올 수 없습니다.")
            return
        }
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        var friendRequest = URLRequest(url: friendURL)
        friendRequest.httpMethod = "GET"
        friendRequest.addValue(accessToken!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: friendRequest) { data, response, error in
            guard let data = data else {
                print("친구 정보를 받아오지 못했습니다.")
                return
            }
            do {
                let user = try JSONDecoder().decode(FriendDataGet.self, from: data)
//                print("친구 정보: \(user)")
                let fre = Friends.shared
                let data = user.data
                for datas in data{
                    let freData: Info2 = Info2(
                        name: datas.friendName,
                        nickName: "",//datas.friendNickName 현재는 비어있음
                        number: datas.phoneNumber,
                        bestFriend: datas.bestFriend,
                        imageURL: datas.profileImageURL
                    )
//                    print("freData:\(freData)")
                    fre.dic1[datas.friendId] = freData
                }
            } catch {
                print("친구 정보 디코딩에 실패하였습니다.")
            }
            DispatchQueue.main.async {
                self.getData()
                self.sortData()
                self.tableView.reloadData()
            }
        }.resume()
    }
    @objc func deleteServerData(index:Int){
        let friendURLString = "http://\(Server.url)friends/\(index)"
        guard let friendURL = URL(string: friendURLString) else {
            print("친구 정보를 가져올 수 없습니다.")
            return
        }
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        var friendRequest = URLRequest(url: friendURL)
        friendRequest.httpMethod = "DELETE"
        friendRequest.addValue(accessToken!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: friendRequest) { data, response, error in
            guard let data = data else {
                print("친구 정보를 받아오지 못했습니다.")
                return
            }
        }.resume()
    }
    @objc func getData(){
        var keyCh: Array<Int> = []
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
        var nickNameCh: Array<String> = []
        var bestFriendCh: Array<Bool> = []
        for key in friendData.dic1.keys{
            var dic = friendData.dic1[key]
            let url = URL(string: friendData.dic1[key]!.imageURL)
            SDWebImageDownloader.shared.downloadImage(with: url) { (image, _, _, _) in
                if let image = image {
                    self.friendData.dic1[key]!.image = image
                }
            }
            keyCh.append(key)
            nameCh.append(dic!.name)
            numberCh.append(dic!.number)
            nickNameCh.append(dic!.nickName)
            bestFriendCh.append(dic!.bestFriend)
        }
        keyList = keyCh
        nameList = nameCh
        numberList = numberCh
        nickNameList = nickNameCh
        bestFriendList = bestFriendCh
    }

}
