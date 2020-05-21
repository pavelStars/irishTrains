//
//  StationListCoordinator.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class StationListCoordinator: Coordinator {

    private var navigationController: UINavigationController
    private var errorHandler: ErrorHandler

    init(navigationController: UINavigationController, errorHandler: ErrorHandler) {
        self.navigationController = navigationController
        self.errorHandler = errorHandler
    }

    func start() {
        let stationListModule = StationsListModuleConfigurator.createModule(errorHandler: errorHandler,
                                                                            completionHandler: { [weak self] in
                                                                                self?.navigationController.popToRootViewController(animated: true)
        })
        navigationController.pushViewController(stationListModule, animated: true)
    }
}

protocol Coordinator: class {
    func start()
    func stop()
}

extension Coordinator {
    func stop() {
        // No default implementation
    }
}
