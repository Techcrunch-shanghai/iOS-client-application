//
//  FakeCouponViewModel.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class FakeCouponService: CouponServiceProvider {
    private var coupons: [Coupon] {
        return [
            Coupon(title: "Cold brew", price: "20rmb", expiration: "expired in 3 days", logo: UIImage(named: "starbucks-logo-with-border")!, color: UIColor(red:0.02, green:0.44, blue:0.25, alpha:1.00)),
            Coupon(title: "Grilled chicked burger", price: "10rmb", expiration: "expired in 5 days", logo: UIImage(named: "macdonals")!, color: UIColor(red:0.68, green:0.19, blue:0.16, alpha:1.00))
        ]
    }

    func fetchCoupons(completion: @escaping (([Coupon]) -> Void)) {
        completion(coupons)
    }
}
