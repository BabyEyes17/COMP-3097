//  Created by Jayden Lewis on 17/02/2026.

import SwiftUI



struct EmojiDefinition:Identifiable{
    
    let id = UUID()
    let emoji:String
    let meaning:String
    
}



struct ContentView: View {
    
    let items: [EmojiDefinition] = [
    
        EmojiDefinition(emoji: "rofl", meaning: "face with tears of joy"),
        EmojiDefinition(emoji: "sad_face", meaning: "face with frown"),
        EmojiDefinition(emoji: "thumbs_up", meaning: "hand doing a thumbs up action"),
    ]
    
    var body: some View {
        
        NavigationStack{
            
            List(items){
                
                item in
                NavigationLink(destination: {DetailsView(item: item)}){
            
                    Text(item.emoji)
                }
            }
        }
    }
}



struct DetailsView:View{
    let item:EmojiDefinition
    
    var body: some View{
        
        VStack{
            
            Text(item.emoji)
            Text(item.meaning)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
