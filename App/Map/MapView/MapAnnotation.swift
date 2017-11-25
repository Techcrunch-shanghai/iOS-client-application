//
//  MapAnnotation.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    let title: String? = nil
    let subtitle: String? = nil
    let coordinate: CLLocationCoordinate2D
    let index: Int

    init(point: DataPoint, index: Int) {
        coordinate = CLLocationCoordinate2D(latitude: point.lat, longitude: point.long)
        self.index = index
        super.init()
    }
}
