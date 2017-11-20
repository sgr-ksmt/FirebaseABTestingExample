//
//  OrderBuyButtonView.swift
//  FirebaseABTestingExample
//
//  Created by suguru-kishimoto on 2017/11/18.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard

class OrderBuyButtonView: UIView, NibInstantiatable {
    @IBOutlet private(set) weak var buyButton: UIButton!
    @IBOutlet private(set) weak var priceLabel: UILabel!
}

class OrderBuyButtonViewWrapper: UIView, NibInstantiatableWrapper {
    typealias Wrapped = OrderBuyButtonView
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
}
