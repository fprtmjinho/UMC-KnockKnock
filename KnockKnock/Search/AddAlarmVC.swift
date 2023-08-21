//
//  AddAlarmVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/10.
//

import UIKit
class AddAlarmVC : UIViewController {
    
    var saveBtn : UIButton = UIButton()
    
    
    let AlarmTimeLabel : UILabel = {
       let alarmTimeLabel = UILabel()
        alarmTimeLabel.text = "알림 일시"
        alarmTimeLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return alarmTimeLabel
    }()
    
    
    let SetDatePickerBtn : UIButton = {
        let btn = UIButton()
             var title = AttributedString("+ Alarm Date")
             title.foregroundColor = .black
             var config = UIButton.Configuration.filled()
             config.cornerStyle = .capsule
             config.baseBackgroundColor = .systemGray6
             config.attributedTitle = title
             btn.configuration = config
             return btn
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
        let btn = UIButton()
               var title = AttributedString("한 번만 알림")
               title.font = UIFont.boldSystemFont(ofSize: 17)
               title.foregroundColor = .black
               var config = UIButton.Configuration.filled()
               config.cornerStyle = .capsule
               config.baseBackgroundColor = .systemGray6
               config.attributedTitle = title
               btn.configuration = config
               return btn
    }()
    
    let loopBtn : UIButton = {
        let btn = UIButton()
               var title = AttributedString("매년 알림")
               title.font = UIFont.boldSystemFont(ofSize: 17)
               var config = UIButton.Configuration.filled()
               config.cornerStyle = .capsule
               config.baseBackgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
               config.attributedTitle = title
               btn.configuration = config
               return btn
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.handleEditFunc()
        view.backgroundColor = .white
        self.title = "연락 주기 및 예정 알림"
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
      
       
    }
    
}

extension AddAlarmVC {
    func makeSubView(){
        view.addSubview(AlarmTimeLabel)
        view.addSubview(SetDatePickerBtn)
       
        view.addSubview(loopLabel)
        view.addSubview(loopOnceBtn)
        view.addSubview(loopBtn)
        saveBtn = setNextBtn(view: self, title: "저장하기")
    }
    
    func makeConstraint(){
        AlarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        SetDatePickerBtn.translatesAutoresizingMaskIntoConstraints = false
        
        loopLabel.translatesAutoresizingMaskIntoConstraints = false
        loopOnceBtn.translatesAutoresizingMaskIntoConstraints = false
        loopBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            
            AlarmTimeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            AlarmTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            SetDatePickerBtn.topAnchor.constraint(equalTo: AlarmTimeLabel.bottomAnchor, constant: 7),
            SetDatePickerBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            SetDatePickerBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            SetDatePickerBtn.heightAnchor.constraint(equalToConstant: 50),
            
            loopLabel.topAnchor.constraint(equalTo:SetDatePickerBtn.bottomAnchor, constant: 50),
            loopLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            loopOnceBtn.topAnchor.constraint(equalTo: loopLabel.bottomAnchor, constant: 7),
            loopOnceBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loopOnceBtn.widthAnchor.constraint(equalToConstant: 160),
            loopOnceBtn.heightAnchor.constraint(equalToConstant: 40),
            loopBtn.topAnchor.constraint(equalTo: loopOnceBtn.topAnchor),
            loopBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loopBtn.leadingAnchor.constraint(equalTo: loopOnceBtn.trailingAnchor, constant: 10),
            loopBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
        ])
        
    }
    
    func makeAddTarget(){
        self.SetDatePickerBtn.addTarget(self, action: #selector(setDataPickerBtnFunc(_:)), for: .touchUpInside)
        self.saveBtn.addTarget(self, action: #selector(saveBtnPressed(_:)), for: .touchUpInside)
    }
    
    @objc func setDataPickerBtnFunc(_: UIButton){
        alarmDatePicker()
    }
    
    
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
            self.SetDatePickerBtn.setTitleColor(.black, for: .normal)
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
}

