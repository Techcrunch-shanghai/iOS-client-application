//
//  MapViewController.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class MapViewController: UIViewController {
    private let searchBarView = MapSearchBarView()
    private let mapView = MapView()

    private let buttonFriends = MapButton(image: UIImage())
    private let buttonLocationCenter = MapButton(image: UIImage())
    private let buttonAwards = MapButton(image: UIImage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        searchBarView.delegate = self
        buttonFriends.backgroundColor = UIColor.blue
        buttonLocationCenter.backgroundColor = UIColor.blue
        buttonAwards.backgroundColor = UIColor.blue

        buttonFriends.addTarget(self, action: #selector(self.displayFriends), for: .touchUpInside)
        buttonLocationCenter.addTarget(self, action: #selector(self.centerUserLocation), for: .touchUpInside)
        buttonAwards.addTarget(self, action: #selector(self.displayAwards), for: .touchUpInside)
    }

    private func setupHierarchy() {
        view.addSubview(mapView)
        view.addSubview(searchBarView)
        view.addSubview(buttonFriends)
        view.addSubview(buttonLocationCenter)
        view.addSubview(buttonAwards)
    }

    @objc private func displayFriends() {

    }

    @objc private func centerUserLocation() {

    }

    @objc private func displayAwards() {

    }

    private func setupLayout() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        searchBarView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        buttonFriends.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        buttonLocationCenter.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-15)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        buttonAwards.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
    }
}

extension MapViewController: MapSearchBarViewDelegate {
    func didUpdateSearch(text: String) {
        
    }
}
