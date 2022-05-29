//
//  Box.swift
//  Netflix-Clone
//
//  Created by Joao Matheus on 16/05/22.
//

import Foundation

public class Box<T> {

    private var observer: ((T) -> Void)?

    public var value: T {
        didSet {
            observer?(value)
        }
    }

    public init(_ value: T) {
        self.value = value
    }

    public func bind(_ observer: ((T) -> Void)?) {
        self.observer = observer
        observer?(value)
    }
}
