//
//  WeddingTextGuideVC.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/03.
//

import UIKit
class WeddingTextGuideVC : UIViewController {
    
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
    
    let guide1_1 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "결혼이라니.. 대박! 진심으로 축하하고 항상 행복한 나날이 가득하기를 바랄게!!"
        label.textguideExtension()
        return label
    }()
    
    let guide1_2 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000!!결혼 정말 축하하고 매일매일이 행복한 결혼생활이 되길 바래~"
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
        label.text = "000님 결혼을 진심으로 축하드립니다^^ 다정하고 화목한 가정을 기원하며, 행복한 결혼생활 되세요!"
        label.textguideExtension()
        return label
    }()
    
    let guide2_2 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000님 결혼 정말 축하드리고 세상에서 제일 행복한 결혼생활 되시기를 바랍니다!"
        label.textguideExtension()
        return label
    }()
    
    let guide2_3 : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.text = "000님 결혼을 축하합니다. 행복하게 잘 사는 모습 보여주세요~!"
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

extension WeddingTextGuideVC {
    
    func makeSubView(){
        View1.addSubview(guide1_1)
        View1.addSubview(guide1_2)
        View2.addSubview(guide2_1)
        View2.addSubview(guide2_2)
        View2.addSubview(guide2_3)
        View1.addSubview(titlelabel1)
        View2.addSubview(titlelabel2)
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
    }
    
    
}
