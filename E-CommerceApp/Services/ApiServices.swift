//
//  ApiServices.swift
//  E-CommerceApp
//
//  Created by Mohamed on 04/10/2021.
//

import Foundation
import UIKit
class ApiServices{
    
    //Sengleton
    static let instance = ApiServices()
    
    // MARK: - GENIRIC FUNC TO DOWNLOAD IMAGE FROM URL USING URL SESSION (NATIVE)
    func downloadImage(from urlString: String, imageView: UIImageView) {
        let url = URL(string: urlString)!
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print(data)
            DispatchQueue.main.async() {
                guard let image = UIImage(data: data) else{
                    return
                }
                imageView.image = image
            }
        }
    }
    fileprivate func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    // MARK: - notiong ---> response model
    func getModel <T: Codable>(urlString: String, completion:@escaping (T?, Error?)-> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,error == nil else {
                // check for fundamental networking error
                return
            }
            // MARK:- HANDLE RESPONSE
            do {
                let returnModel = try JSONDecoder().decode(T.self, from: data)
                completion(returnModel, nil)
            } catch {
                print(error)
                completion(nil, error)
            }
            guard (200 ... 299) ~= response.statusCode else {
                // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                return
            }
            
        }
        task.resume()
    }
    
    
    //MARK: - send string ------> response model
    func postStringsGetModel <T: Codable> (urlString: String, param1: String, param1Key: String, completion: @escaping(T?, Error?)->Void ){
        
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let param = [param1Key: param1] as [String: Any]
        request.httpBody = param.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data , let response = response as? HTTPURLResponse, error == nil else{
                // check for fundamental networking error
                return
            }
            
            // MARK:- HANDLE RESPONSE
            do{
                let returnModel = try JSONDecoder().decode(T.self, from: data)
                completion(returnModel, nil)
            }
            catch{
                print(error.localizedDescription)
                completion(nil, error)
            }
            guard (200...299) ~= response.statusCode else{
                print("status code should be 2xx, but is\(response.statusCode)")
                return
            }
        }
        task.resume()
        
    }
    
    // MARK: - send 2 string ---> response model
    func postTwoStringsGetModel <T: Codable>(urlString: String, param1: String, param1Key: String,param2: String, param2Key: String, completion:@escaping (T?, Error?)-> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let param =
            [param1Key: param1, param2Key: param2] as [String : Any]
        
        request.httpBody = param.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,error == nil else {
                // check for fundamental networking error
                return
            }
            // MARK:- HANDLE RESPONSE
            do {
                let returnModel = try JSONDecoder().decode(T.self, from: data)
                completion(returnModel, nil)
            } catch {
                print(error)
                completion(nil, error)
            }
            guard (200 ... 299) ~= response.statusCode else {
                // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                return
            }
            
        }
        task.resume()
    }
    
    
    
    //MARK: - Send Model ----> Response Model
    func postJsonModelGetModel<T: Codable>(urlString: String, list: T, completion: @escaping(T?, Error?) -> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let model = list
        let jsonEncoder = JSONEncoder()
        let json: String
        
        do{
            let jsonData = try! jsonEncoder.encode(model)
            json = String(data: jsonData, encoding: .utf8)!
        }
        request.httpBody = json.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else{
                return
            }
            
            //MARK: - Handel Response
            do{
                let returnModel = try JSONDecoder().decode(T.self, from: data)
                completion(returnModel, nil)
            }
            catch{
                completion(nil, error)
            }
            guard (200...299) ~= response.statusCode else{
                print("Status code should be 2xx, but is \(response.statusCode) ")
                return
            }
        }
        task.resume()
    }
    
}


// MARK: - these Extensions FOR send post with multiparameters

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
