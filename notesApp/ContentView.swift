//
//  ContentView.swift
//  notesApp
//
//  Created by Shady Vandenbussche on 23/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("I love GitHub!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
