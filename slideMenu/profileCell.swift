//
//  profileCell.swift
//  slideMenu
//
//  Created by Ирина Улитина on 08/10/2018.
//  Copyright © 2018 Christian Benua. All rights reserved.
//

import UIKit

class profileCell : UITableViewCell {
    
    let imgView : UIImageView = {
       let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.masksToBounds = true
        v.image = #imageLiteral(resourceName: "obamka")
        return v
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imgView)
        imgView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        //imgView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
