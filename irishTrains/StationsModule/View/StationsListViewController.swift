//
//  StationsListViewController.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class StationsListViewController: UIViewController {
    var output: StationsListViewOutput?
    @IBOutlet private weak var stationList: UITableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewIsReady()
    }
}

extension StationsListViewController: StationsListViewInput {
}
