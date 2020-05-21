//
//  ViewController.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var continueButton: UIButton!
    private var stationListCoordinator: StationListCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAction()
    }

    private func setupButtonAction() {
        continueButton.addTarget(self, action: #selector(userDidTapActionButton), for: .touchUpInside)
    }

    @objc private func userDidTapActionButton() {
        let errorHandler = ErrorHandler(viewController: self)

        guard let navigationViewController = navigationController else {
            return
        }

        stationListCoordinator = StationListCoordinator(navigationController: navigationViewController,
                                                            errorHandler: errorHandler)
        stationListCoordinator?.start()
    }
}

