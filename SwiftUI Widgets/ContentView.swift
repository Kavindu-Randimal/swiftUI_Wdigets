//
//  ContentView.swift
//  SwiftUI Widgets
//
//  Created by Randimal Geeganage on 2021-06-15.
//

import SwiftUI

struct ContentView: View {
    
   @State private var reminder = ""
    
    var body: some View {
        VStack {
            Text("Add reminder here")
            TextField("add Heminder Here", text: $reminder)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Save")
                    .frame(width: 200, height: 30)
                    .background(Color.green)
                    .foregroundColor(.white)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
