//
//  TrainMovement.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import Foundation

struct TrainMovement: Codable {
    let trainCode: String?
    let trainDate: String?
    let trainOrigin: String?
    let trainDestination: String?
    let trainStatus: String?
    let locationCode: String?
    let locationFullName: String?
    let locationOrder: String?
    let locationType: String?
    let scheduledArrival: String?
    let scheduledDeparture: String?
    let expectedArrival: String?
    let expectedDeparture: String?
    let arrival: String?
    let departure: String?
    let publicMessage: String?
    let direction: String?

    private enum CodingKeys: String, CodingKey {
        case trainCode = "TrainCode"
        case trainDate = "TrainDate"
        case trainOrigin = "TrainOrigin"
        case trainDestination = "TrainDestination"
        case trainStatus = "TrainStatus"
        case locationCode = "LocationCode"
        case locationFullName = "LocationFullName"
        case locationOrder = "LocationOrder"
        case locationType = "LocationType"
        case scheduledArrival = "ScheduledArrival"
        case scheduledDeparture = "ScheduledDeparture"
        case expectedArrival = "ExpectedArrival"
        case expectedDeparture = "ExpectedDeparture"
        case arrival = "Arrival"
        case departure = "Departure"
        case publicMessage = "PublicMessage"
        case direction = "Direction"
    }
}
