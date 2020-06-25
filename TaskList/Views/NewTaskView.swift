import SwiftUI

struct NewTaskView: View {
    var taskStore: TaskStore
    @State var text: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            TextField("TaskName", text: $text)

            Button("Add") {
                self.taskStore.tasks.append(Task(name: self.text))
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
