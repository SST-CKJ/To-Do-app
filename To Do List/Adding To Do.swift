//
//  Adding To Do.swift
//  To Do List
//
//  Created by Kui Jun on 14/8/23.
//

import SwiftUI

struct Adding_To_Do: View {
    @Binding var Name: String
    @Binding var Description: String
    @Binding var Time: Int
    
    @State var Complete: Bool = false
    var body: some View {
        VStack{
            TextField("Name of Task", text: $Name)
                .foregroundColor(.black)
                .font(.system(size: 50))
                .offset(y: -270)
                .offset(x: 30)
            TextField("Input Desciption", text: $Description)
                .foregroundColor(.black)
                .font(.system(size: 30))
                .offset(y:-270)
                .offset(x: 30)
            HStack{
                Text("Estimated Completion Time: \(Time) min")
                    .foregroundColor(.black)
                    .offset(y: -230)
                    .offset(x: -5)
                    .font(.system(size: 20))
                VStack{
                    Button(action:{
                        Time += 1
                    }, label: {
                        Text("+")
                            .font(.system(size: 20))
                            
                    })
                        .offset(y: -230)
                    
                    Button(action:{
                        if (Time >= 1){
                            Time -= 1
                        }
                    }, label: {
                        Text("-")
                            .font(.system(size: 20))
                    })
                        .offset(y: -230)
                }
            }
        }
    }
}

struct Adding_To_Do_Previews: PreviewProvider {
    static var previews: some View {
        Adding_To_Do(Name: .constant(""), Description: .constant(""), Time: .constant(0))
    }
}
