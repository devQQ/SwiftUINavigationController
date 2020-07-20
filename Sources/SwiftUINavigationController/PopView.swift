//
//  PopView.swift
//  
//
//  Created by Q Trang on 7/20/20.
//

import SwiftUI

public enum PopDestination {
    case previous
    case root
    case view(id: String)
}

public struct PopView<Label: View>: View {
    @EnvironmentObject private var navStack: NavigationStack
    
    let destination: PopDestination
    let label: () -> Label
    
    public init(destination: PopDestination, label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        label()
            .onTapGesture(perform: {
                switch self.destination {
                case .root:
                    self.navStack.popToRoot()
                case .view(let id):
                    _ = self.navStack.popToView(withId: id)
                default:
                    _ = self.navStack.pop()
                }
            })
    }
}

