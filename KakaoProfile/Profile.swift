//
//  PassProfileInformationDelegate.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/18.
//

import UIKit

protocol ProfileDelegate: AnyObject {
    
    func profileDidSet(_ profile: Profile)
    
}

class Profile {
    var image: UIImage?
    var name: String
    var description: String
    
    init(name: String, description: String, image: UIImage? = nil) {
        self.name = name
        self.description = description
        self.image = image
    }
    
    weak var delegate: ProfileDelegate?
    func confirmNewProfile(name: String?, description: String?, image: UIImage? = nil) {
        self.name = name ?? self.name
        self.description = description ?? self.description
        self.image = image ?? self.image
        delegate?.profileDidSet(self)
    }
}
