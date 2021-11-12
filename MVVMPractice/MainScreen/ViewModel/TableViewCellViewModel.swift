//
//  TableViewCellViewModel.swift
//  MVVMPractice
//
//  Created by pro2017 on 11/11/2021.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var profile: Profile
    
    // Теперь мы идем в ViewController и определяем что мы ждем от этой viewModel-и
    var fullName: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
    // Инициализируем приватное свойство profile
    init(profile: Profile) {
        self.profile = profile
    }
    
}
