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
        return []
    }

    func fetchPoints(completion: @escaping ([MapAnnotation]) -> Void) {
        completion(points)
    }
}
