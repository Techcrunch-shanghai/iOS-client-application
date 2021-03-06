//
//  MapSearchBarView.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

protocol MapSearchBarViewDelegate: class {
    func didUpdateSearch(text: String)
}

class MapSearchBarView: UIView {
    private let searchBar = UISearchBar()
    private let searchToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))

    weak var delegate: MapSearchBarViewDelegate?

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
        backgroundColor = UIColor.white.withAlphaComponent(0.6)
        searchBar.isTranslucent = true
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        searchBar.returnKeyType = .search
        searchBar.keyboardAppearance = .dark
        searchBar.placeholder = "Search a place"
        searchBar.inputAccessoryView = searchToolBar
        searchToolBar.tintColor = UIColor.black
        searchToolBar.items = [UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissSearch))]
    }

    @objc private func dismissSearch() {
        endEditing(true)
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

extension MapSearchBarView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        endEditing(true)
        delegate?.didUpdateSearch(text: searchBar.text ?? "")
    }
}
