//
//  ContentView.swift
//  20220911DBtest
//
//  Created by いーま on 2022/09/11.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var name:String = ""
    @State var age:String = ""
    @State private var isShowingAleart:Bool = false
    var saveData:[String:Any] = [:]
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("名前を入力してください", text:$name)
                TextField("年齢を入力してください", text:$age)
                Button(action: {
                    guard let intAge = Int(age) else {
                        isShowingAleart = true
                        return
                    }
                    let saveData:[String:Any] = ["name":name, "age":intAge]
                    Firestore.firestore().collection("parson").document().setData(saveData)
                }){
                    Text("登録")
                }.alert(isPresented: $isShowingAleart){
                    Alert(title: Text("登録失敗"),
                    message: Text("年齢は数字で入力してください"))
                }
            }
            .navigationTitle("登録画面")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: ConfimationView()){
                            Text("確認画面")
                        }
                    }
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
