//
//  StationDetailsModuleConfigurator.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

typealias StationDetailsCompletionHandler = (StationsRedirectionAction) -> Void

class StationDetailsModuleConfigurator {
    public static func createModule(for stationItem: StationViewModel,
                                    webService: StationWebServicesProtocol,
                                    errorHandler: ErrorHandler,
                                    stationDesct: String,
                                    completionHandler: @escaping StationDetailsCompletionHandler) -> UIViewController {
        let storyboard = StoryboardProvider.getStoryboard(of: .main)
        let viewController = StationDetailsViewController.controllerInStoryboard(storyboard)
        let interactor = StationDetailsInteractor(webService: webService)
        let presenter = StationDetailsPresenter(view: viewController,
                                                interactor: interactor,
                                                errorHandler: errorHandler,
                                                completionHandler: completionHandler,
                                                stationDesct: stationDesct)

        interactor.output = presenter
        viewController.output = presenter

        return viewController
    }
}
