//
//  NetworkConstants.swift
//  KocSistemDemo
//
//  Created by Eyüp on 14.04.2022.
//
// https://itunes.apple.com/search?term=jack+johnson

struct NetworkConstants {

    static let shared = NetworkConstants()

    private init() { }

    let baseUrl = "https://itunes.apple.com"

}


