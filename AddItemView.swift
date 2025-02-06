import SwiftUI

struct AddItemView: View {
    @ObservedObject var itemList: ItemList
    @State private var newItem: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter new item", text: $newItem)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: {
                if !newItem.isEmpty {
                    itemList.addItem(newItem)
                    newItem = ""
                }
            }) {
                Text("Voeg een taak toe")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}

