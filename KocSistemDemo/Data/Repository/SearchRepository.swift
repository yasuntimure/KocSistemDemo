//
//  SearchRepository.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//

import Moya

protocol ISearchRepository {
    func getSearch(parameters: SearchRequestParameters,
                   callback: @escaping APIResponseCallBack<SearchResponseModel>)
}


class SearchRepository: BaseRepository<SearchService>, ISearchRepository {

    init(mProvider: MoyaProvider<SearchService>) {
        super.init(provider: mProvider)
    }

    func getSearch(parameters: SearchRequestParameters, callback: @escaping APIResponseCallBack<SearchResponseModel>) {
        self.mRequest(.getSearch(parameters: parameters.generateAPIRequestParameters()), callback: callback)
    }

}

