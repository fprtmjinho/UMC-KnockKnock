//
//  LoginAddFriendVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/11.
//

import UIKit
import Contacts
class LoginAddFriendVC : AllowApproachVC {
    
    var searchFriendBar : UISearchBar = UISearchBar()

    
   override func makeSubView(){
       view.addSubview(titleLabel)
       view.addSubview(subtitleLabel)
       nextBtn = setNextBtn(view: self, title: "다음")
       searchFriendBar = setSearchBar(VC: self, title: "친구를 입력해주세요")
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
        nextBtn.addTarget(self, action: #selector(nextView(_:)), for: .touchUpInside)
     
    }
    
    
    @objc func nextView(_: UIButton){
        setFriendData()
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
    @objc func setFriendData(){
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var i=0
        var j=0
        for check in checked{
            if check == true{
                addFriendList.append(familyNameList[i]+nameList[i])
                addNumberList.append(numberList[i])
                alram.append(true)
                date.append(formatter.string(from: Date()))
                j=j+1
            }
            i=i+1
        }
        let fre = Friends.shared
        fre.name = addFriendList
        fre.nickName = nickNameList
        fre.number = addNumberList
        fre.alram = alram
        fre.time = date
    }
    //tableView
    var tableView = UITableView(frame: .zero, style: .plain)
    
    //numberArray
    var contacts: NSMutableArray = NSMutableArray()
    var nameList: Array<String> = []
    var familyNameList: Array<String> = []
    var numberList: Array<String> = []
    var nickNameList: Array<String> = []
    var checked: Array<Bool> = []
    var alram: Array<Bool> = []
    var date: Array<String> = []
    var addFriendList: Array<String> = []
    var addNumberList: Array<String> = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        downloadNumberBook()
        
        setTableView()
        makeSubView()
        makeConstraint()
        makeAddTarget()
        setNavigationBar()
        setLabel()
       
    }
}


extension LoginAddFriendVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberBook")
        var image = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        cell?.accessoryView = UIImageView(image:image)
        cell?.textLabel?.text = familyNameList[indexPath.row]+nameList[indexPath.row]
        //전화번호가 안나타남...
        //cell?.detailTextLabel?.text = numberList[indexPath.row]
        
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell?.textLabel?.textColor = UIColor.black
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell?.detailTextLabel?.textColor = UIColor.black
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unSelectedImage = UIImage(named: "UnselectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        let selectedImage = UIImage(named: "SelectedCheckCircle")?.resizeImageTo(size: CGSize(width: 30, height: 30))
        let cell = tableView.cellForRow(at: indexPath)
        
        //cell 클릭시 체크가 안되어있으면 체크, 체크가 되어있으면 체크풀기
        if (checked[indexPath.row]==false) {
            cell?.accessoryView = UIImageView(image:selectedImage)
            checked[indexPath.row]=true
        } else {
            cell?.accessoryView = UIImageView(image:unSelectedImage)
            checked[indexPath.row]=false
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "numberBook")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchFriendBar.bottomAnchor, constant: 3),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}




extension LoginAddFriendVC {
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
                nameList.append(givenName)
                nickNameList.append("")
                familyNameList.append(familyName)
                numberList.append(phoneNumbers)
                checked.append(false)
            }
        }
    }
    @objc func downloadNumberBook(){
        readContacts()
        getFriendInfo()
    }
}
