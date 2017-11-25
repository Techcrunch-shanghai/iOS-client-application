//
//  CouponTableViewCell.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class CouponTableViewCell: UITableViewCell {
    private let containerView = UIView()
    private let logo = UIImageView()
    private let title = UILabel()
    private let expiration = UILabel()
    private let price = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
        logo.contentMode = .scaleAspectFit
        containerView.layer.cornerRadius = 5
        expiration.font = UIFont.systemFont(ofSize: 11)
        title.textColor = UIColor.white
        expiration.textColor = UIColor.white
        price.textColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(coupon: Coupon) {
        logo.image = coupon.logo
        title.text = coupon.title
        price.text = coupon.price
        expiration.text = coupon.expiration
        containerView.backgroundColor = coupon.color
    }

    private func setupHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(logo)
        containerView.addSubview(title)
        containerView.addSubview(expiration)
        containerView.addSubview(price)
    }

    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        logo.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 70, height: 70))
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        price.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(60)
            make.right.equalToSuperview().offset(-10)
        }
        title.snp.makeConstraints { make in
            make.left.equalTo(logo.snp.right).offset(10)
            make.right.equalTo(price.snp.left).offset(-10)
            make.centerY.equalToSuperview()
        }
        expiration.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalTo(logo.snp.right).offset(10)
            make.right.equalTo(price.snp.left).offset(-10)
        }
    }
}
