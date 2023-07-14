//
//  AddAlarmVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
class AddAlarmVC : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
    let AlarmMemoLabel : UILabel = {
       let alarmMemoLabel = UILabel()
        alarmMemoLabel.text = "알림 메모"
        alarmMemoLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return alarmMemoLabel
    }()
    
    let AlarmMemoText : UITextField = {
       let alarmMemoText = UITextField()
        alarmMemoText.placeholder = "알림 메모를 입력해주세요\n(최대 45자)"
        alarmMemoText.addLeftPadding()
        alarmMemoText.contentVerticalAlignment = .top
        alarmMemoText.contentHorizontalAlignment = .left
        
        alarmMemoText.backgroundColor = .systemGray6
        alarmMemoText.layer.cornerRadius = 5
        return alarmMemoText
    }()
    
    let AlarmTimeLabel : UILabel = {
       let alarmTimeLabel = UILabel()
        alarmTimeLabel.text = "알림 일시"
        alarmTimeLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return alarmTimeLabel
    }()
    
    
    let SetDatePickerBtn : UIButton = {
        let Btn = UIButton()
        Btn.setTitle("+ Alarm Date", for: .normal)
        Btn.backgroundColor = .systemGray6
        Btn.setTitleColor(.black, for: .normal)
        Btn.layer.cornerRadius = 25
        return Btn
    }()
    //DatePicker 팝업 뜨도록
    //임의로 버튼 지정
    //추후 디자이너님과 상의 후 변경

    
    let loopLabel : UILabel = {
       let loopLabel = UILabel()
        loopLabel.text = "반복 주기"
        loopLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return loopLabel
    }()
    
    let loopOnceBtn : UIButton = {
       let loopOnceBtn = UIButton()
        loopOnceBtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        loopOnceBtn.setTitle("한 번만 알림", for: .normal)
        loopOnceBtn.setTitleColor(.white, for: .normal)
        loopOnceBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        loopOnceBtn.layer.cornerRadius = 20
        return loopOnceBtn
    }()
    
    let loopBtn : UIButton = {
       let loopBtn = UIButton()
        loopBtn.backgroundColor = .systemGray6
        loopBtn.setTitle("매년 알림", for: .normal)
        loopBtn.setTitleColor(.black, for: .normal)
        loopBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        loopBtn.layer.cornerRadius = 20
        return loopBtn
    }()
    

    
    func makeSubView(){
        view.addSubview(AlarmMemoLabel)
        view.addSubview(AlarmMemoText)
        view.addSubview(AlarmTimeLabel)
        
        view.addSubview(SetDatePickerBtn)
        //임시 버튼
       
        view.addSubview(loopLabel)
        view.addSubview(loopOnceBtn)
        view.addSubview(loopBtn)
      
    }
    
    func makeConstraint(){
        AlarmMemoLabel.translatesAutoresizingMaskIntoConstraints = false
        AlarmMemoText.translatesAutoresizingMaskIntoConstraints = false
        AlarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
       
        SetDatePickerBtn.translatesAutoresizingMaskIntoConstraints = false
        //임시 버튼
        
        loopLabel.translatesAutoresizingMaskIntoConstraints = false
        loopOnceBtn.translatesAutoresizingMaskIntoConstraints = false
        loopBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            AlarmMemoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            AlarmMemoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmMemoText.topAnchor.constraint(equalTo: AlarmMemoLabel.bottomAnchor, constant: 7),
            AlarmMemoText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmMemoText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            AlarmMemoText.heightAnchor.constraint(equalToConstant: 120),
            
            AlarmTimeLabel.topAnchor.constraint(equalTo: AlarmMemoText.bottomAnchor, constant: 30),
            AlarmTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            
            
            SetDatePickerBtn.topAnchor.constraint(equalTo: AlarmTimeLabel.bottomAnchor, constant: 7),
            SetDatePickerBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            SetDatePickerBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            SetDatePickerBtn.heightAnchor.constraint(equalToConstant: 50),
            //임시 버튼 constraint
            
            
            loopLabel.topAnchor.constraint(equalTo:SetDatePickerBtn.bottomAnchor, constant: 30),
            loopLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            loopOnceBtn.topAnchor.constraint(equalTo: loopLabel.bottomAnchor, constant: 7),
            loopOnceBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loopOnceBtn.widthAnchor.constraint(equalToConstant: 160),
            loopOnceBtn.heightAnchor.constraint(equalToConstant: 45),
            loopBtn.topAnchor.constraint(equalTo: loopLabel.bottomAnchor, constant: 7),
            loopBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loopBtn.widthAnchor.constraint(equalToConstant: 160),
            loopBtn.heightAnchor.constraint(equalToConstant: 45),
            
            
        ])
        
    }
    
    func makeAddTarget(){
        self.SetDatePickerBtn.addTarget(self, action: #selector(setDataPickerBtnFunc(_:)), for: .touchUpInside)
        self.saveBtn.addTarget(self, action: #selector(saveBtnPressed(_:)), for: .touchUpInside)
    }
    
    @objc func setDataPickerBtnFunc(_: UIButton){
        alarmDatePicker()
    }
    //임시 버튼 addtarget
    
    
    
    @objc func saveBtnPressed(_:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    
    //팝업으로 DatePicker 구현
    func alarmDatePicker(){
        
        let alert = UIAlertController(title: "날짜 고르기", message: "날짜를 골라주세요", preferredStyle: .actionSheet)
        let alarmDatePicker = UIDatePicker()
        alarmDatePicker.datePickerMode = .dateAndTime
        alarmDatePicker.timeZone = .autoupdatingCurrent
        //현재 시간으로 업데이트
        alarmDatePicker.preferredDatePickerStyle = .wheels
        alarmDatePicker.locale = Locale(identifier: "ko_KR")
        
                
        
        let saveBtn = UIAlertAction(title: "확인", style: .default) { action in
            let dateFormat = DateFormatter()
            dateFormat.timeStyle = .short
            dateFormat.dateStyle = .long
            
            let AlarmDate = dateFormat.string(from: alarmDatePicker.date)
            
            self.SetDatePickerBtn.setTitle("\(AlarmDate)", for: .normal)
            //DatePicker의 date를 btn의 title로 설정
        }
        let cancelBtn = UIAlertAction(title: "취소하기", style: .cancel)
                        
        
        alert.addAction(saveBtn)
        alert.addAction(cancelBtn)
                
        let vc = UIViewController()
        vc.view = alarmDatePicker
        
        
        alert.setValue(vc, forKey: "contentViewController")
        self.present(alert, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "연락 주기 및 예정 알림"
        setNavigationBar()
        saveBtn = setNextBtn(view: self, title: "저장하기")
        makeSubView()
        makeConstraint()
        makeAddTarget()
      
       
    }
    
}

