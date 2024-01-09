//
//  SplashScreenVC.swift
//  MYCash-Task
//
//  Created by iOSAYed on 08/01/2024.
//

import UIKit

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }	

    convenience required init() {
        self.init(nibName: "\(SplashScreenVC.self)", bundle: nil)
    }

}
