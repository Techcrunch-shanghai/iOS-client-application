//
//  MapButton.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class MapButton: UIButton {
    init(image: UIImage) {
        super.init(frame: CGRect.zero)
        self.setImage(image, for: .normal)
        self.setImage(image, for: .highlighted)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
