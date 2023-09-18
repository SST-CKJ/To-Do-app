//
//  Others.swift
//  To Do List
//
//  Created by Kui Jun on 22/8/23.
//

import SwiftUI

struct Others: View {
    
    @Binding var Category: String
    @Binding var othersSheet: Bool
    @State var newCategory = ""
    
    var body: some View {
        VStack{
            TextField("Input New Category", text: $newCategory)
                .font(.system(size: 35))
                .offset(x: 53)
            Button(action:{
                if(newCategory != ""){
                    Category = newCategory
                    othersSheet = false
                }
            }, label:{
                Text("Create")
                    .font(.system(size: 30))
            })
        }
    }
}

struct Others_Previews: PreviewProvider {
    static var previews: some View {
        Others(Category: .constant(""), othersSheet: .constant(true))
    }
}
