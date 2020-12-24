//
//  StatusCodeTableViewCell.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-23.
//

import UIKit

class StatusCodeTableViewCell: UITableViewCell {

    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // TODO
    }
    
    func setupCellWith(statusCode: StatusCode){
        guard let type = CodeType.getTypeFromName(statusCode.type) else { return }
        
        codeLabel.text = statusCode.code
        codeLabel.textColor = UIColor(named: getColorNameForType(type))
        codeLabel.font = UIFont(name: Constants.Font().robotoBold, size: 17)
        
        titleLabel.text = statusCode.title
        titleLabel.font = UIFont(name: Constants.Font().robotoRegular, size: 17)
    }
}
