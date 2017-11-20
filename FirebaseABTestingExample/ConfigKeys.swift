//
//  ConfigKeys.swift
//  FirebaseABTestingExample
//
//  Created by suguru-kishimoto on 2017/11/18.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import UIKit
import Lobster

extension ConfigKeys {
    static let buyButtonColor = ConfigKey<UIColor>("buy_button_color")
    static let priceBackgroundColor = ConfigKey<UIColor>("price_background_color")
    static let titleTextSize = ConfigKey<Double>("title_text_size")
    static let titleTextColor = ConfigKey<UIColor>("title_text_color")
    static let descriptionTextColor = ConfigKey<UIColor>("description_text_color")
    static let itemURL = ConfigKey<URL>("item_url")
    static let buyButtonType = ConfigKey<BuyButtonType>("buy_button_type")
}

enum BuyButtonType: Int {
    case floating = 0
    case embedded = 1
}
