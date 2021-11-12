//
//  DetailViewModelType.swift
//  MVVMPractice
//
//  Created by pro2017 on 11/11/2021.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    
    // Указываем, что у нас есть новое свойство, которое будет меняться. 
    var age: Box<String?> { get }
}
