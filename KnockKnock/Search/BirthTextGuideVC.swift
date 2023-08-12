//
//  BirthTextGuideVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/03.
//

import UIKit
class BirthTextGuideVC : UIViewController {
    
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
        return label
    }()
    
    let guide1_1 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000생일 축하해!! 비록 우리 서로 바빠서 얼굴은 못보지만 선물 보낸다ㅋㅋ 생축! 맛나는거 많이 먹어!"
        label.textguideExtension()
        return label
    }()
    
    let guide1_2 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000야 생일 축하한다!! 오늘 재밌는 하루 보내고 나랑도 한 번 놀자!"
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
    
    let guide2_1 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000님 오늘 생일이시더라구요!! 저희 아직 많이 친하지는 않지만 생일 축하드립니다!"
        label.textguideExtension()
        return label
    }()
    
    let guide2_2 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000님 생일 축하드려요! 맛있는 음식 많이 드시고 행복한 하루 되세요!!"
        label.textguideExtension()
        return label
    }()
    
    let guide2_3 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "안녕하세요! 저 기억하시나요..? 오늘 생일이시길래 축하 연락드렸어요ㅎㅎ 앞으로 더 친해져요!"
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

extension BirthTextGuideVC {
    
    func makeSubView(){
        View1.addSubview(titlelabel1)
        View1.addSubview(guide1_1)
        View1.addSubview(guide1_2)
        View2.addSubview(guide2_1)
        View2.addSubview(guide2_2)
        View2.addSubview(guide2_3)
        View2.addSubview(titlelabel2)
        scrollView.addSubview(guideLabel)
        scrollView.addSubview(View1)
        scrollView.addSubview(View2)
        view.addSubview(scrollView)
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
            View1.heightAnchor.constraint(equalToConstant: 250),
            View1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titlelabel1.topAnchor.constraint(equalTo: View1.topAnchor, constant: 30),
            titlelabel1.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            
            guide1_1.topAnchor.constraint(equalTo: titlelabel1.bottomAnchor, constant: 10),
            guide1_1.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_1.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            guide1_2.topAnchor.constraint(equalTo: guide1_1.bottomAnchor, constant: 10),
            guide1_2.leadingAnchor.constraint(equalTo: View1.leadingAnchor, constant: 30),
            guide1_2.trailingAnchor.constraint(equalTo: View1.trailingAnchor, constant: -30),
            
            View2.topAnchor.constraint(equalTo: View1.bottomAnchor),
            View2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            View2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            View2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
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
        let View1Height = View1.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        View1Height.priority = .defaultLow
        View1Height.isActive = true
        let View2Height = View2.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        View2Height.priority = .defaultLow
        View2Height.isActive = true
    }
    
    

}
