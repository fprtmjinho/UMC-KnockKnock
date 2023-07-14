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
    
    func makeSubView() {
    }
    
    func makeConstraint() {
        
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
}
