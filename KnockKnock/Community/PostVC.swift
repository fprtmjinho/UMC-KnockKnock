//
//  PostVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/16.
//

import UIKit

class PostVC: UIViewController {
    
    // 댓글 관련: commentContainerView1, commentContainerView2, commentTextField, anonymousImageButton, makeCommentImageButton
    
    let commentContainerView1: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentContainerView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 17
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "댓글을 입력하세요.")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var isAnonymousSelected = false // 댓글 익명 여부
    
    let anonymousImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "check_anony_no"), for: .normal)
        button.addTarget(self, action: #selector(anonymousImageButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let makeCommentImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "writing_ ff0060"), for: .normal)
        button.addTarget(self, action: #selector(makeCommentImageButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func makeSubView() {
        view.addSubview(commentContainerView1)
        commentContainerView1.addSubview(commentContainerView2)
        commentContainerView2.addSubview(commentTextField)
        commentContainerView2.addSubview(anonymousImageButton)
        commentContainerView2.addSubview(makeCommentImageButton)
    }
    
    func makeConstraint() {
        let horizontalMargin: CGFloat = 30
        
        NSLayoutConstraint.activate([
            commentContainerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentContainerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentContainerView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            commentContainerView1.heightAnchor.constraint(equalToConstant: 65),
            
            commentContainerView2.leadingAnchor.constraint(equalTo: commentContainerView1.leadingAnchor, constant: horizontalMargin),
            commentContainerView2.trailingAnchor.constraint(equalTo: commentContainerView1.trailingAnchor, constant: -horizontalMargin),
            commentContainerView2.topAnchor.constraint(equalTo: commentContainerView1.topAnchor, constant: 15),
            commentContainerView2.bottomAnchor.constraint(equalTo: commentContainerView1.bottomAnchor, constant: -15),
            
            commentTextField.leadingAnchor.constraint(equalTo: commentContainerView2.leadingAnchor, constant: 10),
            commentTextField.trailingAnchor.constraint(equalTo: anonymousImageButton.leadingAnchor, constant: -10),
            commentTextField.topAnchor.constraint(equalTo: commentContainerView2.topAnchor, constant: 10),
            commentTextField.bottomAnchor.constraint(equalTo: commentContainerView2.bottomAnchor, constant: -10),
            
            anonymousImageButton.trailingAnchor.constraint(equalTo: makeCommentImageButton.leadingAnchor, constant: -5),
            anonymousImageButton.centerYAnchor.constraint(equalTo: commentContainerView2.centerYAnchor),
            anonymousImageButton.widthAnchor.constraint(equalToConstant: 45),
            anonymousImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            makeCommentImageButton.trailingAnchor.constraint(equalTo: commentContainerView2.trailingAnchor, constant: -10),
            makeCommentImageButton.centerYAnchor.constraint(equalTo: commentContainerView2.centerYAnchor),
            makeCommentImageButton.widthAnchor.constraint(equalToConstant: 30),
            makeCommentImageButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "게시판"
        view.backgroundColor = .white
        
        makeSubView()
        makeConstraint()
    }
    
    @objc func anonymousImageButtonTapped(_ sender: UIButton) {
        isAnonymousSelected.toggle()
        let imageName = isAnonymousSelected ? "check_anony_yes" : "check_anony_no"
        anonymousImageButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func makeCommentImageButtonTapped(_ sender: UIButton) {
        print("댓글 작성 버튼 탭함.")
    }
}
