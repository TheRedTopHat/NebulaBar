//
//  AppDelegate.swift
//  NebulaBar
//
//  Created by Sam Meester on 2022-09-25.
//

import Foundation
import Cocoa
import SwiftUI

import NebulaXPC


class AppDelegate: NSObject, NSApplicationDelegate {
    
    var popover: NSPopover!;
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView();
        
        // Create popover
        let popover = NSPopover();
        popover.contentSize = NSSize(width: 250, height: 250);
        popover.behavior = .transient;
        popover.contentViewController = NSHostingController(rootView: contentView);
        self.popover = popover;
        
        
        //Create Status Item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength));
        
        if let button = self.statusBarItem.button {
             button.image = NSImage(named: "Icon")
             button.action = #selector(togglePopover(_:))
        }
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
         if let button = self.statusBarItem.button {
              if self.popover.isShown {
                   self.popover.performClose(sender)
              } else {
                   self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
                   self.popover.contentViewController?.view.window?.becomeKey()
              }
         }
    }
    
    @objc func xpcCall() {
        let connectionToService = NSXPCConnection(serviceName: "com.nothingbird.NebulaXPC")
        connectionToService.remoteObjectInterface = NSXPCInterface(with: NebulaXPCProtocol.self)
        connectionToService.resume()
        
        
    }
    
}
