//
//  DetailViewController.swift
//  MVVMPractice
//
//  Created by pro2017 on 11/11/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // При вызове DetailViewController мы передадим сюда его ViewModel
    var viewModel: DetailViewModelType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // У viewModel появилось свойство age, которое предстваляет из себя класс обертку и так же содержит метод bind, что позволяет связать это свойство и изменения
        viewModel?.age.bind { [unowned self] string in
            
            // Проверяяем string на nil. Т.е было ли передано туда какое-нибудь зачение
            guard string != nil else { return }
            
            // Присваиваем значение 
            self.descriptionLabel.text = string
        }
        
        
        // С помощью задержки присвоим значение новое зачение viewModel.age.value и descriptionLabel автоматически обновится
        self.delay(with: 5) { [unowned self] in
            self.viewModel?.age.value = "Мы изменили зачение не трогая label"
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Проверяем есть ли ViewModel
        guard let viewModel = viewModel else { return }
        
        // Присваиваем данные ViewModel данным ViewController-a
        self.descriptionLabel.text = viewModel.description
    }
    
    
    private func delay(with delaySec: Int, clousere: @escaping () -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delaySec)) {
            clousere()
        }
    }
}



