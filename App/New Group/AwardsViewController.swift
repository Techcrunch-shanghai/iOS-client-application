//
//  AwardsViewController.swift
//  App
//
//  Created by Remi Robert on 25/11/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Hero

class CollectionViewLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        itemSize = CGSize(width: UIScreen.main.bounds.size.width / 3, height: UIScreen.main.bounds.size.width / 3)
        scrollDirection = .vertical
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AwardCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        contentView.addSubview(imageView)
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func bind(image: UIImage) {
        imageView.image = image
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AwardsViewController: UIViewController {
    private let images: [UIImage] = [
        #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "8")
    ]
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: CollectionViewLayout())
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Awards"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "main",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(self.dismissController))
        blurView.alpha = 0.7
        view.addSubview(blurView)
        view.addSubview(collectionView)
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.register(AwardCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc private func dismissController() {
        dismiss(animated: true, completion: nil)
    }
}

extension AwardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AwardCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bind(image: images[indexPath.row])
        return cell
    }
}
