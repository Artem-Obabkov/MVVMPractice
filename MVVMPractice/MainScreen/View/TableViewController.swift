//
//  TableViewController.swift
//  MVVMPractice
//
//  Created by pro2017 on 27/10/2021.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Обращаемся к протоколу TableViewModelType, т.е любая ViewModel, котораяя подписана под данный протокол может быть использована в данном ViewController-e
    var tableViewModel: TableViewViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Но присваивать мы должны именно viewModel, а не ее протокол
        tableViewModel = TableViewModel()
        
    }
}

// MARK: - TableViewDelegate / DataSource

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel?.numbersOfRows ?? 0
    }
    
    // ViewModel порождает другую ViewModel, поэтому строки с присвоение данных ячейке будут не актуальны
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as? ProfileCell
        
        guard
            let profileCell = cell,
            let tableViewModel = tableViewModel,
            let cellViewModel = tableViewModel.cellViewModel(for: indexPath)
        else { return ProfileCell() }
        
        profileCell.viewModel = cellViewModel
        
        return profileCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let tableViewModel = tableViewModel else { return }
        
        // Сохраняем indexPath в модели
        tableViewModel.selectRow(at: indexPath)
        
        // Совершаем сам переход
        performSegue(withIdentifier: "datailView", sender: nil)
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "datailView" else { return }
        
        if let tableViewModel = tableViewModel {
            
            // Создаем VC на который переходим
            if let destinationVC = segue.destination as? DetailViewController {
                
                // Создаем DetailViewModel. Значение indexPath у нас уже сохранено в TableViewModel
                destinationVC.viewModel = tableViewModel.viewModelForSelectRow()
            }
        }
    }
}

