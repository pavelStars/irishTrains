//
//  TrainDetailPresenter.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//
import Foundation

enum TrainSectionStation<T> {
    case empty
    case viewModels([T])
}

class TrainDetailPresenter {
    unowned var view: TrainDetailViewInput
    var interactor: TrainDetailInteractorInput
    var errorHandler: ErrorHandler?
    var completionHandler: TrainDetailCompletionHandler?
    private let trainViewModel: TrainViewModel
    private var trainStationSection: TrainSectionStation<TrainStationViewModel> = .empty

    private var allTrainStations: [Train] = [] {
          didSet {
            let viewModels = allTrainStations.map({ TrainStationViewModel(train: $0) })
              if viewModels.count > 0 {
                  trainStationSection = .viewModels(viewModels)
              }
            view.display(trainSection: trainStationSection)
          }
      }

    init(view: TrainDetailViewInput,
         interactor: TrainDetailInteractorInput,
         errorHandler: ErrorHandler?,
         completionHandler: TrainDetailCompletionHandler?,
         trainViewModel: TrainViewModel) {
        self.view = view
        self.interactor = interactor
        self.errorHandler = errorHandler
        self.completionHandler = completionHandler
        self.trainViewModel = trainViewModel
    }

    private func sendRequestForAllTrainStations() {
        view.startActivityIndicator()
        guard let trainName = trainViewModel.code else {
            return
        }
        interactor.loadStation(trainName: trainName,
                               date: createStringFromTodayDate())
    }

    private func createStringFromTodayDate() -> String {
        let date = Date()

        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMMyyyy"

        return formatter.string(from: date)
    }

    private func createStringForTittleView() -> String {
        let date = Date()

               let formatter = DateFormatter()
               formatter.dateFormat = "dd-MMM"

               return formatter.string(from: date)
    }
}

// MARK: - TrainDetailPresenterViewOutput

extension TrainDetailPresenter: TrainDetailViewOutput {
    func getInitialValues() {
        guard let name = trainViewModel.code else {
            return
        }
        view.displayInfo(name: name, date: createStringForTittleView())
    }

    func viewIsReady() {
    }

    func loadTrainStation() {
        sendRequestForAllTrainStations()
    }
}

// MARK: - TrainDetailPresenterInteractorOutput

extension TrainDetailPresenter: TrainDetailInteractorOutput {
    func didFetchTrainStations(trainStrations: [Train]) {
        view.stopActivityIndicator()
        allTrainStations = trainStrations
    }

    func didLoadDataWithError(error: Error) {
        view.stopActivityIndicator()
        errorHandler?.handleError(error)
    }

}
