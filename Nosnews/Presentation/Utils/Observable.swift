//
//  Observable.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 25/03/20.
//  Copyright (c) 2020 Ayo Development. All rights reserved.

import Foundation

public final class Observable<Value> {
    
    struct Observer<Value> {
        weak var observer: AnyObject?
        let block: (Value) -> Void
    }
    
    private var observers = [Observer<Value>]()
    
    public var value: Value {
        didSet { self.notifyObservers() }
    }
    
    public init(_ value: Value) {
        self.value = value
    }
    
    public func observe(on observer: AnyObject, observerBlock: @escaping (Value) -> Void) {
        self.observers.append(Observer(observer: observer, block: observerBlock))
        DispatchQueue.main.async { observerBlock(self.value) }
    }
    
    public func remove(observer: AnyObject) {
        self.observers = self.observers.filter { $0.observer !== observer }
    }
    
    private func notifyObservers() {
        for observer in self.observers {
            DispatchQueue.main.async { observer.block(self.value) }
        }
    }
}
