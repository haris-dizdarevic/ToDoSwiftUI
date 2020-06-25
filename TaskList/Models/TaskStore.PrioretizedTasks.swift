extension TaskStore {
    struct PrioretizedTasks {
        let priority: Task.Priority
        var tasks: [Task]
    }
}

extension TaskStore.PrioretizedTasks: Identifiable {
    var id: Task.Priority { priority }
}
