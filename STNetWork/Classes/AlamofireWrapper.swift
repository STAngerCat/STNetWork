//
//  AlamofireWrapper.swift
//  STNetWork
//
//  Created by Mapleiny on 2017/11/25.
//

import Alamofire
import STNetWork.STNetWorkDefined


@objc public protocol AlamofireWrapperDelegate : class {
    func didRecieveData(_ response:STNResponse)
}

public class AlamofireWrapper : NSObject {
    
    public var delegate:AlamofireWrapperDelegate?
    
    weak var request:STNRequest?;
    
    var dataRequest:Alamofire.Request?;
    
    required public init(request: STNRequest) {
        super.init()
        self.request = request
        self.delegate = (request as! AlamofireWrapperDelegate)
    }

    
    public func start() {
        dataRequest = Alamofire.request((self.request?.urlRequest)!).response { (reponse) in
            self.delegate?.didRecieveData(self.responseConvert(reponse));
        }
    }
    
    
    public func cancel() {
        dataRequest?.cancel()
    }
}



// convert

extension AlamofireWrapper {
    func responseConvert(_ response:DefaultDataResponse) -> STNResponse {
        let customResponse = STNMutableResponse();
        return customResponse.copy() as! STNResponse
    }
}
