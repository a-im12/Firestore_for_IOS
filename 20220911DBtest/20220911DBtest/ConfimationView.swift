//
//  ConfimationView.swift
//  20220911DBtest
//
//  Created by いーま on 2022/09/13.
//

import SwiftUI
import Firebase

struct ConfimationView: View {
    let db = Firestore.firestore()
    var body: some View {
        Button(action:{
//            db.collection("parson").getDocuments(){
            db.collection("parson").whereField("name", isEqualTo: "hoge").getDocuments(){ (querySnapshot, error) in
                if let error = error{
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
        }){
            Text("取得データ確認")
        }
    }
}
