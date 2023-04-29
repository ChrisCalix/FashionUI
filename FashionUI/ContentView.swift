//
//  ContentView.swift
//  FashionUI
//
//  Created by Sonic on 28/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                ZStack {
                    Text("Seasons")
                        .font(.title)
                    
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .aspectRatio(contentMode: .fit)
                                .tint(.black)
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .aspectRatio(contentMode: .fit)
                                .tint(.black)
                            
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bell.fill")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .aspectRatio(contentMode: .fit)
                                .tint(.black)
                            
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bag.fill")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .aspectRatio(contentMode: .fit)
                                .tint(.black)
                            
                        }
                    }
                    
                }
                .padding(.horizontal, 15)
                .background(Color.white)
                
                MainView()
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    
    @State var selected = "Dress"
    var body: some View {
        
        VStack(spacing: 15) {
            HStack {
                Button {
                    
                } label: {
                    HStack {
                        Text("Casual Dress")
                        Spacer()
                        Image(systemName: "chevron.down")
                            .renderingMode(.template)
                            .tint(.black)
                        
                    }
                    .padding()
                }
                .foregroundColor(.black)
                .background(Color.white)
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "slider.vertical.3")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .tint(.black)
                        .background(Color.white)
                        .padding()
                }
                .background(Color.white)
            }
            
            HStack {
                ForEach(types, id: \.self) { type in
                    HStack {
                        Button {
                            self.selected = type
                        } label: {
                            Text(type)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                
                        }
                        .foregroundColor(self.selected == type ? .white : .black)
                        .background(self.selected == type ? .black : .clear)
                        .cornerRadius(10)
                        
                        Spacer(minLength: 0)
                    }
                }
            }
            
            DetailsScroll()
        }
        .padding()
        .background(Color("Color"))
        .animation(.spring(), value: 10)
    }
}

struct DetailsScroll: View {
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12) {
                ForEach(mockList) { list in
                    HStack {
                        ForEach(list.rows) { row in
                            Cards(row: row)
                        }
                    }
                    
                }
            }
        }
    }
}

struct Cards: View {
    
    var row: Row
    @State var show: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            
            Image(row.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width/2 - 25, height: 240)
                .onTapGesture {
                    show = true
                }
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(row.name)
                        .lineLimit(1)
                    Text(row.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .tint(.black)
                }
                .padding(.trailing, 15)
            }
        }
        
        .navigationDestination(isPresented: $show) {
            DetailView(show: $show, row: row)
        }
    }
}

struct DetailView: View {
    
    @Binding var show: Bool
    let row: Row
    @State var size = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 15) {
                Button {
                    self.show = false
                } label: {
                    Image(systemName: "chevron.left")
                        .renderingMode(.template)
                        .tint(.black)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .tint(.black)
                    
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bag.fill")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .tint(.black)
                    
                }
            }
            .padding()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        Image(row.image)
            .resizable()
        
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(row.name)
                        .font(.largeTitle)
                    Text(row.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 10) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(Color.red)
                        .frame(width: 20, height: 20)
                }
            }
            
            
            Text(row.description)
                .font(.body)
            Text("Select Size")
                .font(.title3)
            HStack {
                ForEach(sizes, id: \.self) { size in
                    Button {
                        self.size = size
                    } label: {
                        Text(size)
                            .padding()
                            .border(Color.black, width: self.size == size ? 1.5 : 0)
                    }
                    .foregroundColor(.black)
                    
                }
            }
            HStack {
                Button {
                    
                } label: {
                    Text("Add To Cart")
                        .padding()
                        .foregroundColor(.black)
                        .border(Color.black, width: 1.4)
                }

                Spacer()
                
                Button {
                    
                } label: {
                    Text("Buy Now")
                        .padding()
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(15)
            }
            .padding([.leading, .trailing, .top], 15)
        }
        .padding()
        .background(Rounded().fill(Color.white))
        .padding(.top, -50)
    }
}

struct Rounded: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct `Type`: Identifiable {
    
    var id: Int
    var rows: [Row]
}

struct Row: Identifiable {
    
    var id: Int
    var name: String
    var price: String
    var image: String
    var description: String
}

// Sample data mock response

var sizes = ["S", "M", "X", "XL"]
var types = ["Dress", "Pants", "Blazers", "Jackers"]
var mockList = [
    `Type`(id: 0, rows: [Row(id: 0, name: "Fit and Flare", price: "$299", image: "img1", description: "Fitted top made from a plyamide blend. Features wide straps and chest reinforcement"), Row(id: 1, name: "Flexi Dress", price: "$160", image: "img2", description: "Fitted top made from a plyamide blend. Features wide straps and chest reinforcement")]),
    `Type`(id: 1, rows: [Row(id: 9, name: "Summer Vibes", price: "$160", image: "img3", description: "Fitted top made from a plyamide blend. Features wide straps and chest reinforcement"), Row(id: 1, name: "Flora Fun", price: "$200", image: "img4", description: "Fitted top made from a plyamide blend. Features wide straps and chest reinforcement")])
]
