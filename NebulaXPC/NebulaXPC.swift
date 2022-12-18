//
//  NebulaXPC.swift
//  NebulaXPC
//
//  Created by Sam Meester on 2022-11-12.
//

import Foundation

/// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@objc class NebulaXPC: NSObject, NebulaXPCProtocol {
    
    let pmset = Process();
    let pipe = Pipe();
    
    /// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
    
    func runServer(withReply reply: @escaping (NSMutableDictionary) -> Void) {
        let response: NSMutableDictionary = [
            "isRunning": false,
            "data": ""
        ]
        
        pmset.executableURL = URL(fileURLWithPath: "/etc/nebula");
        
        pmset.arguments = ["nebula", "-config", "./config.yml"];
        pmset.standardOutput = pipe;
        
        do {
            try pmset.run();
        } catch {
            reply(response);
        }
        

        let data = pipe.fileHandleForReading.readDataToEndOfFile();
        if let output = String(data: data, encoding: String.Encoding.utf8) {
            response["isRunning"] = pmset.isRunning;
            response["data"] = output.trimmingCharacters(in: .whitespacesAndNewlines);
        }
    }
    
    func isRunning(withReply reply: @escaping (Bool) -> Void) {
        reply(pmset.isRunning);
    }
    
    func stopServer(withReply reply: @escaping (Bool) -> Void) {
        pmset.terminate();
        pmset.waitUntilExit();
        
        reply(false)
    }
}
