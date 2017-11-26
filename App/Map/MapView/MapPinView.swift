//
//  MapPinView.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class MapPinView: UIView {
    private let imageView = UIImageView()

    init(merchant: Merchant) {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.lightGray
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFit

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }

        guard let url = URL(string: merchant.imageUrl ?? "") else { return }
        imageView.kf.setImage(with: url)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
