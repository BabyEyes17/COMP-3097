//
//  MultipleSelectionRow.swift
//  lab_07
//
//  Created by Tech on 2026-03-17.
//
import SwiftUI

struct MultipleSelectionRow {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            HStack{
                
                Text(title)
                Spacer()
                
                if isSelected {
                    
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
