//
//  ContentView.swift
//  lab_04_swift_ui
//
//  Created by Jayden Lewis on 2026-02-03.
//

import SwiftUI

struct SecondView:View{
    
    let message:String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        VStack{
            Text(message)
            Button("Back"){
                dismiss()
            }
        }
    }
}

struct ModalView:View{
    
    let callback:(String)->Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        VStack{
            Text("Modal")
            Button("Dismiss"){
                callback("Message from modal")
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    
    @State private var showModal = false
    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                NavigationLink("Go to Second"){
                    SecondView(message: "My Message")
                }
                
                Button("Open Modal"){
                    showModal = true
                    
                }.sheet(isPresented: $showModal) {
                    ModalView() {
                        print($0)
                    }
                }
            }
            .padding()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
