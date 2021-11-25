//
//  ContentView.swift
//  Shared
//
//  Created by nyannyan0328 on 2021/10/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
            .buttonStyle(PlainButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        #if os(iOS)
        
        return UIScreen.main.bounds
        
        #else
        
        return NSScreen.main!.visibleFrame
        
        #endif
    }
    
    func isMac()->Bool{
        
        #if os(iOS)
        return false
        #endif
        return true
    }
}

#if os(macOS)

extension NSTextField{
    
    
    open override var focusRingType: NSFocusRingType{
        
        get{.none}
        set{}
    }
}
#endif

