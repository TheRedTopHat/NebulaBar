//
//  NebulaMonitor.swift
//  NebulaBar
//
//  Created by Sam Meester on 2022-10-07.
//

import Foundation
import SwiftUI
import NebulaXPC


class NebulaMonitor {
    class func runServer(withReply reply: @escaping (NSMutableDictionary) -> void) {
        let connection = NSXPCConnection(serviceName: "com.nothingbird.NebulaXPC");
        connection.exportedInterface = NSXPCInterface(with: NebulaXPCProtocol.self)
    }
}
