//
//  LoginFourthVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/08/21.
//

import UIKit
class LoginFourthVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var nextBtn : UIButton = UIButton()
    
    let num6: UILabel = {
        let num6 = UILabel()
        num6.backgroundColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        num6.text = "6"
        num6.textColor = .white
        num6.textAlignment = .center
        num6.font = UIFont.boldSystemFont(ofSize: 20)
        num6.clipsToBounds = true
        num6.layer.cornerRadius = 12.5
        return num6
    }()
    
    let profileLabel1: UILabel = {
        let label = UILabel()
        label.text = "프로필 사진을 등록해주세요!"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let profileLabel2: UILabel = {
        let label = UILabel()
        label.text = "마음에 드는 셀카 사진이 있나요? 등록해주세요!"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let profileImageView : UIImageView = {
        var profileImageView = UIImageView()
        let config = UIImage.SymbolConfiguration(paletteColors: [.systemGray5])
        profileImageView.image = UIImage(systemName: "person.circle.fill", withConfiguration: config)
        profileImageView.contentMode = .scaleAspectFill  // 이 부분을 추가
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 55
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = #colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1)
        return profileImageView
    }()
    
    
    let editProfileImageButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 사진 편집", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9972829223, green: 0, blue: 0.4537630677, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
    
    func makeSubView() {
        view.addSubview(num6)
        view.addSubview(profileLabel1)
        view.addSubview(profileLabel2)
        view.addSubview(profileImageView)
        view.addSubview(editProfileImageButton)
        nextBtn = setNextBtn(view: self, title: "다음")
    }
    
    func makeConstraint() {
        num6.translatesAutoresizingMaskIntoConstraints = false
        profileLabel1.translatesAutoresizingMaskIntoConstraints = false
        profileLabel2.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        editProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            num6.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            num6.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            num6.widthAnchor.constraint(equalToConstant: 25),
            num6.heightAnchor.constraint(equalToConstant: 25),
            
            profileLabel1.topAnchor.constraint(equalTo: num6.bottomAnchor, constant: 10),
            profileLabel1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            profileLabel1.heightAnchor.constraint(equalToConstant: 30),
            
            profileLabel2.topAnchor.constraint(equalTo: profileLabel1.bottomAnchor, constant: 5),
            profileLabel2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            profileLabel2.heightAnchor.constraint(equalToConstant: 30),
            
            profileImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 110),
            profileImageView.heightAnchor.constraint(equalToConstant: 110),
            
            editProfileImageButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            editProfileImageButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 2),
            editProfileImageButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    func makeAddTarget(){
        nextBtn.addTarget(self, action: #selector(touchNextBtn(_:)), for: .touchUpInside)
        editProfileImageButton.addTarget(self, action: #selector(editProfileImageButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func editProfileImageButtonTapped(_: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func touchNextBtn(_:UIButton) {
        // 이미지를 UserDefaults에 저장
        if let imageData = profileImageView.image?.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
        
        let loginSuccessVC = LoginSuccessVC()
        self.navigationController?.pushViewController(loginSuccessVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        makeSubView()
        makeConstraint()
        makeAddTarget()
    }
    
}
