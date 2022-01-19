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

protocol Profile {
    var profileImageContent: UIImage? { get set }
    var profileName: String? { get set }
    var profileDescription: String? { get set }
    
    func confirmNewProfile(name: String?, description: String?, image: UIImage?) -> Void
}
