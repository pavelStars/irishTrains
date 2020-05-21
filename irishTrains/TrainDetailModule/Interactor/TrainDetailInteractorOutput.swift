//
//  TrainDetailInteractorOutput.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

protocol TrainDetailInteractorOutput: class {
    func didFetchTrainStations(trainStrations: [Train])
    func didLoadDataWithError(error: Error)
}
