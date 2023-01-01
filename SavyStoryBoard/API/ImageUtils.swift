//
//  ImageUtils.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 29/12/2022.
//

import Foundation
import Alamofire

class ImageUtils {
    static func getImage(imageURL: String?, completion: @escaping (Result<Data, AFError>) -> Void) {
        if (imageURL ?? "") != "" {
            AF.request("\(Constants.BASE_URL)images/\(imageURL ?? "")").responseData { (response) in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(AFError.explicitlyCancelled))
        }
    }
}
