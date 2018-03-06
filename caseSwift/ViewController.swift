//
//  ViewController.swift
//  caseSwift
//
//  Created by Cihangir Sungur on 3/2/18.
//  Copyright © 2018 Cihangir Sungur. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.

        NetworkManager.shared().hello()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
