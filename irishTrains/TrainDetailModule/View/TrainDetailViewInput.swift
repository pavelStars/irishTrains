//
//  TrainDetailViewInput.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

protocol TrainDetailViewInput: Activable {
    func displayInfo(name: String, date: String)
    func display(trainSection: TrainSectionStation<TrainStationViewModel>)
}
