//
//  GetInformatioinVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
import Contacts
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
    let friendTableView : UITableView = {
       let friendTableView = UITableView()
        friendTableView.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        return UITableView()
    }()
    
    
    
    func makeSubView(){
        view.addSubview(searchFriendBar)
        view.addSubview(friendTableView)
        view.addSubview(addBtn)
    }
    
    func makeConstraint(){
        searchFriendBar.translatesAutoresizingMaskIntoConstraints = false
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        friendTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchFriendBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchFriendBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchFriendBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            searchFriendBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            friendTableView.topAnchor.constraint(equalTo: searchFriendBar.bottomAnchor, constant: 5),
            friendTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            friendTableView.heightAnchor.constraint(equalToConstant: 40),
            addBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addBtn.heightAnchor.constraint(equalToConstant: 50),
            addBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            addBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            
        ])
    }
    var contacts: NSMutableArray = NSMutableArray()
    var nameList: Array<String> = []
    var familyNameList: Array<String> = []
    var numberList: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "주소록 불러오기"
        friendTableView.dataSource = self
        setNavigationBar()
        makeSubView()
        makeConstraint()
        downloadNumberBook()
    }
    
    @objc func downloadNumberBook(){
        // 연락처 권한 얻고 주소록 다운로드
        readContacts()
        // contacts에서 데이터 뽑아오기
        getFriendInfo()
        setTableViewCell()
    }
    @objc func getFriendInfo(){
        for contact in contacts {
            if let contact = contact as? CNContact {
                // CNContact에서 원하는 데이터 추출
                let givenName = contact.givenName
                let familyName = contact.familyName
                let phoneNumbers = contact.phoneNumbers.map { $0.value.stringValue }[0]
                nameList.append(givenName)
                familyNameList.append(familyName)
                numberList.append(phoneNumbers)
            }
        }
    }
    @objc func setTableViewCell(){
        
    }
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
}
extension GetInformationVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        <#code#>
    }
    
}
