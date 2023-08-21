//
//  SayHelloTextGuideVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/03.
//

import UIKit
class SayHelloTextGuideVC : UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let guideLabel : UILabel = {
        let label = UILabel()
        label.text = "마음에 드는 멘트 템플릿을 누르시면 복사됩니다!"
        label.textColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        label.CopyOnLabel()
        return label
    }()
    
    let guide1_1 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000야 잘 지내지? 어떻게 지내는지 궁금해서 연락해. 자주 연락 못하는 것 같아 미안해 :)"
        label.textguideExtension()
        //textguide의 모든 uilabel에 해당되는 사항 extension으로 묶어 처리
        return label
    }()
    
    let guide1_2 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000야 안녕, 오랜만에 연락하네. 나 000이야. 잘 지내지?"
        label.textguideExtension()
        return label
    }()
    
    let guide1_3 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.textguideExtension()
        label.text = "오랜만에 000가 생각이 나서 이렇게 연락해. 항상 건강 유의하고 행복하기를 바래!"
        return label
    }()
    
    let guide1_4 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.textguideExtension()
        label.text = "000, 어떻게 지내! 문득 궁굼해져서 연락했어. 안 본지 한참 된 것 같다ㅎㅎ"
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
    
    let guide2_1 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000님 잘 지내죠? 어떻게 지내는지 궁금해서 연락드립니다. 자주 연락드리지 못하는 것 같아 죄송하네요."
        label.textguideExtension()
        return label
    }()
    
    let guide2_2 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000님, 평안하시죠? 오랜만에 000님 생각이 나서 이렇게 연락드립니다. 항상 건강 유의하세요."
        label.textguideExtension()
        return label
    }()
    
    let guide2_3 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "오랜만에 000님이 생각이 나서 연락드리네요. 저 000입니다. 잘 지내시죠?"
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

extension SayHelloTextGuideVC {
    
    func makeSubView(){
        view.addSubview(scrollView)
        View1.addSubview(titlelabel1)
        View1.addSubview(guide1_1)
        View1.addSubview(guide1_2)
        View1.addSubview(guide1_3)
        View1.addSubview(guide1_4)
        View2.addSubview(titlelabel2)
        View2.addSubview(guide2_1)
        View2.addSubview(guide2_2)
        View2.addSubview(guide2_3)
        scrollView.addSubview(guideLabel)
        scrollView.addSubview(View1)
        scrollView.addSubview(View2)
        
    }
    
    func makeConstraint(){
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            guideLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            guideLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            guideLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -30),
            
            View1.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: -5),
            View1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            View1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            View1.heightAnchor.constraint(equalToConstant: 400),
            View1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titlelabel1.topAnchor.constraint(equalTo: View1.topAnchor, constant: 30),
            titlelabel1.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            
            guide1_1.topAnchor.constraint(equalTo: titlelabel1.bottomAnchor, constant: 10),
            guide1_1.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_1.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            guide1_2.topAnchor.constraint(equalTo: guide1_1.bottomAnchor, constant: 10),
            guide1_2.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_2.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            guide1_3.topAnchor.constraint(equalTo: guide1_2.bottomAnchor, constant: 10),
            guide1_3.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_3.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            guide1_4.topAnchor.constraint(equalTo: guide1_3.bottomAnchor, constant: 10),
            guide1_4.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_4.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            
            View2.topAnchor.constraint(equalTo: View1.bottomAnchor),
            View2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            View2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            View2.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 500),
            View2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titlelabel2.topAnchor.constraint(equalTo: View2.topAnchor, constant: 10),
            titlelabel2.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 30),
            
            guide2_1.topAnchor.constraint(equalTo: titlelabel2.bottomAnchor, constant: 10),
            guide2_1.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 30),
            guide2_1.trailingAnchor.constraint(equalTo: View2.trailingAnchor, constant: -30),
            guide2_2.topAnchor.constraint(equalTo: guide2_1.bottomAnchor, constant: 10),
            guide2_2.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 30),
            guide2_2.trailingAnchor.constraint(equalTo: View2.trailingAnchor, constant: -30),
            guide2_3.topAnchor.constraint(equalTo: guide2_2.bottomAnchor, constant: 10),
            guide2_3.leadingAnchor.constraint(equalTo: View2.leadingAnchor, constant: 30),
            guide2_3.trailingAnchor.constraint(equalTo: View2.trailingAnchor, constant: -30),
        
        ])
       // let View1Height = View1.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
       // View1Height.priority = .defaultLow
        //View1Height.isActive = true
        let View2Height = View2.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        View2Height.priority = .defaultLow
        View2Height.isActive = true
    }
    
    
}
