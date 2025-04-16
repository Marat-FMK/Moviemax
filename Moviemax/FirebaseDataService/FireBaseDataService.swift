//
//  FireBaseAuth.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 05.04.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase
import FirebaseFirestoreCombineSwift


class FireBaseDataService: ObservableObject {
    
    @FirestoreQuery(collectionPath: "users") var users: [User]
    
    @Published var currentUserID = ""
    @Published var authComplete = false
    
    
    
    
    
    func signUP(email: String, password: String,firstName: String, lastName: String, completion: @escaping (Bool)-> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if result != nil {
                completion(true)
                print("firebase new user registration - TRUE")
                
                //save profile info
                let db = Firestore.firestore()
                let newUser = User(id: result?.user.uid ?? "", firstName: firstName, lastName: lastName, password: password, email: email, dateOfBirth: "", gender: "", location: "")
                let _ = db.collection("users").addDocument(from: newUser)
                
                self.currentUserID = result?.user.uid ?? ""
                authComplete = true
                
                // firebase verification with email
                
            } else {
                completion(false)
                print("firebase new user registration - FALSE")
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result,error  in
            if result != nil {
                self.authComplete = true
                print("auth COMPLETE")
            } else {
                print("auth ERROR")
            }
        }
    }
   
        func fetchUsers() {
            let db = Firestore.firestore()
            db.collection("users").getDocuments { snapshot, error in
                if let error = error {
                    print("Ошибка загрузки: \(error.localizedDescription)")
                    return
                }

                guard let documents = snapshot?.documents else {
                    print("Документов нет")
                    return
                }

                for doc in documents {
                    do {
                        let user = try doc.data(as: User.self)
                        print("✅ Успешно декодирован:", user)
                    } catch {
                        print("❌ Ошибка декодирования:", error)
                    }
                }
            }
        }
}








// /// //
///
///
//    func fetchUsersInfo() async {
//        
//        let db = Firestore.firestore()
//        
//        do {
//          let snapshot = try await db.collection("users").getDocuments()
//          
//            for document in snapshot.documents {
//              self.usersInfo = document.data()
//              
//            print("\(document.documentID) => \(document.data())")
//                
//                
//                
////                for document in document.data(){
////                    var user: User
////                    for key in document.key{
////                        switch key {
////                        case "name": user.name = ke
////                        case "surname":
////                        case "id":
////                        case "birthday":
////                        case "password":
////                        case "email":
////                        case "password":
////                        }
////                    }
////                }
//              
////              print(usersInfo)
//          }
//        } catch {
//          print("Error getting documents: \(error)")
//        }
//        
//    }
    
//
//    func fetchUsersInfo() {
//        
//       let db = Firestore.firestore()
//       let ref = db.collection("users")
//        
//        ref.addSnapshotListener( {( querySnapshot, error ) in
//            
//            guard let documents = querySnapshot?.documents else {
//                print("No documents found")
//                return
//            }
//            
//         
//            self.usersInfo = documents.compactMap {
//                queryDocumentSnapshot -> NewUser? in
//                
//                return try? queryDocumentSnapshot.data(as: NewUser.self)
//            }
//        })
//        
//        print("users : ///")
//        print(usersInfo)
//    }
    

