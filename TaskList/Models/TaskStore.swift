class TaskStore {
    var tasks: [Task] = [
        "Coda a SwiftUI app",
        "Book an escape room",
        "Walk the cat",
        "Pick up heavy thins and put them down",
        "Make caraoke playlist",
        "Present at iOS meetup group",
        "Climb El Capitan",
        "Learn to make baklava",
        "Play disc golf in every state",
        "100 movie reboot marathon"
    ].map { Task(name: $0) }

}
