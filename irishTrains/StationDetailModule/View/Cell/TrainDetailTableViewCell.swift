//
//  TrainDetailTableViewCell.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 20.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class TrainDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var trainOrigin: UILabel!
    @IBOutlet weak var trainDeparture: UILabel!
    @IBOutlet weak var trainNameLabel: UILabel!
    @IBOutlet weak var trainTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(trainViewModel: TrainViewModel) {
        trainOrigin.text = "from: " + (trainViewModel.origin ?? "")
        trainDeparture.text = "to: " + (trainViewModel.destination ?? "")
        trainNameLabel.text = "Name: " + (trainViewModel.code ?? "")
        trainTime.text = "Arrival: " + (trainViewModel.arrivalTime ?? "")
    }
}
