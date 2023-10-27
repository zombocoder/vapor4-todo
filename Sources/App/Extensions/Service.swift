//
//  File.swift
//  
//
//  Created by Taras Havryliak on 27.10.2023.
//

import Foundation
import Vapor


struct Services {
    var todoService: TodoServiceProtocol
}

extension Application {
    var services: Services {
        get {
            .init(todoService: TodoService(repo: TodoRepository(db: self.db)))
        }
    }
}
