//
//  Coordinator.swift
//  testSantander
//
//  Created by Paulo Lazarini on 07/08/22.
//

import UIKit

protocol Coordinator {
    var currentViewController: UIViewController? { get set }
    func start()
}
