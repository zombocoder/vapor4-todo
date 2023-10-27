//
//  File.swift
//  
//
//  Created by Taras Havryliak on 27.10.2023.
//

import Foundation
import Vapor
import Fluent


protocol TodoRepositoryProtocol {
    init(db: Database)
    func getAllTodos() async throws -> [Todo]
    func getTodoByPK(pk: UUID) async throws -> Todo?
    func deleteTodoByPK(pk: UUID) async throws
    func createTodo(title: String) async throws -> Todo
}
