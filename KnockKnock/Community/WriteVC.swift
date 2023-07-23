//
//  WriteVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/15.
//

import UIKit
import Photos

class WriteVC: UIViewController {
    
    var titleText: String? // 제목
    var contentText: String? // 내용
    var isAnonymousSelected = false // 익명 체크표시 상태
    var index: Int? // 게시판 종류
    var modify: Bool? // 수정 여부
    var selectedImages: [UIImage?] = [] // 사진
    var originalImages: [UIImage?] = [] // 기존 게시물 사진
    
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
    
    // 사진 선택 기능: cameraButton, imagesStackView, addRemoveSelectedImage
    let cameraButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "camera"), for: .normal)
        button.addTarget(self, action: #selector(cameraButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var imagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8 // 이미지들 사이의 간격을 조정합니다.
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    var titleTextField: UITextField = {
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
        button.setImage(UIImage(named: "check_anony_no"), for: .normal)
        button.addTarget(self, action: #selector(anonymousImageButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var contentTextView: UITextView = {
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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "글 쓰기"
        view.backgroundColor = .white
        
        makeSubView()
        makeConstraint()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: completeButton)
        // 이미 선택된 이미지들을 imagesStackView에 추가합니다.
            for image in originalImages {
                if let originalImage = image {
                    addRemoveSelectedImage(originalImage)
                }
            }
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

extension WriteVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func cameraButtonTapped(_ sender: UIButton) {
        if selectedImages.count < 6 {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            
            if PHPhotoLibrary.authorizationStatus() == .authorized {
                present(imagePicker, animated: true, completion: nil)
            } else {
                PHPhotoLibrary.requestAuthorization { status in
                    if status == .authorized {
                        DispatchQueue.main.async {
                            self.present(imagePicker, animated: true, completion: nil)
                        }
                    } else {
                        let alert = UIAlertController(title: "Error", message: "사진 앱에 접근 권한을 허용해주세요.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        } else {
            let alert = UIAlertController(title: "경고", message: "사진은 최대 6장까지 업로드할 수 있습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // UIImagePickerControllerDelegate 메서드를 구현하여 사용자가 이미지를 선택했을 때 처리
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            addRemoveSelectedImage(selectedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension WriteVC {
    // 탭한 이미지 추가/삭제
    func addRemoveSelectedImage(_ image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = false
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0).isActive = true
        
        // 이미지뷰에 탭 제스처를 추가 -> 이미지를 탭할 수 있음
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(removeSelectedImage(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        imagesStackView.addArrangedSubview(imageView)
        selectedImages.append(image)
    }
    
    func makeSubView() {
        scrollView.addSubview(cameraButton)
        scrollView.addSubview(imagesStackView)
        imagesStackView.addArrangedSubview(cameraButton)
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
            
            cameraButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: verticalMargin),
            cameraButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            cameraButton.widthAnchor.constraint(equalToConstant: 35),
            cameraButton.heightAnchor.constraint(equalToConstant: 35),
            
            imagesStackView.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: verticalMargin),
            imagesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            imagesStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -horizontalMargin),
            imagesStackView.heightAnchor.constraint(equalToConstant: 35),
            
            titleLabel.topAnchor.constraint(equalTo: imagesStackView.bottomAnchor, constant: verticalMargin),
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
            anonymousImageButton.widthAnchor.constraint(equalToConstant: 45),
            anonymousImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            contentTextView.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: 8),
            contentTextView.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 8),
            contentTextView.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -8),
            contentTextView.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -30),
            
            ruleLabel.topAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: verticalMargin),
            ruleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
            ruleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
            ruleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -verticalMargin)
        ])
    }
    
    @objc func completeButtonTapped() {
        titleText = titleTextField.text
        contentText = contentTextView.text
        navigationController?.popViewController(animated: true)
    }
    
    @objc func anonymousImageButtonTapped(_ sender: UIButton) {
        isAnonymousSelected.toggle()
        let imageName = isAnonymousSelected ? "check_anony_yes" : "check_anony_no"
        anonymousImageButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func removeSelectedImage(_ sender: UITapGestureRecognizer) { // 탭한 사진 삭제
            guard let tappedImageView = sender.view as? UIImageView else { return }
            if let index = imagesStackView.arrangedSubviews.firstIndex(of: tappedImageView) {
                imagesStackView.removeArrangedSubview(tappedImageView)
                tappedImageView.removeFromSuperview()

                // 이미지가 1개인 경우, Index out of range 에러가 발생하지 않도록 예외 처리
                if selectedImages.count == 1 {
                    selectedImages.removeAll()
                } else if index < selectedImages.count {
                    selectedImages.remove(at: index)
                }
            }
        }
}
