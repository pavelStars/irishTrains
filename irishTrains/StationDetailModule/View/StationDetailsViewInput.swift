//
//  StationDetailsViewInput.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 19.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

protocol StationDetailsViewInput: Activable {
     func display(trainSection: TrainSection<TrainViewModel>)
}
