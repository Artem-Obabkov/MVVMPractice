//
//  DetailViewModel.swift
//  MVVMPractice
//
//  Created by pro2017 on 11/11/2021.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    // Инициализируем свойство age через nil. Т.е value в классе Box до тех пор пока не будет изменено является nil
    var age: Box<String?> = Box(nil)
    
    
    var description: String {
        return "\(profile.name) \(profile.secondName) is \(profile.age) y.o"
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
