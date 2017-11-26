//
//  MapViewModel.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation
import MapKit

protocol MapServiceProvider {
    func fetchPoints(completion: @escaping ([MapAnnotation]) -> Void)
}

class MapViewModel {
    private let mapService: MapServiceProvider
    private(set) var annotations = [MapAnnotation]()
    var completionHandler: (([MapAnnotation]) -> Void)?

    init(mapService: MapServiceProvider = FakeMapService()) {
        self.mapService = mapService
    }

    func start() {
        print("start")
        self.mapService.fetchPoints { points in
            print("completion : \(self.completionHandler)")
            self.annotations = points
            self.completionHandler?(points)
        }
    }
}
