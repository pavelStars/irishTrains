//
//  StationTableViewCell.swift
//  irishTrains
//
//  Created by Pavel Terziyski on 18.05.20.
//  Copyright © 2020 Pavel Terziyski. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet private weak var stationNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(stationViewModel: StationViewModel) {
        stationNameLabel.text = stationViewModel.name
    }
    
}
