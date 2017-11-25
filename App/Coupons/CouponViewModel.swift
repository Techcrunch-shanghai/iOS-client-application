
//
//  CouponViewModel.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation

protocol CouponServiceProvider {
    func fetchCoupons(completion: @escaping (([Coupon]) -> Void))
}

class CouponViewModel {
    private(set) var coupons = [Coupon]() {
        didSet {
            completionUpdate?()
        }
    }
    private let couponService: CouponServiceProvider

    var completionUpdate: (() -> ())?

    init(couponService: CouponServiceProvider = FakeCouponService()) {
        self.couponService = couponService
    }

    func start() {
        couponService.fetchCoupons { coupons in
            self.coupons = coupons
        }
    }
}
