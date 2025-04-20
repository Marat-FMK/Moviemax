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
import SwiftUI

class FireBaseDataService: ObservableObject {
//    @FirestoreQuery(collectionPath: "users",
//                    predicates: [.whereField("id", isEqualTo: currentUserID)]
//    ) var users: [User]
    
    
    @AppStorage("currentUserID") var currentUserID = ""
    @AppStorage("authComplete") var authComplete = false
    
    @AppStorage("firstName") var firstName = ""
    @AppStorage("lastName") var lastName = ""
    @AppStorage("email") var email = ""
    @AppStorage("password") var password = ""
    @AppStorage("birthday") var birthday = ""
    @AppStorage("gender") var gender = ""
    @AppStorage("location") var location = ""
    
    static let shared = FireBaseDataService()
    
    private init() {
    }
    
    //Регистрация
    func signUP(email: String, password: String,firstName: String, lastName: String, completion: @escaping (Bool)-> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if result != nil {
                completion(true)
                print("firebase new user registration - TRUE")
                
                //save profile info
                let db = Firestore.firestore()
                let newUser = User(id: result?.user.uid, firstName: firstName, lastName: lastName, password: password, email: email, dateOfBirth: "", gender: "", location: "")
                let _ = db.collection("users").addDocument(from: newUser)
                
                self.currentUserID = result?.user.uid ?? ""
                
                // firebase verification with email
                
            } else {
                completion(false)
                print("firebase new user registration - FALSE")
            }
        }
    }
    
    //Вход
    func signIn(email: String, password: String, completion: @escaping(Bool)->Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if result != nil {
                self.authComplete = true
                self.currentUserID = result?.user.uid ?? ""
                
                self.fetchUsers { fetchedUsers in
                    if let foundUser = fetchedUsers.first(where: { $0.id == self.currentUserID }) {
                        
                        
                        //save to UD AppStotage
                        self.firstName = foundUser.firstName ?? ""
                        self.lastName = foundUser.lastName ?? ""
                        self.email = foundUser.email ?? ""
                        self.password = foundUser.password ?? ""
                        self.birthday = foundUser.dateOfBirth ?? ""
                        self.gender = foundUser.gender ?? ""
                        self.location = foundUser.location ?? ""
                        
                        completion(true)
                        print("✅ CURRENT USER INFO -->>>")
                        print(self.currentUserID)
                        print("auth COMPLETE")
                    } else {
                        print("❌ Пользователь не найден в списке")
                    }
                }
            } else {
                print("❌ auth ERROR")
                completion(false)
            }
        }
    }
    
    //Загрузка данных пользователя
    func fetchUsers(completion: @escaping ([User]) -> Void) {
        let db = Firestore.firestore()
        db.collection("users").getDocuments { snapshot, error in
            if let error = error {
                print("Ошибка загрузки: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("Документов нет")
                completion([])
                return
            }
            
            var fetchedUsers: [User] = []
            
            for doc in documents {
                do {
                    let user = try doc.data(as: User.self)
                    fetchedUsers.append(user)
                } catch {
                    print("❌ Ошибка декодирования:", error)
                }
            }
            
            DispatchQueue.main.async {
//                self.users = fetchedUsers
                completion(fetchedUsers)
            }
        }
    }
    
    //Выход пользователя
    func signOut() {
        do {
            try Auth.auth().signOut()
            authComplete = false
        } catch {
            print("error - signOut")
        }
        
    }
}
    



















//    func fetchUsers() {
//        let db = Firestore.firestore()
//        db.collection("users").getDocuments { snapshot, error in
//            if let error = error {
//                print("Ошибка загрузки: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let documents = snapshot?.documents else {
//                print("Документов нет")
//                return
//            }
//            
//            var fetchedUsers: [User] = []
//            
//            for doc in documents {
//                do {
//                    let user = try doc.data(as: User.self)
//                    fetchedUsers.append(user)
//                } catch {
//                    print("❌ Ошибка декодирования:", error)
//                }
//            }
//            
//            // Обновляем массив пользователей на главном потоке
//            DispatchQueue.main.async {
//                self.users = fetchedUsers
//                print(fetchedUsers)
//                print(self.users)
//                print("✅ Загружено пользователей: \(self.users.count)")
//            }
//        }
//        print( "Users->>>> " , users)
//    }

//    func fetchUsers() {
//
//        let db = Firestore.firestore()
//        db.collection("users").getDocuments { snapshot, error in
//            if let error = error {
//                print("Ошибка загрузки: \(error.localizedDescription)")
//                return
//            }
//
//            guard let documents = snapshot?.documents else {
//                print("Документов нет")
//                return
//            }
//
//            for doc in documents {
//
//                do {
//                    let user = try doc.data(as: User.self)
//
////                    print("✅ Успешно декодирован:", user)
//
//                } catch {
////                    print("❌ Ошибка декодирования:", error)
//                }
//            }
//        }
//    }


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
    

