//
//  TrainStationViewModel.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

struct TrainStationViewModel {
    let numberOfStation: String?
    let name: String?
    let departureTime: String?


    init(train: Train) {
        numberOfStation = train.locationOrder ?? "nil"
        name = train.locationFullName ?? "noName"
        departureTime = train.scheduledDeparture ?? "00:00"

    }
}
