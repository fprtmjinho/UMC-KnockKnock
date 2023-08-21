//
//  GetInformatioinVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
import Contacts
import Alamofire
class GetInformationVC : UIViewController {
    
    var addBtn : UIButton = UIButton()
    var searchFriendBar : UISearchBar = UISearchBar()
//    let friendURLString = "http://43.200.240.251/friends"
    let friendURLString = "http://\(Server.url)/friends"
    
 
    
   
    //tableView
    var tableView = UITableView(frame: .zero, style: .plain)
    let fre = Friends.shared
    
    //numberArray
    var contacts: NSMutableArray = NSMutableArray()
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var checked: Array<Bool> = []
    
    var currentDic: [String:Info] = [:]
    var requestDic: [String:Info2] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "주소록 불러오기"
        downloadNumberBook()
        setNavigationBar()
        makeSubView()
        makeConstraint()
        setTableView()
        addBtn = setNextBtn(view: self, title: "추가하기")
        makeAddTarget()
    }
}
extension GetInformationVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberBook") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "numberBook")
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
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        let cell = tableView.cellForRow(at: indexPath)
        
        if (checked[indexPath.row]==false) {
            cell?.accessoryView = UIImageView(image:selectedImage)
            checked[indexPath.row]=true
            let info:Info = Info(
                name: currentDic[numberList[indexPath.row]]!.name,
                nickName: "",
                bestFriend: true,
                image: "")
            currentDic[numberList[indexPath.row]] = info
        } else {
            cell?.accessoryView = UIImageView(image:unSelectedImage)
            checked[indexPath.row]=false
            let info:Info = Info(
                name: currentDic[numberList[indexPath.row]]!.name,
                nickName: "",
                bestFriend: false,
                image: "")
            currentDic[numberList[indexPath.row]] = info
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
            tableView.topAnchor.constraint(equalTo: searchFriendBar.bottomAnchor, constant: 3),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}

extension GetInformationVC {
    //주소록 읽어오기
    
    private func readContacts() {
        let store = CNContactStore()
        
        // Permission 획득
        store.requestAccess(for: .contacts) { (granted, error) in
            guard granted else {
                return;
            }
            // Request 생성
            let request: CNContactFetchRequest = self.getCNContactFetchRequest()
            
            // 주소록 읽을 때 정렬해서 읽어오도록 설정
            request.sortOrder = CNContactSortOrder.userDefault
            
            // Contacts 읽기
            // 주소록이 1개씩 읽혀서 usingBlock으로 들어온다.
            try! store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                
                // Phone No가 없을때 return
                if contact.phoneNumbers.isEmpty {
                    return
                }
                
                // NSMutableArray Add contact
                // 읽어온 주소록을 NSMutableArray에 저장
                self.contacts.add(contact)
            })
            self.saveContact()
        }
    }
    private func saveContact() {
        
        let store = CNContactStore()
        
        // Permission 획득
        store.requestAccess(for: .contacts) { (granted, error) in
            guard granted else {
                return;
            }
            
            let contact:CNMutableContact = self.getNewContact()
            
            let request = CNSaveRequest()
            request.add(contact, toContainerWithIdentifier:nil)
            
            // 저장
            try! store.execute(request)
        }
    }
    
    // 새로 등록할 주소록 생성
    private func getNewContact() -> CNMutableContact {
        let contact = CNMutableContact()
        contact.givenName = "name"
        contact.familyName = "familyName"
        
        let phone = CNLabeledValue(label:CNLabelPhoneNumberMobile,
                                   value:CNPhoneNumber(stringValue:"010-0000-0000"))
        let tel = CNLabeledValue(label:CNLabelPhoneNumberMain,
                                 value:CNPhoneNumber(stringValue:"02-0000-0000"))
        contact.phoneNumbers = [phone, tel]
        
        let email: NSString = "bizCard@gmail.com"
        contact.emailAddresses = [CNLabeledValue(label:CNLabelWork, value:email)]
        
        return contact
    }
    
    
    // Request 생성
    private func getCNContactFetchRequest() -> CNContactFetchRequest {
        // 주소록에서 읽어올 key 설정
        let keys: [CNKeyDescriptor] = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                                       CNContactPhoneNumbersKey,
                                       CNContactEmailAddressesKey,
                                       CNContactJobTitleKey,
                                       CNContactPostalAddressesKey] as! [CNKeyDescriptor]
        
        return CNContactFetchRequest(keysToFetch: keys)
    }
    @objc func getFriendInfo(){
        for contact in contacts {
            var flag: Bool = false
            if let contact = contact as? CNContact {
                // CNContact에서 원하는 데이터 추출
                let givenName = contact.givenName
                let familyName = contact.familyName
                let phoneNumbers = contact.phoneNumbers.map { $0.value.stringValue }[0]
                if !currentDic.keys.contains(phoneNumbers){
                    for key in fre.dic1.keys{
                        if fre.dic1[key]!.number == phoneNumbers{
                            //중복됨
//                            nameList.append(familyName+givenName)
//                            numberList.append(phoneNumbers)
//                            checked.append(true)
                            flag=true
                            let info:Info = Info(
                                name: familyName+givenName,
                                nickName: "",
                                bestFriend: true,
                                image: "")
                            currentDic[phoneNumbers] = info
                            break
                        }
                    }
                    if !flag{
                        nameList.append(familyName+givenName)
                        numberList.append(phoneNumbers)
                        checked.append(false)
                        let info:Info = Info(
                            name: familyName+givenName,
                            nickName: "",
                            bestFriend: false,
                            image: "")
                        currentDic[phoneNumbers] = info
                    }
                    
                }
//                if !fre.dic.keys.contains(phoneNumbers){
//                    if !currentDic.keys.contains(phoneNumbers){
//                        nameList.append(familyName+givenName)
//                        numberList.append(phoneNumbers)
//                        checked.append(false)
//                    }
//                    let info:Info = Info(
//                        name: familyName+givenName,
//                        nickName: "",
//                        bestFriend: false,
//                        alram: false,
//                        time: "")
//                    currentDic[phoneNumbers] = info
//                }
            }
        }
    }
    
    @objc func downloadNumberBook(){
        readContacts()
        getFriendInfo()
    }
}

extension GetInformationVC {
    func makeSubView(){
        
        searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요!")
    }
    
    func makeConstraint(){
       
        NSLayoutConstraint.activate([
            searchFriendBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            searchFriendBar.heightAnchor.constraint(equalToConstant: 45),
            ])
    }
    
    @objc func makeAddTarget(){
        addBtn.addTarget(self, action: #selector(setData(_:)), for: .touchUpInside)
        searchFriendBar.searchTextField.addTarget(self, action: #selector(searchFriend(_:)), for: .editingChanged)
    }
    @objc func sortData(){
        // 이름, 전화번호, 나이를 튜플로 묶은 배열 생성
        var combinedList = zip(nameList, zip(numberList,checked).map{($0,$1)}).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        numberList = combinedList.map { $0.1.0 }
        checked = combinedList.map { $0.1.1 }
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
        var nameCh: Array<String> = []
        var numberCh: Array<String> = []
        var bestFriendCh: Array<Bool> = []
        if name == ""{
            for key in currentDic.keys{
                let dics = currentDic[key]
                nameCh.append(dics!.name)
                numberCh.append(key)
                bestFriendCh.append(dics!.bestFriend)
            }
        }else{
            for key in currentDic.keys{
                let dics = currentDic[key]
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
        sortData()
        tableView.reloadData()
        setTableView()
        addBtn = setNextBtn(view: self, title: "다음")
        makeAddTarget()
    }
    //여기 부분에서 서버랑 통신할때 가져오는 값을 알아야할듯
    @objc func setData(_:UIButton){
        var friendData: [PostFriendRequest] = []
        for key in currentDic.keys{
            let ddic = currentDic[key]
            if ddic!.bestFriend == true{
                var data = PostFriendRequest(
                   friendName: currentDic[key]!.name,
                   nickName: currentDic[key]!.nickName,
                   phoneNumber: key
                )
                friendData.append(data)
//                if !fre.dic1.keys.contains(key){
//                    var addInfo: Info2 = Info2(
//                        name:ddic!.name,
//                        nickName: "",
//                        number: key,
//                        bestFriend: false,
//                        alram: true,
//                        time:formatter.string(from: Date())
//                    )
//                    fre.dic1[friendKey] = addInfo
//                    var addInfo: Info = Info(
//                        name:ddic!.name,
//                        nickName: "",
//                        bestFriend: false,
//                        alram: true,
//                        time:formatter.string(from: Date())
//                    )
//                    fre.dic[key] = addInfo
//                }
            }
        }
        print("frinedData:\(friendData)")
        performFriends(friendData:friendData)
        navigationController?.popViewController(animated: true)
    }
    func performFriends(friendData:[PostFriendRequest]){
        
        guard let url = URL(string: friendURLString) else {
            print("서버 URL을 만들 수 없습니다.")
            return
        }
        let accessToken = UserDefaults.standard.string(forKey: "Authorization")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Authorization": accessToken!]
        
        do {
            let jsonData = try JSONEncoder().encode(friendData)
            request.httpBody = jsonData
        } catch {
            print("JSON 인코딩에 실패하였습니다.")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("네트워크 에러: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 HTTP 응답이 아닙니다.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            print("HTTP 상태 코드: \(statusCode)")
        }.resume()
//        AF.upload(multipartFormData: { multipartFormData in
//            if let friendsJSONData = try? JSONEncoder().encode(friendData) {
//                multipartFormData.append(friendsJSONData, withName: "request", mimeType: "application/json")
//            }
//            if let profileImage = UIImage(systemName: "person.circle.fill"),
//               let profileImageData = profileImage.jpegData(compressionQuality: 0.9) {
//                multipartFormData.append(profileImageData, withName: "profileImage", fileName: "profileImage.jpeg", mimeType: "image/jpeg")
//            }
//        }, to: friendURLString)
//        .response { response in
//            switch response.result {
//            case .success:
//                if let statusCode = response.response?.statusCode {
//                    print("HTTP Status Code: \(statusCode)")
//
//                    if let responseData = response.data {
//                        do {
//                            let decoder = JSONDecoder()
//                            let friendsResponse = try decoder.decode(PostFriendResponse.self, from: responseData)
//                            //리스폰스로 키값받으면저장
//                            //friendKey = friendsResponse.???
//                            print("Sign Up Response: \(friendsResponse)")
//                        } catch {
//                            print("JSON Decoding Error: \(error)")
//                        }
//                    }
//
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
    }
}
