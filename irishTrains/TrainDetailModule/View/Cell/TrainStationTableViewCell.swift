//
//  TrainStationTableViewCell.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class TrainStationTableViewCell: UITableViewCell {

    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var stationNumber: UILabel!
    @IBOutlet weak var stationTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(trainStationViewModel: TrainStationViewModel) {
        stationName.text = trainStationViewModel.name ?? ""
        stationNumber.text = trainStationViewModel.numberOfStation ?? ""
        stationTime.text = trainStationViewModel.departureTime ?? ""
       }
    
}
