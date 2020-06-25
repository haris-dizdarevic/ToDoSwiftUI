import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore: TaskStore
    @State var modalIsPresented: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(taskStore.prioretizedTasks) { index in
                    SectionView(prioretizedTask: self.$taskStore.prioretizedTasks[index])
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button(action: {
                        self.modalIsPresented = true
                    }) {
                        Image(systemName: "plus")
                    }
            )
            
        }
        .sheet(isPresented: $modalIsPresented) {
            NewTaskView(taskStore: self.taskStore)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
