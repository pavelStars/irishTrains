//
//  TrainViewModel.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation


struct TrainViewModel {
    let code: String?
    let origin: String?
    let destination: String?
    let lastLocation: String?
    let arrivalTime: String?

    init(trainDetail: StationDetail) {
        code = trainDetail.trainCode ?? "0"
        origin = trainDetail.origin ?? "fromNowhere"
        destination = trainDetail.destination ?? "toNowhere"
        lastLocation = trainDetail.lastLocation ?? "noInfo"
        arrivalTime = trainDetail.exparrival ?? "noArivalInfo"
    }
}
