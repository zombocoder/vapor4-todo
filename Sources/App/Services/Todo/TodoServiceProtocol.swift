//
//  File.swift
//  
//
//  Created by Taras Havryliak on 27.10.2023.
//

import Foundation


protocol TodoServiceProtocol {
    init(repo: TodoRepositoryProtocol)
    func getAllTodos() async throws -> [Todo]
    func getTodo(id: String) async throws -> Todo?
    func deleteTodo(id: String) async throws
    func createTodo(dto: CreateTodoDTO) async throws -> Todo
}

