import Combine

class TaskStore: ObservableObject {
    @Published var prioretizedTasks: [PrioretizedTasks] = [
        PrioretizedTasks(priority: .high, names: [
            "Coda a SwiftUI app",
            "Book an escape room",
            "Walk the cat"
        ]),
        PrioretizedTasks(priority: .medium, names: [
            "Pick up heavy thins and put them down",
            "Make caraoke playlist"
        ]),
        PrioretizedTasks(priority: .low, names: [
            "Climb El Capitan",
            "Learn to make baklava"
        ]),
        PrioretizedTasks(priority: .no, names: [
            "Play disc golf in every state",
            "100 movie reboot marathon"
        ])
    ]
}

private extension TaskStore.PrioretizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(priority: priority, tasks: names.map { Task(name: $0) })
    }
}
