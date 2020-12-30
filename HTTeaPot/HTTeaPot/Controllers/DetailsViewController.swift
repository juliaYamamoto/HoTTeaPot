//
//  DetailsViewController.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Methods
    
    func setInformationsWith(_ statusCode: StatusCode){
        self.codeLabel.text = statusCode.code
        self.titleLabel.text = statusCode.title
        self.typeLabel.text = statusCode.type
        self.descriptionLabel.text = statusCode.description
        self.sourceLabel.text = statusCode.source
        
        setupViewWith(statusCode)
    }
    
    func setupViewWith(_ statusCode: StatusCode){
        guard let type = CodeType.getTypeFromName(statusCode.type) else { return }
        
        self.codeLabel.textColor = UIColor(named: getColorNameForType(type))
        self.titleLabel.textColor = UIColor(named: Constants.ColorName().grayTitle)
        self.typeLabel.textColor = UIColor(named: Constants.ColorName().graySubtitle)
        self.descriptionLabel.textColor = UIColor(named: getColorNameForType(type))
        self.sourceLabel.textColor = UIColor(named: Constants.ColorName().graySubtitle)
        
        self.okButton.backgroundColor = UIColor(named: getColorNameForType(type))
        self.okButton.titleLabel?.textColor = UIColor(named: Constants.ColorName().graySubtitle)
        self.okButton.layer.cornerRadius = 5
    }
    
    // MARK: - IBAction
    
    @IBAction func okClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
