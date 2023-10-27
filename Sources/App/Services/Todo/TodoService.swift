//
//  File.swift
//  
//
//  Created by Taras Havryliak on 27.10.2023.
//

import Foundation


final class TodoService: TodoServiceProtocol {
    
    var repo: TodoRepositoryProtocol
    init(repo: TodoRepositoryProtocol) {
        self.repo = repo
    }

    func createTodo(dto: CreateTodoDTO) async throws -> Todo {
        return try await self.repo.createTodo(title: dto.title)
    }
    
    func getAllTodos() async throws -> [Todo] {
        return try await self.repo.getAllTodos()
    }

    func getTodo(id: String) async throws -> Todo? {
        return try await self.repo.getTodoByPK(pk: UUID(uuidString: id)!)
    }
    
    func deleteTodo(id: String) async throws {
        try await self.repo.deleteTodoByPK(pk: UUID(uuidString: id)!)
    }
}
