import SwiftUI

struct TaskDetailView: View {
    @State var task: Task
    @ObservedObject var itemList: ItemList
    
    var body: some View {
        VStack {
            Text(task.name)
                .font(.title)
                .padding()
            
            Button(action: {
                task.isDone.toggle()
                if let index = itemList.items.firstIndex(where: { $0.id == task.id }) {
                    itemList.items[index] = task  
                }
            }) {
                Text(task.isDone ? "Mark as Not Done" : "Mark as Done")
                    .padding()
                    .background(task.isDone ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Task Detail")
    }
}

