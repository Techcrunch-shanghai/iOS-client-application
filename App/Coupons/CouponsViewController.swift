//
//  CouponsViewController.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class CouponsViewController: UIViewController {
    private let viewModel: CouponViewModel
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    private let tableView = UITableView(frame: CGRect.zero, style: .grouped)

    init(viewModel: CouponViewModel = CouponViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coupons"

        view.backgroundColor = UIColor.clear
        blurView.alpha = 0.7
        view.addSubview(blurView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "main",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(self.dismissController))
        view.addSubview(tableView)
        setupViews()
        setupLayout()
        bindViewModel()
    }

    @objc private func dismissController() {
        dismiss(animated: true, completion: nil)
    }

    private func bindViewModel() {
        viewModel.completionUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.start()
    }

    private func setupViews() {
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(CouponTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func setupLayout() {
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CouponsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coupons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CouponTableViewCell else {
            return UITableViewCell()
        }
        cell.bind(coupon: viewModel.coupons[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
