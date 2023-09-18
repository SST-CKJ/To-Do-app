//
//  ContentView.swift
//  To Do List
//
//  Created by Kui Jun on 14/8/23.
//

import SwiftUI
import SwiftPersistence

struct ToDo: Identifiable, Codable {
    var id = UUID()
    var Name: String
    var Description: String
    var Time: Int
    var Important: Bool
    var Category: String
}

struct ContentView: View {
    
    @Persistent("list") var list :[ToDo] = []
    @State var addingSheet:Bool = false
    @State var arrange = false
    
    var body: some View {
        NavigationStack{
            Toggle(isOn: $arrange){
                Text("Arrange by Importance")
                    .font(.system(size: 20))
            }
                .padding(.horizontal, 40)
                .offset(x: -17)
            
            Text("Press and hold to deleate/complete To Do")
                .font(.system(size: 20))
            
            List{
                if(arrange){
                    //important
                    ForEach($list, id: \.id){ $ToDo in
                        if(ToDo.Important){
                            NavigationLink{
                                To_Do(Name: $ToDo.Name, Description: $ToDo.Description, Time: $ToDo.Time, Important: $ToDo.Important, Category: $ToDo.Category)
                            } label: {
                                VStack{
                                    HStack{
                                        Text("\(ToDo.Name)")
                                            .font(.system(size: 30))
                                        Text("\(ToDo.Time)min")
                                            .font(.system(size: 20))
                                            .padding(.horizontal, 0)
                                        if(ToDo.Important){
                                            Text("!!")
                                                .foregroundColor(.red)
                                                .font(.system(size: 30))
                                        }
                                    }
                                    Text("\(ToDo.Category)")
                                        .font(.system(size: 20))
                                }
                            }
                                .contextMenu{
                                    Button("Complete"){
                                        removeToDoAt(id: ToDo.id)
                                    }
                                }
                        }
                    }
                    //not important
                    ForEach($list, id: \.id){ $ToDo in
                        if(ToDo.Important == false){
                            NavigationLink{
                                To_Do(Name: $ToDo.Name, Description: $ToDo.Description, Time: $ToDo.Time, Important: $ToDo.Important, Category: $ToDo.Category)
                            } label: {
                                VStack{
                                    HStack{
                                        Text("\(ToDo.Name)")
                                            .font(.system(size: 30))
                                        Text("\(ToDo.Time)min")
                                            .font(.system(size: 20))
                                            .padding(.horizontal, 0)
                                        if(ToDo.Important){
                                            Text("!!")
                                                .foregroundColor(.red)
                                                .font(.system(size: 30))
                                        }
                                    }
                                    Text("\(ToDo.Category)")
                                        .font(.system(size: 20))
                                }
                            }
                                .contextMenu{
                                    Button("Complete"){
                                        removeToDoAt(id: ToDo.id)
                                    }
                                }
                        }
                    }
                }
                else{
                    ForEach($list, id: \.id){ $ToDo in
                        NavigationLink{
                            To_Do(Name: $ToDo.Name, Description: $ToDo.Description, Time: $ToDo.Time, Important: $ToDo.Important, Category: $ToDo.Category)
                        } label: {
                            VStack{
                                HStack{
                                    Text("\(ToDo.Name)")
                                        .font(.system(size: 30))
                                    Text("\(ToDo.Time)min")
                                        .font(.system(size: 20))
                                        .padding(.horizontal, 0)
                                    if(ToDo.Important){
                                        Text("!!")
                                            .foregroundColor(.red)
                                            .font(.system(size: 30))
                                    }
                                }
                                Text("\(ToDo.Category)")
                                    .font(.system(size: 20))
                            }
                        }
                            .contextMenu{
                                Button("Complete"){
                                    removeToDoAt(id: ToDo.id)
                                }
                            }
                    }
                }
            }
            .sheet(isPresented: $addingSheet) {
                To_Do(Name: $list.last?.Name ?? .constant(""), Description: $list.last?.Description ?? .constant(""), Time: $list.last?.Time ?? .constant(1), Important: $list.last?.Important ?? .constant(false), Category: $list.last?.Category ?? .constant(""))
            }
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing) {
                    Button (action: {
                        list.append(
                            ToDo(Name: "", Description: "", Time: 1, Important: false, Category: "")
                        )
                        addingSheet = true
                    }, label: {
                        Text("+")
                            .foregroundColor(.cyan)
                            .font(.system(size: 50))
                    })

                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    func removeToDoAt(id: UUID){
        if let index = list.firstIndex(where: {$0.id == id}){
            list.remove(at: index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
