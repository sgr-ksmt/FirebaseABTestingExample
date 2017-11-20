//
//  ViewController.swift
//  FirebaseABTestingExample
//
//  Created by suguru-kishimoto on 2017/11/12.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import UIKit
import Lobster
import Firebase

class ViewController: UIViewController {
    @IBOutlet private weak var idLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Lobster.shared.debugMode = true
        Lobster.shared.fetchExpirationDuration = 0.0
        if let token = InstanceID.instanceID().token() {
            idLabel.text = InstanceID.instanceID().token()
            print(token)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonDidPress(_: Any) {
        Lobster.shared.fetch { [weak self] _ in
            let vc = OrderViewController.instantiate()
            let nav = UINavigationController(rootViewController: vc)
            self?.present(nav, animated: true, completion: nil)
        }

    }
}

