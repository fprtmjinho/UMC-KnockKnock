//
//  AddAlarmVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
class AddAlarmVC : UIViewController {
    
    
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
    
    let AlarmDatePicker : UIDatePicker = {
       let alarmDatePicker = UIDatePicker()
        alarmDatePicker.timeZone = .autoupdatingCurrent
        //현재 시간으로 업데이트
        
        alarmDatePicker.datePickerMode = .dateAndTime
        alarmDatePicker.preferredDatePickerStyle = .wheels
        alarmDatePicker.locale = Locale(identifier: "ko_KR")
        //속성을 영어에서 한글로 변경
        
        return alarmDatePicker
        
        //글씨 크기 수정 필요
    }()
    
    let saveDatePickerBtn : UIButton = {
       let saveDatePickerBtn = UIButton()
        saveDatePickerBtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        saveDatePickerBtn.setTitle("확인", for: .normal)
        saveDatePickerBtn.setTitleColor(.white, for: .normal)
        saveDatePickerBtn.layer.cornerRadius = 25
        saveDatePickerBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return saveDatePickerBtn
    }()
    
    let cancelDatePickerBtn : UIButton = {
       let cancelDatePickerBtn = UIButton()
        cancelDatePickerBtn.backgroundColor = .systemGray6
        cancelDatePickerBtn.setTitle("취소하기", for: .normal)
        cancelDatePickerBtn.setTitleColor(.black, for: .normal)
        cancelDatePickerBtn.layer.cornerRadius = 25
        cancelDatePickerBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return cancelDatePickerBtn
    }()
    
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
    
    
    
    
    let saveBtn : UIButton = {
       let savebtn = UIButton()
        savebtn.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        savebtn.setTitle("저장하기", for: .normal)
        savebtn.tintColor = .white
        savebtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        savebtn.layer.cornerRadius = 25
        return savebtn
    }()
    
    
    func makeSubView(){
        view.addSubview(AlarmMemoLabel)
        view.addSubview(AlarmMemoText)
        view.addSubview(AlarmTimeLabel)
        view.addSubview(AlarmDatePicker)
        view.addSubview(saveDatePickerBtn)
        view.addSubview(cancelDatePickerBtn)
        view.addSubview(loopLabel)
        view.addSubview(loopOnceBtn)
        view.addSubview(loopBtn)
        
        view.addSubview(saveBtn)
    }
    
    func makeConstraint(){
        AlarmMemoLabel.translatesAutoresizingMaskIntoConstraints = false
        AlarmMemoText.translatesAutoresizingMaskIntoConstraints = false
        AlarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        AlarmDatePicker.translatesAutoresizingMaskIntoConstraints = false
        saveDatePickerBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelDatePickerBtn.translatesAutoresizingMaskIntoConstraints = false
        loopLabel.translatesAutoresizingMaskIntoConstraints = false
        loopOnceBtn.translatesAutoresizingMaskIntoConstraints = false
        loopBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            AlarmMemoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            AlarmMemoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmMemoText.topAnchor.constraint(equalTo: AlarmMemoLabel.bottomAnchor, constant: 7),
            AlarmMemoText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmMemoText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            AlarmMemoText.heightAnchor.constraint(equalToConstant: 120),
            
            AlarmTimeLabel.topAnchor.constraint(equalTo: AlarmMemoText.bottomAnchor, constant: 30),
            AlarmTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmDatePicker.topAnchor.constraint(equalTo: AlarmTimeLabel.bottomAnchor, constant: 7),
            AlarmDatePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            AlarmDatePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            AlarmDatePicker.heightAnchor.constraint(equalToConstant: 130),
            
            saveDatePickerBtn.topAnchor.constraint(equalTo: AlarmDatePicker.bottomAnchor, constant: 10),
            saveDatePickerBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            saveDatePickerBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            saveDatePickerBtn.heightAnchor.constraint(equalToConstant: 50),
            cancelDatePickerBtn.topAnchor.constraint(equalTo: saveDatePickerBtn.bottomAnchor, constant: 10),
            cancelDatePickerBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            cancelDatePickerBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            cancelDatePickerBtn.heightAnchor.constraint(equalToConstant: 50),
            
            loopLabel.topAnchor.constraint(equalTo: cancelDatePickerBtn.bottomAnchor, constant: 30),
            loopLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            loopOnceBtn.topAnchor.constraint(equalTo: loopLabel.bottomAnchor, constant: 7),
            loopOnceBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loopOnceBtn.widthAnchor.constraint(equalToConstant: 160),
            loopOnceBtn.heightAnchor.constraint(equalToConstant: 45),
            loopBtn.topAnchor.constraint(equalTo: loopLabel.bottomAnchor, constant: 7),
            loopBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loopBtn.widthAnchor.constraint(equalToConstant: 160),
            loopBtn.heightAnchor.constraint(equalToConstant: 45),
            
        
            saveBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
            saveBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            saveBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            
        ])
        
    }
    
    func makeAddTarget(){
        self.saveBtn.addTarget(self, action: #selector(saveBtnPressed(_:)), for: .touchUpInside)
    }
    
    @objc func saveBtnPressed(_:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "연락 주기 및 예정 알림"
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
       
    }
    
}

