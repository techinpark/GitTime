//
//  FollowService.swift
//  GitTime
//
//  Created by Kanz on 04/06/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import RxSwift

protocol FollowServiceType: class {
    func fetchFollowers(userName: String, page: Int) -> Observable<[User]>
    func fetchFollowing(userName: String, page: Int) -> Observable<[User]>
}

class FollowService: FollowServiceType {
    
    fileprivate let networking: GitTimeProvider<GitHubAPI>
    
    init(networking: GitTimeProvider<GitHubAPI>) {
        self.networking = networking
    }
    
    func fetchFollowers(userName: String, page: Int) -> Observable<[User]> {
//        guard let mocks = FollowUser.mockData() else { return .empty() }
//        return Observable.just(mocks)
        return self.networking.rx.request(.followers(userName: userName, page: page))
            .map([User].self)
            .asObservable()
    }
    
    func fetchFollowing(userName: String, page: Int) -> Observable<[User]> {
//        guard let mocks = FollowUser.mockData() else { return .empty() }
//        return Observable.just(mocks)
        return self.networking.rx.request(.following(userName: userName, page: page))
            .map([User].self)
            .asObservable()
    }
}
