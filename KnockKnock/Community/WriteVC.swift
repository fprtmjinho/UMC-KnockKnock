//
//  WriteVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/15.
//

import UIKit

class WriteVC: UIViewController {
    
    lazy var completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("완료", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.1719063818, blue: 0.4505617023, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.frame.size.width = 50
        
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "제목을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "내용"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let anonymousImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "check_ffffff"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(anonymousImageButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    var isAnonymousSelected = false // 익명 체크표시 상태
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = .placeholderText
        textView.text = "내용을 입력하세요."
        textView.backgroundColor = .clear
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let ruleLabel: UILabel = {
        let label = UILabel()
        label.text = "낙낙은 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 이용규칙을 제정하여 운영하고 있습니다.\n\n실명 언급이나 욕, 비방글 작성 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 적당한 선을 지켜주세요.\n\n태그를 사용해 글을 쓰고 싶으시면 직접 ‘#’ 추가 후 작성해주시고, 검색할 때도 “# + ‘검색어’ ”의 형태로 입력해주시면 됩니다."
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func makeSubView() {
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(titleContainerView)
        titleContainerView.addSubview(titleTextField)
        scrollView.addSubview(contentLabel)
        scrollView.addSubview(contentContainerView)
        contentContainerView.addSubview(contentTextView)
        contentContainerView.addSubview(anonymousImageButton)
        scrollView.addSubview(ruleLabel)
        view.addSubview(scrollView)
    }
    
    func makeConstraint() {
        let verticalMargin: CGFloat = 20
        let horizontalMargin: CGFloat = 30
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: verticalMargin),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            imageView.widthAnchor.constraint(equalToConstant: 35),
            imageView.heightAnchor.constraint(equalToConstant: 35),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: verticalMargin),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            
            titleContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            titleContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
            titleContainerView.heightAnchor.constraint(equalToConstant: 40),
            
            titleTextField.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor, constant: 8),
            titleTextField.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor, constant: -8),
            titleTextField.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: titleContainerView.bottomAnchor, constant: verticalMargin),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            
            contentContainerView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 5),
            contentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            contentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
            contentContainerView.heightAnchor.constraint(equalToConstant: 300),
            
            anonymousImageButton.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -8),
                anonymousImageButton.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -8),
                anonymousImageButton.widthAnchor.constraint(equalToConstant: 30),
            anonymousImageButton.heightAnchor.constraint(equalToConstant: 30),
            
            contentTextView.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: 8),
            contentTextView.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 8),
            contentTextView.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -8),
            contentTextView.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -16),
            
            ruleLabel.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: verticalMargin),
            ruleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            ruleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
            ruleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -verticalMargin)
        ])
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "글 쓰기"
        view.backgroundColor = .white
        
        makeSubView()
        makeConstraint()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: completeButton
        )
    }
    
    @objc func completeButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func anonymousImageButtonTapped(_ sender: UIButton) {
        isAnonymousSelected.toggle()
        let imageName = isAnonymousSelected ? "check_box" : "check_ffffff"
        anonymousImageButton.setImage(UIImage(named: imageName), for: .normal)
    }

}

extension WriteVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .label
        textView.text = nil
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력하세요."
            textView.textColor = .placeholderText
        }
    }
}
