//
//  FakeMapService.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class FakeMapService: MapServiceProvider {
    private var points: [MapAnnotation] {
        return [
        ]
    }

    func fetchPoints(completion: @escaping ([MapAnnotation]) -> Void) {
        guard let path = Bundle.main.path(forResource: "merchant", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                let merchants = Merchant.create(fromJSON: jsonResult)
                let points = merchants.map({
                    return MapAnnotation(merchant: $0)
                })
                completion(points)
            }
            completion([])
        } catch {
            completion([])
        }
    }
}
