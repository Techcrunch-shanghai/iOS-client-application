//
//  MapPinView.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class MapPinView: UIView {
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.orange
        layer.cornerRadius = 25
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
