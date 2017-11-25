//
//  MapView.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import MapKit

class MapView: MKMapView {
    private let viewModel: MapViewModel

    init(viewModel: MapViewModel = MapViewModel()) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
        bindViewModel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bindViewModel() {

    }
}
