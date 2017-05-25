//
//  LoginManager.swift
//  ReactiveFacebook
//
//  Created by Luís Portela on 25/05/2017.
//  Copyright © 2017 ClapWare. All rights reserved.
//

import Foundation

import FacebookCore
import FacebookLogin
import ReactiveSwift

extension LoginManager {
    enum Error: Swift.Error {
        case failed(Swift.Error)
        case cancelled
    }

    typealias SuccessResult = (grantedPermissions: Set<Permission>,
        declinedPermissions: Set<Permission>,
        token: AccessToken)

    func logIn(_ permissions: [FacebookCore.ReadPermission] = [.publicProfile],
               viewController: UIViewController? = nil)
        -> SignalProducer<SuccessResult, Error> {

            return SignalProducer { observer, disposable in
                let loginManager = LoginManager()

                loginManager.logIn(permissions, viewController: viewController) { loginResult in
                    switch loginResult {
                    case let .success(grantedPermissions: grantedPermissions,
                                      declinedPermissions: declinedPermissions,
                                      token: accessToken):
                        observer.send(value: (grantedPermissions, declinedPermissions, accessToken))
                        observer.sendCompleted()
                    case let .failed(error): observer.send(error: .failed(error))
                    case .cancelled: observer.send(error: .cancelled)
                    }
                }
            }
    }
}
