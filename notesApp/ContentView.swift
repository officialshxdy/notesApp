
import SwiftUI




struct Task: Identifiable {
    let id = UUID()
    var name: String
    var isDone: Bool
}

class ItemList: ObservableObject {
    @Published var items: [Task] = []
    
    func addItem(_ item: String) {
        items.append(Task(name: item, isDone: false))
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func toggleCompletion(for task: Task) {
        if let index = items.firstIndex(where: { $0.id == task.id }) {
            items[index].isDone.toggle()
        }
    }
}

struct ContentView: View {
    @ObservedObject var itemList = ItemList()
    
    var body: some View {
        VStack {
            AddItemView(itemList: itemList)
            ItemListView(itemList: itemList)
        }.padding(10)
    }
}

#Preview {
    ContentView()
}

