//
//  GetInformatioinVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
import Contacts
class GetInformationVC : UIViewController {
    
    var addBtn : UIButton = UIButton()
    var searchFriendBar : UISearchBar = UISearchBar()
 
    
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
    @objc func setTime(){
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        friendTime.append(formatter.string(from: Date()))
    }
    
    @objc func makeAddTarget(){
        addBtn.addTarget(self, action: #selector(setData(_:)), for: .touchUpInside)
    }
    @objc func setData(_:UIButton){
        fre.name = friendName
        fre.number = friendNumber
        fre.bestFriend = friendBest
        fre.time = friendTime
        fre.alram = friendAlram
    }
    //tableView
    var tableView = UITableView(frame: .zero, style: .plain)
    let fre = Friends.shared
    
    var friendName: Array<String> = []
    var friendNickName: Array<String> = []
    var friendNumber: Array<String> = []
    var friendBest: Array<Bool> = []
    var friendAlram: Array<Bool> = []
    var friendTime: Array<String> = []
    var friendHidden: Array<Bool> = []
    
    //numberArray
    var contacts: NSMutableArray = NSMutableArray()
    var nameList: Array<String> = []
    var nickNameList: Array<String> = []
    var familyNameList: Array<String> = []
    var numberList: Array<String> = []
    var checked: Array<Bool> = []
    var alram: Array<Bool> = []
    var date: Array<String> = []
    var hidden: Array<Bool> = []
    var addFriendList: Array<String> = []
    var addNumberList: Array<String> = []
    
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
        getData()
        
    }
    @objc func getData(){
        friendName = fre.name
        friendNickName = fre.nickName
        friendNumber = fre.number
        friendBest = fre.bestFriend
        friendAlram = fre.alram
        friendTime = fre.time
    }
}
extension GetInformationVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberBook") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "numberBook")
        var image = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        
        cell.accessoryView = UIImageView(image:image)
        cell.textLabel?.text = familyNameList[indexPath.row]+nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.black
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        let cell = tableView.cellForRow(at: indexPath)
        
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
        if (checked[indexPath.row]==false) {
            cell?.accessoryView = UIImageView(image:selectedImage)
            checked[indexPath.row]=true
            friendName.append(familyNameList[indexPath.row]+nameList[indexPath.row])
            friendNickName.append("")
            friendNumber.append(numberList[indexPath.row])
            friendBest.append(false)
            friendAlram.append(true)
            friendHidden.append(false)
            setTime()
        } else {
            cell?.accessoryView = UIImageView(image:unSelectedImage)
            checked[indexPath.row]=false
            var index = friendNumber.firstIndex(of: numberList[indexPath.row])
            friendName.remove(at: index!)
            friendNickName.remove(at: index!)
            friendNumber.remove(at: index!)
            friendBest.remove(at: index!)
            friendTime.remove(at: index!)
            friendAlram.remove(at: index!)
            friendHidden.remove(at: index!)
        }
        //아래는 추가버튼 보이면 없앨 예정
        fre.name = friendName
        fre.number = friendNumber
        fre.bestFriend = friendBest
        fre.time = friendTime
        fre.alram = friendAlram
        fre.hidden = friendHidden
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
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
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
            if let contact = contact as? CNContact {
                // CNContact에서 원하는 데이터 추출
                let givenName = contact.givenName
                let familyName = contact.familyName
                let phoneNumbers = contact.phoneNumbers.map { $0.value.stringValue }[0]
                // 중복안되면 추가
                if (!checkDouble(phoneNumber: phoneNumbers)){
                    nameList.append(givenName)
                    familyNameList.append(familyName)
                    numberList.append(phoneNumbers)
                    checked.append(false)
                }
            }
        }
    }
    // 친구 목록에 있는 번호와 중복되면 true
    @objc func checkDouble(phoneNumber:String) -> Bool{
        let fre = Friends.shared
        let numberList = fre.number
        for check in numberList{
            if check == phoneNumber{
                return true;
            }
        }
        return false;
    }
    @objc func downloadNumberBook(){
        readContacts()
        getFriendInfo()
    }
}
