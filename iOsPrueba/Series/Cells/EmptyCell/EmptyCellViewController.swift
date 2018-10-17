//
//  EmptyCellViewController.swift
//  iOsPrueba
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 10/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import UIKit
protocol EmptyCellViewControllerDelegate: class {
    func emptyCellViewControllerDidPressBack(cell:EmptyCellViewController)
}

class EmptyCellViewController: UITableViewCell {
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    weak var delegate : EmptyCellViewControllerDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBack.layer.cornerRadius = 10.0
        viewBack.layer.masksToBounds = true
        
        backButton.layer.cornerRadius = 10.0
        backButton.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    @IBAction func backButtonPressed(){
        delegate?.emptyCellViewControllerDidPressBack(cell:self)
    }
}
