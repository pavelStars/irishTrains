//
//  StationDetailsViewOutput.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

protocol StationDetailsViewOutput {
    func viewIsReady()
    func loadStationDetails()
    func didTap(trainViewModel: TrainViewModel)
}
