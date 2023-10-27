//
//  File.swift
//  
//
//  Created by Taras Havryliak on 27.10.2023.
//

import Foundation
import Vapor
import Fluent

final class TodoRepository: TodoRepositoryProtocol {
    
    var db: Database

    init(db: Database) {
        self.db = db
    }
    
    func getAllTodos() async throws -> [Todo] {
        return try await Todo.query(on: db).all()
    }
    
    func getTodoByPK(pk: UUID) async throws -> Todo? {
        return try await Todo.find(pk, on: db)
    }

    func deleteTodoByPK(pk: UUID) async throws {
        try await Todo.find(pk, on: db)?.delete(on: db)
    }

    func createTodo(title: String) async throws -> Todo {
        let todo = Todo(title: title)
        try await todo.save(on: db)
        return todo
    }
}


