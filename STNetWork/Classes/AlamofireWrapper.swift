//
//  AlamofireWrapper.swift
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

import Alamofire


@objc public protocol AlamofireWrapperDelegate : class {
    func didRecieveData(_ response:STNResponse)
}

public class AlamofireWrapper : NSObject {

    var request:STNRequest?;
    
    var dataRequest:Alamofire.Request?;
    
    required public init(request: STNRequest) {
        super.init()
        self.request = request
    }

    
    public func start() {
        dataRequest = Alamofire.request((self.request?.urlRequest)!).response { (reponse) in
            let stnresponse = STNResponse.init(request: self.request!,
                                               response: reponse.response,
                                               data: reponse.data,
                                               error: reponse.error);
            (self.request as! AlamofireWrapperDelegate).didRecieveData(stnresponse);
            self.request = nil;
        }
    }
    
    
    public func cancel() {
        dataRequest?.cancel()
    }
}
