//
//  PrivacyPolicyVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/08/02.
//

import UIKit

class PrivacyPolicyVC: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let label1: UILabel = {
        let label1 = UILabel()
        label1.text = " 낙낙은 '개인정보 보호법' 제 30조에 따라 정보 주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원할하게 처리할 수 있도록 하기 위해 다음과 같이 개인정보 처리방침을 수립 및 공개합니다."
        label1.numberOfLines = 0
        label1.translatesAutoresizingMaskIntoConstraints = false
        return label1
    }()
    
    let containerView1: UIView = {
        let containerView1 = makeContainerView(title: "제 1조 (개인정보 처리 목적)", text: "낙낙은 다음의 목적을 위해 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 욕도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 ‘개인정보 보호법’ 제 18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.\n\n연락을 할 때 본인의 이름을 넣기 위함, 사용자의 전화기록부 속 친구 번호 목록 생성을 위함, 연령대 별 게시판 이용시 나이 및 성별 관련 정보의 필요성을 목적으로 개인정보를 처리합니다.")
        containerView1.translatesAutoresizingMaskIntoConstraints = false
        return containerView1
    }()
    
    let containerView2: UIView = {
        let containerView2 = makeContainerView(title: "제 2조 (개인정보의 처리 및 보유 기간)", text: "낙낙은 법령에 따른 개인정보 보유 및 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 이용기간 내에서 개인정보를 처리 및 보유합니다.")
        containerView2.translatesAutoresizingMaskIntoConstraints = false
        return containerView2
    }()
    
    let containerView3: UIView = {
        let containerView3 = makeContainerView(title: "제 3조 (개인정보의 파기절차 및 파기방법)", text: "낙낙은 개인정보 보유기간의 경과, 처리목적 달성, 앱 삭제시 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.")
        containerView3.translatesAutoresizingMaskIntoConstraints = false
        return containerView3
    }()
    
    let containerView4: UIView = {
        let containerView4 = makeContainerView(title: "제 4조 (개인정보의 안전성 확보조치 관련 사항)", text: "개인정보에 대한 접근 제한 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통해 개인정보에 대한 접근통제를 위해 필요한 조치를 하고 있으며 침입차단시스템을 이용해 외부로부터의 무단접근을 통제하고 있습니다. 정보주체의 이용정보를 저장하고 수시고 불러오는 ‘쿠키’를 사용하지 않고 있습니다.")
        containerView4.translatesAutoresizingMaskIntoConstraints = false
        return containerView4
    }()
    
    static func makeContainerView(title: String, text: String) -> UIView {
        let containerView: UIView = {
            let containerView = UIView()
            containerView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
            containerView.translatesAutoresizingMaskIntoConstraints = false
            return containerView
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = title
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let textLabel: UILabel = {
            let label = UILabel()
            label.text = text
            label.textColor = #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
        
        return containerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "개인정보 처리방침"
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        setNavigationBar()
    }
    
}

extension PrivacyPolicyVC {
    func makeSubView() {
        contentView.addSubview(label1)
        contentView.addSubview(containerView1)
        contentView.addSubview(containerView2)
        contentView.addSubview(containerView3)
        contentView.addSubview(containerView4)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
    }

    func makeConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            
            containerView1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
            containerView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            containerView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            
            containerView2.topAnchor.constraint(equalTo: containerView1.bottomAnchor, constant: 20),
            containerView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            containerView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            
            containerView3.topAnchor.constraint(equalTo: containerView2.bottomAnchor, constant: 20),
            containerView3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            containerView3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            
            containerView4.topAnchor.constraint(equalTo: containerView3.bottomAnchor, constant: 20),
            containerView4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            containerView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            containerView4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
