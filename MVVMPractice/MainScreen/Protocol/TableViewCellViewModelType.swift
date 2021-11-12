//
//  TableViewCellViewModelType.swift
//  MVVMPractice
//
//  Created by pro2017 on 11/11/2021.
//

import Foundation

// Создаем протокол для второй viewModel
protocol TableViewCellViewModelType: class {
    var fullName: String { get }
    var age: String { get }
}
