//
//  PromiseVC.swift
//  KnockKnock
//
//  Created by 티모시 킴 on 2023/07/23.
//

import UIKit
import NMapsMap

class PromiseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let naverMapView = NMFMapView(frame: view.frame)
        view.addSubview(naverMapView)
    }
}
