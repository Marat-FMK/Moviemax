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
//                    predicates: [.whereField("id", isEqualTo: self.currentUserID)]
//    ) var users: [User]
    
    @AppStorage("currentUserID") var currentUserID = ""
    @AppStorage("authComplete") var authComplete = false
    @AppStorage("rememberMe") var rememberMe = true
    
    @AppStorage("firstName") var firstName = ""
    @AppStorage("lastName") var lastName = ""
    @AppStorage("email") var email = ""
    @AppStorage("password") var password = ""
    @AppStorage("birthday") var birthday = ""
    @AppStorage("gender") var gender = ""
    @AppStorage("location") var location = ""
    
    
    @AppStorage("userDocID") var userDocId = ""
    @AppStorage("emailVerified") var emailVerified = false
    
    static let shared = FireBaseDataService()
    
    private init() {
        currentUserID = Auth.auth().getUserID() ?? ""
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
                self.sendEmailVerification()
                
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
                
                self.fetchUsers { fetchedUsers, docID in
                    if let foundUser = fetchedUsers.first(where: { $0.id == self.currentUserID }) {
                        
                        
                        //save to UD AppStotage
                        self.firstName = foundUser.firstName ?? ""
                        self.lastName = foundUser.lastName ?? ""
                        self.email = foundUser.email ?? ""
                        self.password = foundUser.password ?? ""
                        self.birthday = foundUser.dateOfBirth ?? ""
                        self.gender = foundUser.gender ?? ""
                        self.location = foundUser.location ?? ""
                        
                        self.userDocId = docID
                        
                        completion(true)
                        print("✅ CURRENT USER ID -->>>")
                        print(self.currentUserID)
                        print("USER DOC ID -->>>")
                        print(self.userDocId)
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
    func fetchUsers(completion: @escaping ([User], String) -> Void) {
        let db = Firestore.firestore()
        db.collection("users").getDocuments { snapshot, error in
            if let error = error {
                print("Ошибка загрузки: \(error.localizedDescription)")
                completion([], "")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("Документов нет")
                completion([], "")
                return
            }
            
            var fetchedUsers: [User] = []
            var userDocID = ""
            for doc in documents {
                do {
                    let user = try doc.data(as: User.self)
                    fetchedUsers.append(user)
                    if user.id == self.currentUserID {
                        userDocID = String(doc.documentID)
                    }
                    
                } catch {
                    print("❌ Ошибка декодирования:", error)
                }
            }
            
            DispatchQueue.main.async {
//                self.users = fetchedUsers
                completion(fetchedUsers, userDocID)
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
    
    //Обновление данных пользователя
    func uploudUserInfo(name: String, surname: String, emailAdress: String, birthday: String, gend: String, loc: String) async {
        // Add / upload document in collection "users"
        let db = Firestore.firestore()
        
        let newData = [ "firstName" : name,
                        "lastName" : surname,
                        "dateOfBirth" : birthday,
                        "email" : emailAdress,
                        "gender" : gend,
                        "location" : loc,
                        "id" : currentUserID]
        
        do {
            try await db.collection("users").document(userDocId).setData(newData)
            
            self.firstName = name
            self.lastName = surname
            self.email = emailAdress
            self.birthday = birthday
            self.gender = gend
            self.location = loc
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
        }
        
    }
    
    
    func sendEmailVerification() {
//        Auth.auth().languageCode = "ru"
        Auth.auth().currentUser?.sendEmailVerification { error in
            if error != nil {
                print( "❌ send verification error", error?.localizedDescription ?? "")
            }
        }
    }
    
    func checkEmailVerification() {
        emailVerified = Auth.auth().currentUser?.emailVerified() ?? false
            print( "📧 check email verification, verified -->> \(emailVerified)")
    }
    func updateUserEmail(newEmail: String) {
//        Auth.auth().languageCode = "ru" // "RUS" ???
        Auth.auth().currentUser?.sendEmailVerification(beforeUpdatingEmail: newEmail) { error in
            if error != nil {
                print( "❌ update email error", error?.localizedDescription ?? "")
            }
        }
    }
    
    func passwordResetWithEmail(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                print( "❌ passwordResetWithEmail error", error?.localizedDescription ?? "")
            }
        }
    }
    
    func updatePassword(password: String) {
        Auth.auth().currentUser?.updatePassword(to: password) { error in
            if error != nil {
                print( "❌ update password error", error?.localizedDescription ?? "")
            }
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
    

