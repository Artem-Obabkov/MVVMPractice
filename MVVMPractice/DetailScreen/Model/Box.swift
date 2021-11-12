//
//  Box.swift
//  MVVMPractice
//
//  Created by pro2017 on 12/11/2021.
//

import Foundation

// Создаем класс обертку для связывания
class Box<T> {
    
    // Создаем новый тип данных Listener, который представляет из себя клоужер, принимающий generic значение и ничего не возвращающий
    typealias Listener = (T) -> ()
    
    // Создаем наблюдателя/слушателя, который будет реагировать на изменения значения value. Изначально он равен nil и мы присвоим ему значение только в функции bind
    var listener: Listener?
    
    
    // Создаем значение, которое будет менятся
    var value: T {
        didSet {
            // Передаем новое значение наблюдателю/слушателю
            listener?(value)
        }
    }
    
    // Инициализируем слушателя/наблюдателя и передаем в него начальное значение
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    // Инициализируем значение value
    init(_ value: T) {
        self.value = value
    }
    
}

// Далее идем в протокол и саму ViewModel в которой мы эту связку хотим делать
