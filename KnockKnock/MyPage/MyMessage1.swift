//
//  MyMessage1.swift
//  KnockKnock
//
//  Created by 다은 on 2023/08/06.
//

import UIKit
class MyMessage1 : UIView {
    
    let me = MyData.shared
    
    let label1 : UILabel = {
       let label = UILabel()
        label.text = "[낙낙(KnockKnock)]"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    let label2 : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.numberOfLines = 3
        return label
    }()
 
    
    let labelBtn1 : UIButton = {
       let btn = UIButton()
        var text = AttributedString("관계 키워드")
        text.font = .systemFont(ofSize: 13)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = text
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .systemGray5
        config.baseForegroundColor = .black
        btn.configuration = config
        return btn
    }()
    
    let keywordtext : UITextField = {
        let text = UITextField()
        text.placeholder = "예) 동창생"
        text.font = .systemFont(ofSize: 13)
        text.backgroundColor = .systemGray5
        text.layer.cornerRadius = 10
        text.addLeftPadding()
        return text
    }()

    let labelBtn2 : UIButton = {
       let btn = UIButton()
        var text = AttributedString("메모")
        text.font = .systemFont(ofSize: 13)
        var config = UIButton.Configuration.filled()
        config.attributedTitle = text
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .systemGray5
        config.baseForegroundColor = .black
        btn.configuration = config
        return btn
    }()
   
    let memotext : UITextField = {
        let text = UITextField()
        text.placeholder = "20글자 이내로 작성해주세요"
        text.font = .systemFont(ofSize: 13)
        text.backgroundColor = .systemGray5
        text.layer.cornerRadius = 10
        text.addLeftPadding()
        return text
    }()
    
    let guideline1 : UIView = {
       let guide = UIView()
        guide.backgroundColor = .systemGray5
        return guide
    }()
    
    let guideline2 : UIView = {
       let guide = UIView()
        guide.backgroundColor = .systemGray5
        return guide
    }()
    
    let shareBtn : UIButton = {
       let btn = UIButton()
        let logoimg = UIImage(named: "logo")?.resizeImageTo(size: CGSize(width: 23, height: 23))
        btn.setImage(logoimg, for: .normal)
        
        btn.setTitle("낙낙의 다른 기능들도 사용해보세요!", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.backgroundColor = .systemGray6
        btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        btn.contentHorizontalAlignment = .leading
        btn.imageEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: -12)
        btn.titleEdgeInsets = .init(top: 0, left: 17, bottom: 0, right: -17)
        
        
        return btn
    }()
    
    let lastLabel : UILabel = {
        let label = UILabel()
        label.text = "다운로드 여부와 상관없이 해당 채팅창에서\n답장을 이어가주세요. 물론 받은 사람 마음입니다!"
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .systemGray3
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        makeSubView()
        makeConstraint()
        var nickName: String = loadLocalName()
        label2.attributedText =  NSAttributedString(string: "똑똑! \(nickName)님이 문을 두드렸어요!\n낙낙은 연락이 끊겼던 친구와의 재연결을 도와주는 서비스를 제공해요 :)")
        
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
}

extension MyMessage1 {
    func makeSubView(){
        addSubview(label1)
        addSubview(label2)
        addSubview(labelBtn1)
        addSubview(keywordtext)
        addSubview(labelBtn2)
        addSubview(memotext)
        addSubview(guideline1)
        addSubview(shareBtn)
        addSubview(guideline2)
        addSubview(lastLabel)
    }
    
    func makeConstraint(){
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        labelBtn1.translatesAutoresizingMaskIntoConstraints = false
        keywordtext.translatesAutoresizingMaskIntoConstraints = false
        labelBtn2.translatesAutoresizingMaskIntoConstraints = false
        memotext.translatesAutoresizingMaskIntoConstraints = false
        guideline1.translatesAutoresizingMaskIntoConstraints = false
        guideline2.translatesAutoresizingMaskIntoConstraints = false
        shareBtn.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            label1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            labelBtn1.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            labelBtn1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelBtn1.heightAnchor.constraint(equalToConstant: 23),
            labelBtn1.widthAnchor.constraint(equalToConstant: 85),
            keywordtext.topAnchor.constraint(equalTo: labelBtn1.topAnchor),
            keywordtext.leadingAnchor.constraint(equalTo: labelBtn1.trailingAnchor, constant: 8),
            keywordtext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            keywordtext.heightAnchor.constraint(equalTo: labelBtn1.heightAnchor),
            
            labelBtn2.topAnchor.constraint(equalTo: labelBtn1.bottomAnchor, constant: 10),
            labelBtn2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelBtn2.heightAnchor.constraint(equalToConstant: 23),
            memotext.topAnchor.constraint(equalTo: labelBtn2.topAnchor),
            memotext.leadingAnchor.constraint(equalTo: labelBtn2.trailingAnchor, constant: 8),
            memotext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            memotext.heightAnchor.constraint(equalTo: labelBtn2.heightAnchor),
            
            guideline1.topAnchor.constraint(equalTo: memotext.bottomAnchor, constant: 10),
            guideline1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            guideline1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            guideline1.heightAnchor.constraint(equalToConstant: 1),
            
            shareBtn.topAnchor.constraint(equalTo: guideline1.bottomAnchor),
            shareBtn.heightAnchor.constraint(equalTo: memotext.heightAnchor, multiplier: 1.7),
            shareBtn.leadingAnchor.constraint(equalTo: leadingAnchor),
            shareBtn.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            guideline2.topAnchor.constraint(equalTo: shareBtn.bottomAnchor),
            guideline2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            guideline2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            guideline2.heightAnchor.constraint(equalToConstant: 1),
            
            lastLabel.topAnchor.constraint(equalTo: guideline2.bottomAnchor, constant: 10),
            lastLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            lastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            lastLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            
        ])
        
    }
    
    @objc func loadLocalName()->String{
        return me.name
    }
}
