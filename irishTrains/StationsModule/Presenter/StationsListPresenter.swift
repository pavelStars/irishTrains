//
//  StationsListPresenter.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 17.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

class StationsListPresenter {
    unowned var view: StationsListViewInput
    var interactor: StationsListInteractorInput
    var errorHandler: ErrorHandler?
    var completionHandler: StationsListCompletionHandler?

    init(view: StationsListViewInput,
         interactor: StationsListInteractorInput,
         errorHandler: ErrorHandler?,
         completionHandler: StationsListCompletionHandler?) {
        self.view = view
        self.interactor = interactor
        self.errorHandler = errorHandler
        self.completionHandler = completionHandler
    }
}

// MARK: - StationsListPresenterViewOutput

extension StationsListPresenter: StationsListViewOutput {
    func viewIsReady() {
    }
}

// MARK: - StationsListPresenterInteractorOutput

extension StationsListPresenter: StationsListInteractorOutput {
}
