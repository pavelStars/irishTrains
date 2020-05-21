//
//  TrainDetailViewOutput.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright (c) 2020 Pavel Terziyski. All rights reserved.
//

protocol TrainDetailViewOutput {
    func viewIsReady()
    func loadTrainStation()
    func getInitialValues() 
}
