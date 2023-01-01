//
//  Models.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 29/12/2022.
//

import Foundation


public class LoginRequest: Codable {
    let email: String
    let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

public class LoginResponse: Codable {
    let token: String
    let user: User
}

public class User: Codable {
    let _id: String
    let numTel: String
    let fullname: String
    let email: String
}

class ProductWithUser: Codable {
    let product: Product
    let user: User
}

struct Product : Codable {
    let _id: String
    let nom: String
    let marque: String
    let boutique: String
    let promo: Int?
    let prix: Int
    let annee: Int
    let description: String
    let type: String
    let city: String
    let etat: String
    let image: String?
}

struct Products: Codable {
    let Products: [Product]
}

struct DeleteRequest: Codable {
    let _id: String
}

class Brands: Codable {
    let brands: [String]
}

public class RestPassRequest: Codable {
    let newPass: String
    let email: String
    let otp: String
    
    init(newPass: String, email: String, otp: String) {
        self.newPass = newPass
        self.email = email
        self.otp = otp
    }
}

public class ForgotPwRequest: Codable {
    let email: String
    

    public init(email: String) {
        self.email = email
    }
}

public class SingUpRequest: Codable {
    let email: String
    let password: String
    let numTel: String
    let fullname: String

    public init(email: String, password: String, numTel: String, fullname: String) {
        self.email = email
        self.password = password
        self.numTel = numTel
        self.fullname = fullname
    }
}

public class confirmOTPRequest: Codable {
    let otp: String
    let email: String
    
    init(otp: String, email: String) {
        self.otp = otp
        self.email = email
    }
}
