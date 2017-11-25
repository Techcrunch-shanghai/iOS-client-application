//
//  MapSearchBarView.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class MapSearchBarView: UIView {
    private let searchBar = UISearchBar()

    init() {
        super.init(frame: CGRect.zero)
        setupViews()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        searchBar.isTranslucent = true
        searchBar.searchBarStyle = .minimal
    }

    private func setupHierarchy() {
        addSubview(searchBar)
    }

    private func setupLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
    }
}
