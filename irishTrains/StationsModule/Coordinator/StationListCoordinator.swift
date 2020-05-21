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

    init(navigationController: UINavigationController,
         errorHandler: ErrorHandler) {
        self.navigationController = navigationController
        self.errorHandler = errorHandler
    }

    func start() {
        let stationListModule = StationsListModuleConfigurator.createModule(errorHandler: errorHandler,
                                                                            completionHandler: { [weak self] action in
                                                                                self?.handleStationsRedirectionAction(action)
        })
        navigationController.pushViewController(stationListModule, animated: true)
    }

    private func handleStationsRedirectionAction(_ action: StationsRedirectionAction) {
          switch action {
          case .listStations:
            break;
          case .detailStation(let viewModel):
            startDetailScreen(stationModel: viewModel)
          case .trainDetails(let viewModel):
            startTrainDetailScreen(trainViewModel: viewModel)
          }
      }

    private func startDetailScreen(stationModel: StationViewModel) {
        let viewController = StationDetailsModuleConfigurator.createModule(for: stationModel,
                                                                           webService: StationWebService(),
                                                                           errorHandler: errorHandler,
                                                                           stationDesct: stationModel.name,
                                                                           completionHandler: { [weak self] action in
                                                                            self?.handleStationsRedirectionAction(action)
        })
        navigationController.pushViewController(viewController, animated: true)
    }

    private func startTrainDetailScreen(trainViewModel: TrainViewModel) {
        let viewController = TrainDetailModuleConfigurator.createModule(trainViewModel: trainViewModel,
                                                                        errorHandler: errorHandler,
                                                                        completionHandler: { [weak self] action in
                                                                            self?.handleStationsRedirectionAction(action)
        })
        navigationController.pushViewController(viewController, animated: true)
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
