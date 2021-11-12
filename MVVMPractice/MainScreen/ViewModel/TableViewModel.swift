//
//  TableViewModel.swift
//  MVVMPractice
//
//  Created by pro2017 on 11/11/2021.
//

import Foundation

// Для опеределения того, что нужно вписать во viewModel мы должны посмотреть класс TableViewController. И те места, где используется массив profiles, мы должны обрабатывать через ViewModel.
// В данном случае это numberOfRows и [profiles]



class TableViewModel: TableViewViewModelType {
    
    // Здесь будет храниться значение indexPath
    private var selectedIndexPath: IndexPath?
    
    var profiles = [
        Profile(name: "Jhon", secondName: "Snow", age: 33),
        Profile(name: "Eva", secondName: "Snow", age: 23),
        Profile(name: "Misha", secondName: "Snow", age: 45)
    ]
    
    var numbersOfRows: Int {
        return profiles.count
    }
    
    // Мы должны передать profile дальше, что бы ViewModel, подписанная под протокол TableViewCellViewModelType могла обрабатывать данный массив
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        
        // Возвращаем viewModel передав туда profile
        return TableViewCellViewModel(profile: profile)
    }
    
    func viewModelForSelectRow() -> DetailViewModelType? {
        // Проверяем есть ли indexPath и если есть создаем DetailViewModel с определенным профилем
        guard let selectedIndexPath = self.selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
