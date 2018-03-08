//
//  NetworkingManager.swift
//  caseSwift
//
//  Created by Cihangir Sungur on 3/6/18.
//  Copyright © 2018 Cihangir Sungur. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    
    // MARK: - Properties
//    let m, n: Double
    let m2 = 1_000.0, n2 = 0.0
    let http404Error = (statusCode: 404, statusMessage: "Not Found")
//    var red, green, blue: Double
    var red2 = 0.0, green2 = 0.0, blue2 = 0.0
    var someValue : Int? = 404

    enum API
    {
        static let baseURL = URL(string: "http://demo4476802.mockable.io/")!
    }
    
    private static var sharedNetworkManager: NetworkManager = {

        let networkManager = NetworkManager(baseURL: API.baseURL)
        
        // Configuration
        // ...
        // MARK: - Adding headers to all requests in the session
        // get the default headers
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        // add your custom header
        headers["Content-Type"] = "application/json"
        
        // create a custom session configuration
        let configuration = URLSessionConfiguration.default
        // add the headers
        configuration.httpAdditionalHeaders = headers
        
        // create a session manager with the configuration
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        return networkManager
    }()
    
    // MARK: -
    
    let baseURL: URL
    
    // Initialization
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    // MARK: - Accessors
    
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }

    func f1(param1 : String) -> Int {
        return 1;
    }
    
    func hello() -> Void
    {
        baseRequest(url: "http://demo4476802.mockable.io/")
    }
    
    func baseRequest(url: URLConvertible) -> Void
    {
        Alamofire.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil).validate().responseJSON { response in
                          
                            switch response.result
                            {
                                case .success:
                                    if let unwrappedValue = response.result.value
                                    {
                                        debugPrint("unwrappedValue: \(unwrappedValue)")
                                    }
                                    else
                                    {
                                        debugPrint(response)
                                    }
                                case .failure:
                                    print("hehehe")
                            }
        }
    }
}
