//
//  AppointmentTextGuideVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/03.
//

import UIKit
class AppointmentTextGuideVC : UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let View1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //반말 템플릿
    
    let titlelabel1 : UILabel = {
        let label = UILabel()
        label.text = "반말"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let guide1_1 : UILabel = {
       let label = UILabel()
        label.text = "000야 진짜 오랜만이다!! 우리 한 번 만나서 밥이라도 먹지 않을래?"
        label.textguideExtension()
        //textguide의 모든 uilabel에 해당되는 사항 extension으로 묶어 처리
        return label
    }()
    
    let guide1_2 : UILabel = {
       let label = UILabel()
        label.text = "000야 우리 안 본 지 너무 오래 됐다ㅜㅠ 약속 잡고 한 번 만나자!! 무슨 요일이 편해?"
        label.textguideExtension()
        return label
    }()
    
    let guide1_3 : UILabel = {
       let label = UILabel()
        label.text = "000야 잘 지내지? 아니 만난지 꽤 된 것 같아서 함 보자고 연락했어ㅎ! 이번 주 뭐해?"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textguideExtension()
        return label
    }()
    
    let guide1_4 : UILabel = {
       let label = UILabel()
        label.text = "000아 요새 어떻게 지내??ㅋㅋㅋ아니 잘 사나 궁굼해서 연락했지~~ 내일 뭐해?"
        label.textguideExtension()
        return label
    }()
    
    
    let View2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //존댓말 템플릿
    
    let titlelabel2 : UILabel = {
        let label = UILabel()
        label.text = "존댓말"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let guide2_1 : UILabel = {
       let label = UILabel()
        label.text = "000님 안녕하세요? 혹시 저 기억하시나요..? ㅎㅎ 저번에 뵀었는데 더 친해지고 싶어 연락했어요!"
        label.textguideExtension()
        return label
    }()
    
    let guide2_2 : UILabel = {
       let label = UILabel()
        label.text = "000님 안녕하세요ㅎㅎㅎ 저 같은 동아리 부원입니다! 밥 한 번 같이 먹고 싶어서 연락드렸어요! 친해져요^^"
        label.textguideExtension()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
    }
}

extension AppointmentTextGuideVC {
    
    func makeSubView(){
        View1.addSubview(titlelabel1)
        View1.addSubview(guide1_1)
        View1.addSubview(guide1_2)
        View1.addSubview(guide1_3)
        View1.addSubview(guide1_4)
        View2.addSubview(titlelabel2)
        View2.addSubview(guide2_1)
        View2.addSubview(guide2_2)
        scrollView.addSubview(View1)
        scrollView.addSubview(View2)
        view.addSubview(scrollView)
    }
    
    func makeConstraint(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            View1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            View1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            View1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            View1.heightAnchor.constraint(equalToConstant: 350),
            View1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titlelabel1.topAnchor.constraint(equalTo: View1.topAnchor, constant: 20),
            titlelabel1.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            
            guide1_1.topAnchor.constraint(equalTo: titlelabel1.bottomAnchor, constant: 20),
            guide1_1.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_1.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            guide1_2.topAnchor.constraint(equalTo: guide1_1.bottomAnchor, constant: 20),
            guide1_2.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_2.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            guide1_3.topAnchor.constraint(equalTo: guide1_2.bottomAnchor, constant: 20),
            guide1_3.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_3.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            guide1_4.topAnchor.constraint(equalTo: guide1_3.bottomAnchor, constant: 20),
            guide1_4.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_4.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            
            View2.topAnchor.constraint(equalTo: View1.bottomAnchor),
            View2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            View2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            View2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            View2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titlelabel2.topAnchor.constraint(equalTo: View2.topAnchor, constant: 20),
            titlelabel2.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 30),
            
            guide2_1.topAnchor.constraint(equalTo: titlelabel2.bottomAnchor, constant: 20),
            guide2_1.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 30),
            guide2_1.trailingAnchor.constraint(equalTo: View2.trailingAnchor, constant: -30),
            guide2_2.topAnchor.constraint(equalTo: guide2_1.bottomAnchor, constant: 20),
            guide2_2.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 30),
            guide2_2.trailingAnchor.constraint(equalTo: View2.trailingAnchor, constant: -30),
        ])
    }
    
    
}