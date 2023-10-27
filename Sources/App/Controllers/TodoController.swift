import Fluent
import Vapor

struct TodoController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("todos")
        todos.get(use: index)
        todos.post(use: create)
        todos.group(":todoID") { todo in
            todo.get(use: get)
            todo.delete(use: delete)
        }
    }

    func index(req: Request) async throws -> [Todo] {
        return try await req.application.services.todoService.getAllTodos()
    }

    func create(req: Request) async throws -> Todo {
        let dto = try req.content.decode(CreateTodoDTO.self)
        return try await req.application.services.todoService.createTodo(dto: dto)
    }

    func get(req: Request) async throws -> Todo {
        guard let todo = try await req.application.services.todoService.getTodo(
            id: req.parameters.get("todoID")!) else {
            throw Abort(.notFound)
        }
        return todo
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await req.application.services.todoService.getTodo(
            id: req.parameters.get("todoID")!) else {
            throw Abort(.notFound)
        }
        try await req.application.services.todoService.deleteTodo(id: todo.id!.uuidString)
        return .noContent
    }
}
