//
//  OrderViewController.swift
//  FirebaseABTestingExample
//
//  Created by suguru-kishimoto on 2017/11/18.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation
import Instantiate
import InstantiateStandard
import Lobster
import Kingfisher

final class OrderViewController: UIViewController, StoryboardInstantiatable {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var floatingBuyButtonView: OrderBuyButtonViewWrapper!
    @IBOutlet private weak var embeddedBuyButtonView: OrderBuyButtonViewWrapper!
    @IBOutlet private weak var embeddedButtonViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!

    private var buyButtonView: OrderBuyButtonView?
    override func loadView() {
        super.loadView()
        title = "クロスバイク"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
        setupUI()
    }

    private func setupUI() {
        switch Lobster.shared[.buyButtonType] ?? .floating {
        case .floating:
            floatingBuyButtonView.isHidden = false
            embeddedBuyButtonView.isHidden = true
            floatingBuyButtonView.isHidden = false
            scrollView.contentInset.bottom = 60.0
            scrollView.scrollIndicatorInsets.bottom = 60.0
            embeddedButtonViewHeightConstraint.constant = 0.0

            buyButtonView = floatingBuyButtonView.view
        case .embedded:
            floatingBuyButtonView.isHidden = true
            embeddedBuyButtonView.isHidden = false
            scrollView.contentInset.bottom = 0.0
            scrollView.scrollIndicatorInsets.bottom = 0.0
            embeddedButtonViewHeightConstraint.constant = 60.0

            buyButtonView = embeddedBuyButtonView.view
        }

        buyButtonView?.buyButton.backgroundColor = Lobster.shared[.buyButtonColor]
        buyButtonView?.backgroundColor = Lobster.shared[.priceBackgroundColor]
        titleLabel.textColor = Lobster.shared[.titleTextColor]
        let fontSize = CGFloat(Lobster.shared[.titleTextSize] ?? 24.0)
        titleLabel.font = .systemFont(ofSize: fontSize)
        descriptionLabel.textColor = Lobster.shared[.descriptionTextColor]
        imageView.kf.setImage(with: Lobster.shared[.itemURL])
    }

    @objc private func close(_: Any) {
        dismiss(animated: true, completion: nil)
    }
}
