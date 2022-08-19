//
//  TableViewCell.swift
//  testSantander
//
//  Created by Paulo Lazarini on 08/06/22.
//

import UIKit

class TableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var paymentDate: UILabel!
    @IBOutlet weak var contaDeLuz: UILabel!
    @IBOutlet weak var valorConta: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
