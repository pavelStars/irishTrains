//
//  TrainDetailModuleConfigurator.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

typealias TrainDetailCompletionHandler = (StationsRedirectionAction) -> Void

class TrainDetailModuleConfigurator {
    public static func createModule(trainViewModel: TrainViewModel,
                                    errorHandler: ErrorHandler,
                                    completionHandler: @escaping TrainDetailCompletionHandler) -> UIViewController {
        let storyboard = StoryboardProvider.getStoryboard(of: .main)
        let viewController = TrainDetailViewController.controllerInStoryboard(storyboard)
        let interactor = TrainDetailInteractor(webService: StationWebService())
        let presenter = TrainDetailPresenter(view: viewController,
                                             interactor: interactor,
                                             errorHandler: errorHandler,
                                             completionHandler: completionHandler,
                                             trainViewModel: trainViewModel)

        interactor.output = presenter
        viewController.output = presenter

        return viewController
    }
}
