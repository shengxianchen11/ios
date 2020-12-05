//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Admin on 11/30/20.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ChallengeView().environmentObject(ChallengeMode())
        }
    }
}
