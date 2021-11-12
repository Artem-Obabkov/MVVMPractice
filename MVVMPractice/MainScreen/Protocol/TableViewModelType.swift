//
//  TableViewModelType.swift
//  MVVMPractice
//
//  Created by pro2017 on 11/11/2021.
//

import Foundation

// Мы должны строить нашу зависимость так, что бы она основывалась на абстракциях а не на конкретных типах, для этого мы используем protocol
// Используется для того, что бы мы могли использовать разные viewModel-и для одного viewController-a и это не вызывало ошибки

protocol TableViewViewModelType {
    
    var numbersOfRows: Int { get }
    
    // Мы порождаем вторую viewModel, которая будет отвечать за заполнение свойств ячейки на tableView. Эта viewModel подписана под протокол TableViewCellViewModelType
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType?
    
    // Добовляем метод, который будет порождать detailViewModel
    func viewModelForSelectRow() -> DetailViewModelType?
    
    // Второстепенный метод, который позволит хранить значение indexPath
    func selectRow(at indexPath: IndexPath)
}



