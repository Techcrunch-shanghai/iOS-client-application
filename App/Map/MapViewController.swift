//
//  MapViewController.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit
import Hero

class MapViewController: UIViewController {
    private let searchBarView = MapSearchBarView()
    private let mapView = MapView()

    private let buttonCoupons = MapButton(image: UIImage())
    private let buttonLocationCenter = MapButton(image: UIImage())
    private let buttonAwards = MapButton(image: UIImage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        isHeroEnabled = true
        searchBarView.delegate = self
        buttonCoupons.backgroundColor = UIColor.blue
        buttonLocationCenter.backgroundColor = UIColor.blue
        buttonAwards.backgroundColor = UIColor.blue

        buttonCoupons.addTarget(self, action: #selector(self.displayCoupons), for: .touchUpInside)
        buttonLocationCenter.addTarget(self, action: #selector(self.centerUserLocation), for: .touchUpInside)
        buttonAwards.addTarget(self, action: #selector(self.displayAwards), for: .touchUpInside)
    }

    private func setupHierarchy() {
        view.addSubview(mapView)
        view.addSubview(searchBarView)
        view.addSubview(buttonCoupons)
        view.addSubview(buttonLocationCenter)
        view.addSubview(buttonAwards)
    }

    @objc private func displayCoupons() {
        let controller = CouponsViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.view.backgroundColor = UIColor.white
        navigationController.isHeroEnabled = true
        navigationController.heroModalAnimationType = .selectBy(presenting: .cover(direction: HeroDefaultAnimationType.Direction.right), dismissing: .uncover(direction: HeroDefaultAnimationType.Direction.left))
        present(navigationController, animated: true, completion: nil)
    }

    @objc private func centerUserLocation() {
        mapView.centerUserLocation()
    }

    @objc private func displayAwards() {
        let controller = AwardsViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.view.backgroundColor = UIColor.white
        navigationController.isHeroEnabled = true
        navigationController.heroModalAnimationType = .selectBy(presenting: .cover(direction: HeroDefaultAnimationType.Direction.left), dismissing: .uncover(direction: HeroDefaultAnimationType.Direction.right))
        present(navigationController, animated: true, completion: nil)
    }

    private func setupLayout() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        searchBarView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        buttonCoupons.snp.makeConstraints { make in
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
