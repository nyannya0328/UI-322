//
//  Home.swift
//  UI-322 (iOS)
//
//  Created by nyannyan0328 on 2021/10/07.
//

import SwiftUI

struct Home: View {
    @State var showColors : Bool = false
    @State var animtedButton : Bool = false
    
    var body: some View {
        HStack(spacing:0){
            
            if isMac(){
                
                Group{
                    
                    SideBar()
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 1)
                    
                }
            }
            
           MainContent()
            
            
            
            
        }
        #if os(macOS)
        .ignoresSafeArea()
        #endif
        .frame(width: isMac() ? getRect().width / 1.7 : nil, height: isMac() ? getRect().height - 180 : nil, alignment: .leading)
        .background(Color("BG").ignoresSafeArea())
        #if os(iOS)
        .overlay(
        
      SideBar()
        
        )
        #endif
        .preferredColorScheme(.light)
    }
    @ViewBuilder
    func MainContent()->some View{
        
        
        VStack(spacing:10){
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                TextField("Search", text: .constant(""))
            }
            
            .frame(maxWidth: .infinity,alignment: .leading)
           
            .padding(.bottom,isMac() ? 0 : 10)
            .overlay(
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 1)
                .padding(.horizontal,-20)
                .offset(y: 6)
                .opacity(isMac() ? 0 : 1)
                
                
                ,alignment: .bottom
            )
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Notes")
                    .font(.largeTitle.weight(.black))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                let columns = Array(repeating: GridItem(.flexible(),spacing: 50), count: isMac() ? 3 : 1)
                
                LazyVGrid(columns: columns, spacing: 30) {
                    
                    
                    ForEach(notes){note in
                        
                        CardView(note: note)
                        
                    }
                    
                    
                }
                .padding()
                
                
                
            }
            .padding(.top,isMac() ? 45 : 30)
           
        }
       
        .padding(.top,isMac() ? 40 : 15)
        .padding(.horizontal,25)
       
        
        
    }
    @ViewBuilder
    func CardView(note : Notes)->some View{
        
        VStack(spacing:30){
            
            
            Text(note.note)
                .font(isMac() ? .title2 : .body)
                .multilineTextAlignment(.leading)
            
            
            HStack{
                
                
                Text(note.date,style: .date)
                    .font(.footnote.bold())
                    .foregroundColor(.black)
                    .opacity(0.8)
                
                
                Spacer(minLength: 0)
                
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "pencil")
                        .font(.system(size: 13, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }

                    
                
            
                
                
            }
            
            
        }
        .padding()
        .background(note.cardColor)
        .cornerRadius(10)
    }
    
    @ViewBuilder
    func AddButton()->some View{
        
        Button {
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6)){
                
                showColors.toggle()
                animtedButton.toggle()
                
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                
                
                withAnimation(.spring()){
                    
                    animtedButton.toggle()
                }
            }
            
        } label: {
            
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .padding(isMac() ? 12 : 15)
                .background(Color.black)
                .clipShape(Circle())
                .scaleEffect(animtedButton ? 1.1 : 1)
                .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 0)
        }
        .rotationEffect(.init(degrees: showColors ? 45 : 0))
        .scaleEffect(animtedButton ? 1.1 : 1)
        .padding(.top,30)

        
    }
    
    @ViewBuilder
    func SideBar()->some View{
        
        VStack(spacing:15){
            
            if isMac(){
                Text("Pocket")
                     .font(.largeTitle.bold())
                     .foregroundColor(.black)
            }
            
            if isMac(){
                
                AddButton()
                    .zIndex(1)
            }
            
            
            VStack(spacing:13){
                
                let colos = [
                
                Color("Skin"),Color("Orange"),Color("Purple"),Color("Blue"),Color("Green"),
                
                ]
                
                ForEach(colos,id:\.self){color in
                    
                    Circle()
                        .fill(color)
                        .frame(width:isMac() ? 20 : 25, height: isMac() ? 20 : 25)
                    
                    
                }
                
                
            }
            .padding(.top,20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
            .zIndex(0)
            
            if !isMac(){
                
                AddButton()
                    .zIndex(1)
            }
            
            
        }
        #if os(macOS)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical,20)
        .padding(.horizontal,20)
        .padding(.top,35)
        #else
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .background(BlurView(style: .systemChromeMaterialDark).opacity(showColors ? 1 : 0).ignoresSafeArea())
        #endif
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
