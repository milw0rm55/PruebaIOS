//
//  ActorsTableViewCell.swift
//  iOsPrueba
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 10/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import UIKit

class ActorsTableViewCell: UITableViewCell {
    @IBOutlet  weak var imgAvatar : UIImageView!
    @IBOutlet  weak var lblName : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgAvatar.layer.cornerRadius=imgAvatar.frame.height/2
        imgAvatar.layer.masksToBounds=true
        
        
        lblName.layer.masksToBounds=true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
