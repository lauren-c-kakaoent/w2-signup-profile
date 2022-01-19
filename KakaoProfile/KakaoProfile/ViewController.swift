//
//  ViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.nameLabel.text = "Lauren"
        self.descriptionLabel.text = "카르페 디엠"
        
        self.nameLabel.font = self.nameLabel.font.withSize(17)
        self.nameLabel.textColor = UIColor.red
        self.nameLabel.alpha = 0.7
        
        self.descriptionLabel.font = self.descriptionLabel.font.withSize(17)
        self.descriptionLabel.textColor = UIColor.blue
        self.nameLabel.alpha = 0.7
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EditViewController {
            destination.profileName = self.nameLabel.text
            destination.profileDescription = self.descriptionLabel.text
            destination.profileImageContent = self.profileImage.image
            destination.delegate = self
        }
    }
    
    
    @IBAction func editButtonTouched(_ sender: UIButton) {
        self.nameLabel.textColor = UIColor.blue
        self.nameLabel.backgroundColor = UIColor.yellow
        self.nameLabel.alpha = 0.5
        self.descriptionLabel.text = "크루미션"
    }

}

extension ViewController: ProfileDelegate {
    
    func profileDidSet(_ profile: Profile) {
        self.nameLabel.text = profile.profileName
        self.descriptionLabel.text = profile.profileDescription
        self.profileImage.image = profile.profileImageContent
    }
}
