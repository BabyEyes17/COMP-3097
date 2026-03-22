//
//  ContentView.swift
//  lab_06_swift_ui
//
//  Created by Jayden Lewis on 10/03/2026
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PhotoViewModel()
    
    var body: some View {
        
        
        NavigationView {
            
            List(viewModel.photos) { photo in
                
                HStack {
                    
                    AsyncImage(url: URL(string: photo.thumbnailUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)

                    Text(photo.title)
                        .font(.caption)
                }
            }
            
            .navigationTitle("Photos")
            .onAppear {
                viewModel.loadPhotos()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
