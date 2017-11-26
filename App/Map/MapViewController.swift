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
        buttonCoupons.backgroundColor = UIColor.darkGray
        buttonLocationCenter.backgroundColor = UIColor.darkGray
        buttonAwards.backgroundColor = UIColor.darkGray

        buttonCoupons.setImage(UIImage(named: "coupon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        buttonLocationCenter.setImage(UIImage(named: "location")?.withRenderingMode(.alwaysTemplate), for: .normal)
        buttonAwards.setImage(UIImage(named: "award")?.withRenderingMode(.alwaysTemplate), for: .normal)

        buttonCoupons.imageView?.contentMode = .scaleAspectFit
        buttonLocationCenter.imageView?.contentMode = .scaleAspectFit
        buttonAwards.imageView?.contentMode = .scaleAspectFit

        buttonCoupons.addTarget(self, action: #selector(self.displayCoupons), for: .touchUpInside)
        buttonLocationCenter.addTarget(self, action: #selector(self.centerUserLocation), for: .touchUpInside)
        buttonAwards.addTarget(self, action: #selector(self.displayAwards), for: .touchUpInside)

        buttonCoupons.tintColor = UIColor.white
        buttonLocationCenter.tintColor = UIColor.white
        buttonAwards.tintColor = UIColor.white
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
        let navigationController = NavigationViewController(rootViewController: controller)
        navigationController.view.backgroundColor = UIColor.clear
        navigationController.modalPresentationStyle = .overFullScreen
        present(navigationController, animated: true, completion: nil)
    }

    @objc private func centerUserLocation() {
        mapView.centerUserLocation()
    }

    @objc private func displayAwards() {
        let controller = AwardsViewController()
        let navigationController = NavigationViewController(rootViewController: controller)
        navigationController.view.backgroundColor = UIColor.clear
        navigationController.modalPresentationStyle = .overFullScreen
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
            make.bottom.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        buttonLocationCenter.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        buttonAwards.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        buttonCoupons.layer.cornerRadius = 20
        buttonAwards.layer.cornerRadius = 20
        buttonLocationCenter.layer.cornerRadius = 30
    }
}

extension MapViewController: MapSearchBarViewDelegate {
    func didUpdateSearch(text: String) {
        
    }
}
