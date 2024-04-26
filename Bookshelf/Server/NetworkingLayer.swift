//
//  NetworkingLayer.swift
//  Bookshelf
//
//  Created by Hoshimov Matin on 27/03/24.
//

import Foundation
import Alamofire

class NetworkingLayer{
    
    //MARK: -> Объявили синглтон
    static let shared = NetworkingLayer()
    
    private let baseURL = "https://apibookshelf.alif.tj/"
    
    enum EndPoint {
        case login
        case register
        case forgotPassword
        
        var path: String {
            switch self {
            case .login:
                return "login"
            case .register:
                return ""
            case .forgotPassword:
                return ""
            }
        }
    }
    
    private init() {}
    
    func request(path: String, method: HTTPMethod, parameters: [String: Any]? = nil, completion: @escaping (Swift.Result<Data, GenericError>) -> Void){
        let url = baseURL + path
        
        AF.request(url, method: method, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(GenericResponseModel.self, from: data)
                    let successCode = [200, 201, 202, 203]
                    if successCode.contains(model.StatusCode ?? 0){
                        completion(.success(data))
                    }else {
                        completion(.failure(GenericError(error: model.error, StatusCode: model.StatusCode)))
                    }
                } catch {
                    completion(.failure(GenericError(error: "Faild to parse data", StatusCode: 501)))
                }
            case .failure(let error):
                completion(.failure(GenericError(error: error.localizedDescription, StatusCode: 501)))
            }
        }
    }
}
