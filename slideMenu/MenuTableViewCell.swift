//
//  MenuTableViewCell.swift
//  slideMenu
//
//  Created by Ирина Улитина on 08/10/2018.
//  Copyright © 2018 Christian Benua. All rights reserved.
//

import UIKit

class MenuTablewViewCell : UITableViewCell {
    
    var imageName : String! {
        didSet {
            imgView.image = UIImage(named: imageName)
        }
    }
    
    let label : UILabel = {
       let l = UILabel()
        return l;
    }()
    lazy var imgView : UIImageView = {
        
        let iv = UIImageView()
        return iv;
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        contentView.backgroundColor = .white
        contentView.addSubview(label)
        //imgView = UIImageView(image: UIImage(named: imageName))
        imgView.contentMode = .scaleAspectFit
        contentView.addSubview(imgView)
        imgView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: label.leftAnchor, paddingTop: 0, paddingLeft: -35, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        label.anchor(top: contentView.topAnchor, left: imgView.rightAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
