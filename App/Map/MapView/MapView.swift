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
    private let locationManager: CLLocationManager

    init(viewModel: MapViewModel = MapViewModel(),
         locationManager: CLLocationManager = CLLocationManager()) {
        self.viewModel = viewModel
        self.locationManager = locationManager
        super.init(frame: CGRect.zero)
        bindViewModel()
        self.delegate = self
        showsUserLocation = true
        isScrollEnabled = true
        showsCompass = false
        showsPointsOfInterest = true
        tintColor = UIColor.orange
        self.locationManager.requestWhenInUseAuthorization()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bindViewModel() {
        viewModel.completionHandler = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.removeAnnotations(weakSelf.annotations)
            weakSelf.addAnnotations(weakSelf.viewModel.annotations)
        }
    }
}

extension MapView {
    fileprivate func centerUserLocation() {
        let region = MKCoordinateRegion(center: userLocation.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
        setRegion(region, animated: true)
    }

    fileprivate func dequeueOrCreateAnnotation(mapView: MKMapView, annotation: MKAnnotation) -> MKAnnotationView {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation")
        if let annotationView = annotationView {
            return annotationView
        }
        return MKAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
    }

    fileprivate func setupAnnotationView(annotationView: MKAnnotationView, annotation: MapAnnotation) {
        let pinView = MapPinView()
        let frameAnnotation = CGRect(x: 0, y: 0, width: 30, height: 30)
        annotationView.canShowCallout = false
        annotationView.frame = frameAnnotation
        annotationView.addSubview(pinView)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = UIColor.green
        annotationView.detailCalloutAccessoryView = view
        pinView.frame = frameAnnotation
    }
}

extension MapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        centerUserLocation()
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        guard let annotation = annotation as? MapAnnotation else {
            return nil
        }
        let annotationView = dequeueOrCreateAnnotation(mapView: mapView, annotation: annotation)
        setupAnnotationView(annotationView: annotationView, annotation: annotation)
        return annotationView
    }
}