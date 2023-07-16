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
        addBtn = setNextBtn(view: self, title: "추가하기")
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
    var contacts: NSMutableArray = NSMutableArray()

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "주소록 불러오기"
        setNavigationBar()
        makeSubView()
        makeConstraint()
        downloadNumberBook()
    }
    
    @objc func downloadNumberBook(){
        readContacts()
    }
}
