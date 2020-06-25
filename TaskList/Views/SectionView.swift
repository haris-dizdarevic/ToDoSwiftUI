//
//  SectionView.swift
//  TaskList
//
//  Created by Haris Dizdarevic on 25/06/2020.
//  Copyright © 2020 Haris Dizdarevic. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioretizedTask: TaskStore.PrioretizedTasks

    var body: some View {
        Section(
            header: Text("\(prioretizedTask.priority.rawValue.capitalized) Priority")
        ) {
            ForEach(prioretizedTask.tasks) { index in
                RowView(task: self.$prioretizedTask.tasks[index])
            }
            .onMove(perform: { sourceIndices, destinationIndex in
                self.prioretizedTask.tasks.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
            })
            .onDelete { indexSet in
                self.prioretizedTask.tasks.remove(atOffsets: indexSet)
            }
        }
    }
}
