//
//  ProfileViewController.swift
//  slideMenu
//
//  Created by Ирина Улитина on 08/10/2018.
//  Copyright © 2018 Christian Benua. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let imageView : UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.layer.masksToBounds = true
        i.image = #imageLiteral(resourceName: "obamka")
        return i
    }()
    
    let aboutLabel: UILabel = {
       let l = UILabel()
        l.numberOfLines = -1
        l.text = "Чисто челик почилить на пост пррезидента зашел. КФС там, арбуза бесплатные и пацанчик кайфовал, но не долго музыка играла, не долго фраер танцевал, вот И Трамп уже на его месте. Был пацан, и нет пацана"
        return l
    }()
    
    let container: UIView = {
        let v = UIView()
        return v;
        
    }()
    
    
    @objc func trigger() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(container)
        container.addSubview(aboutLabel)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
        container.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 30, paddingRight: 20, width: 0, height: 0)
        aboutLabel.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right: container.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
