//
//  CommonCell.swift
//  ChatApp
//
//  Created by Gautam Singh on 23/11/21.
//

import UIKit

class CommonCell: UITableViewCell {
    @IBOutlet weak var lblGeneral1: UILabel!
    @IBOutlet weak var lblGeneral2: UILabel!
    @IBOutlet weak var placeHolderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.placeHolderView.layer.cornerRadius = 4
        self.placeHolderView.layer.borderWidth = 0.5
        self.placeHolderView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(_ user: User){
        self.lblGeneral1.text = user.name
        self.lblGeneral2.text = user.userId
    }
}
