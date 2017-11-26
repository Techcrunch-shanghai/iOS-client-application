//
//  MapAnnotation.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import MapKit

struct Merchant {
    let title: String
    let latitude: Double
    let longitude: Double
    let imageUrl: String?

    init(json: [String:Any]) {
        title = json["name"] as? String ?? ""
        if let location = json["location"] as? [String:Double] {
            latitude = location["lat"] ?? 0
            longitude = location["lng"] ?? 0
        } else {
            latitude = 0
            longitude = 0
        }
        imageUrl = json[""] as? String
    }

    static func create(fromJSON json: [String:Any]) -> [Merchant] {
        return ((json["merchantList"] as? [[String:Any]]) ?? []).map {
            return Merchant(json: $0)
        }
    }
}

class MapAnnotation: NSObject, MKAnnotation {
    let title: String? = nil
    let subtitle: String? = nil
    let coordinate: CLLocationCoordinate2D
    let merchant: Merchant

    init(merchant: Merchant) {
        self.merchant = merchant
        coordinate = CLLocationCoordinate2D(latitude: merchant.latitude,
                                            longitude: merchant.longitude)
        super.init()
    }
}
