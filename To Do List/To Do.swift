//
//  To Do.swift
//  To Do List
//
//  Created by Kui Jun on 15/8/23.
//

import SwiftUI

struct To_Do: View {
    
    @Binding var Name: String
    @Binding var Description: String
    @Binding var Time: Int
    @Binding var Important: Bool
    @Binding var Category: String
    @State var othersSheet = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Name of Task", text: $Name)
                    .foregroundColor(.black)
                    .font(.system(size: 50))
                    .offset(x: 30)
                
                TextField("Input Desciption(optional)", text: $Description)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .offset(x: 30)
                
                Stepper(value: $Time, in: 1...9999){
                    Text("Estimated Completion Time: \(Time)min")
                        .font(.system(size: 20))
                }
                .padding(.horizontal, 30)
                
                .sheet(isPresented: $othersSheet){
                    Others(Category: $Category, othersSheet: $othersSheet)
                }
                Toggle(isOn: $Important){
                    Text("Important?")
                        .font(.system(size: 20))
                }
                .padding(.horizontal, 33)
                
                Menu{
                    Button(action:{
                        Category = "Homework✏️"
                    }, label: {
                        Text("Homework✏️")
                    })
                    Button(action:{
                        Category = "Revision📚"
                    }, label:{
                        Text("Revision📚")
                    })
                    Button(action:{
                        Category = "Exercise💪"
                    }, label:{
                        Text("Exercise💪")
                    })
                    Divider()
                    Button(action:{
                        othersSheet.toggle()
                    }, label:{
                        Text("Others")
                    })
                } label: {
                    if(Category == ""){
                        Text("Choose Category")
                            .font(.system(size: 20))
                    }
                    else{
                        Text("\(Category)")
                            .font(.system(size: 20))
                    }
                }
            }
        }
    }
}


struct To_Do_Previews: PreviewProvider {
    static var previews: some View {
        To_Do(Name: .constant(""), Description: .constant(""), Time: .constant(0), Important: .constant(false), Category: .constant(""))
    }
}
