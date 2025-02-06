import SwiftUI

struct ItemListView: View {
    @ObservedObject var itemList: ItemList
    
    var body: some View {
        List {
            ForEach(itemList.items) { task in
                HStack {
                    Text(task.name)
                        .foregroundColor(task.isDone ? .green : .red)
                        .onTapGesture {
                            itemList.toggleCompletion(for: task)
                        }
                    Spacer()
                    Button(action: {
                        if let index = itemList.items.firstIndex(where: { $0.id == task.id }) {
                            itemList.removeItem(at: index)
                        }
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .listStyle(PlainListStyle())
        .cornerRadius(12)
    }
}

