//
//  AwardsViewController.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Hero

class AwardsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Awards"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(self.dismissController))
    }

    @objc private func dismissController() {
        hero_dismissViewController()
    }
}
