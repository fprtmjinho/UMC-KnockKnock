//
//  GuideVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/11.
//

import UIKit

class GuideVC: UIViewController {
    
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
        label1.text = "낙낙의 똑똑한 기능들에 대해 소개해드릴게요. 저희 낙낙은 사용자님들이 인간관계에서 고민할 만한 문제와 상황들에 대한 해결책을 드리려고 해요."
        label1.numberOfLines = 0
        label1.translatesAutoresizingMaskIntoConstraints = false
        return label1
    }()

    let containerView1: UIView = {
        let containerView1 = makeContainerView(title: "꼭 명분이 없어도 쉽게 연락할 수 있어요 🙌", text: "낙낙의 연락 기능은 두 가지로 나뉘어져 있어요. 연락이 끊긴 사람과의 재연결, 알고는 있지만 별로 친하지 않았던 사람과의 새시작 중 하나의 목적을 골라 문자글을 작성해주시면 돼요. 문자글 가이드라인은 친구 프로필을 누르거나 내 페이지에 가면 입력할 수 있는 칸이 나와요. 글을 다 쓰고 나면 바로 보내거나 글 전체 복사하기 버튼을 누른 후 해당 글을 직접 상대에게 보내주세요.")
        containerView1.translatesAutoresizingMaskIntoConstraints = false
        return containerView1
    }()

    let containerView2: UIView = {
        let containerView2 = makeContainerView(title: "주기별 연락 알림을 받을 수 있어요 🔔", text: "언젠가 한 번은 연락할 의사가 있는 친구들에게는 6개월에 한 번씩, 찐친에게는 2개월에 한 번씩 연락 알림을 보내드릴게요. 알림 날짜와 시간은 마음대로 변경 및 추가가 가능해요. 멘트가 고민되신다면 저희가 준비한 멘트 템플릿을 참고하세요.")
        containerView2.translatesAutoresizingMaskIntoConstraints = false
        return containerView2
    }()

    let containerView3: UIView = {
        let containerView3 = makeContainerView(title: "게시판을 이용해 사용자들과 소통할 수 있어요 📝", text: "낙낙의 게시판은 선과 악, 연령대 별로 볼 수 있어요. 선 게시판에서는 인간관계에 대한 긍정적인 말과 조언들을 공유해요. 찐친들과 가기에 좋은 장소에 대한 정보나 동창들을 찾아도 좋아요. 반대로 악 게시판에서는 직장상사에 대한 이야기 등 여러 고민들을 익명으로 적고 마음 편히 욕할 수 있어요.")
        containerView3.translatesAutoresizingMaskIntoConstraints = false
        return containerView3
    }()

    let containerView4: UIView = {
        let containerView4 = makeContainerView(title: "찐친 관계와 모임을 꾸준히 이어갈 수 있게 도와줘요 🙋", text: "찐친은 찐친 관리 페이지에서 따로 관리 가능하고 쉽게 편집할 수 있어요. 친구 관련 여러 메모와 별명을 따로 추가해놓을 수 있어요. 모임을 등록해놓으면 모임 주기 알림을 2달에 한 번, 6개월에 한 번 중 골라 설정할 수 있고, 모임 장소도 추천받을 수 있어요.")
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "낙낙 사용법"
        view.backgroundColor = .white
        makeSubView()
        makeConstraint()
        setNavigationBar()
    }
}
