//
//  StationsListModuleConfigurator.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

enum StationsRedirectionAction {
    case listStations
    case detailStation(StationViewModel)
    case trainDetails(TrainViewModel)
}

typealias StationsListCompletionHandler = (StationsRedirectionAction) -> Void

class StationsListModuleConfigurator {
    public static func createModule(
                                    errorHandler: ErrorHandler,
                                    completionHandler: @escaping StationsListCompletionHandler) -> UIViewController {
        let storyboard = StoryboardProvider.getStoryboard(of: .main)
        let viewController = StationsListViewController.controllerInStoryboard(storyboard)
        let interactor = StationsListInteractor(webService: StationWebService())
        let presenter = StationsListPresenter(view: viewController,
                                              interactor: interactor,
                                              errorHandler: errorHandler,
                                              completionHandler: completionHandler)

        interactor.output = presenter
        viewController.output = presenter

        return viewController
    }
}
