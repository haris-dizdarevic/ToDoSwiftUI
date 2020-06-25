import SwiftUI

struct NewTaskView: View {
    var taskStore: TaskStore
    @State var text: String = ""
    @State var priority: Task.Priority = .medium
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            TextField("TaskName", text: $text)

            VStack {
                Text("Priority")
                Picker("Priority", selection: $priority.caseIndex) {
                    ForEach(Task.Priority.allCases.indices) { priorityIndex in
                        Text(
                            Task.Priority.allCases[priorityIndex].rawValue.capitalized
                        )
                            .tag(priorityIndex)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }


            Button("Add") {
                if let index = self.taskStore.prioretizedTasks.firstIndex(where: { (task) -> Bool in
                    task.priority == self.priority
                }) {
                    self.taskStore.prioretizedTasks[index].tasks.append(Task(name: self.text))
                } else {
                    self.taskStore.prioretizedTasks.append(
                        TaskStore.PrioretizedTasks(priority: self.priority, tasks: [Task(name: self.text)])
                    )
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(text.isEmpty)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore())
    }
}
