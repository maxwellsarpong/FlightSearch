import SwiftUI

struct SearchDetailView: View {
    var body: some View {
        
        ScrollView{
            VStack {
                
                HStack {
                    
                    //start of first column
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Origin")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray.opacity(0.7))
                        
                        Text("San Francisco")
                            .padding(.bottom, 12)
                            .bold()
                        
                        Text("12 Sep - 15 Sep")
                            .foregroundStyle(Color.gray.opacity(0.7))
                    }
                    .padding()
                    //end of first column
                    
                    Spacer()
                    
                    //start of second column
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Destination")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray.opacity(0.7))
                        
                        Text("JFK, New York")
                            .padding(.bottom, 12)
                            .bold()
                        
                        Text("1 Adult, Economy")
                            .foregroundStyle(Color.gray.opacity(0.7))
                    }
                    .padding()
                    //end of second column
                }
                .padding(.bottom, 20)
                
                //search count text
                HStack{
                    Text("21 Search Results")
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Image(systemName: "line.horizontal.3.decrease")
                        .padding()
                        .bold()
                        .font(.title2)
                }
                //end search count text
                
                //start of first card
                VStack{
                    
                    //start of first row
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text("04:55")
                                .bold()
                                .font(.title3)
                                .foregroundStyle(Color.black.opacity(0.8))
                            
                            Text("SFO")
                                .foregroundStyle(Color.gray.opacity(0.5))
                                .font(.subheadline)
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 5){
                            Text("4h 25")
                                .font(.subheadline)
                                .foregroundStyle(Color.gray.opacity(0.5))
                            
                            HStack {
                                Text("...........")
                                    .foregroundStyle(Color.gray.opacity(0.5))
                                    .font(.subheadline)
                                
                                Circle()
                                    .fill(Color(red: 0.54, green: 0.37, blue: 0.89))
                                    .frame(width: 10, height: 10)
                                Text("...........")
                                    .foregroundStyle(Color.gray.opacity(0.5))
                                    .font(.subheadline)

                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("09:10")
                                .bold()
                                .font(.title3)
                                .foregroundStyle(Color.black.opacity(0.8))

                            
                            Text("JFK")
                                .foregroundStyle(Color.gray.opacity(0.5))
                                .font(.subheadline)
                        }
                        .padding()
                    }
                    //end of first row
                    
                    
                    //start of second row
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text("21:45")
                                .bold()
                                .font(.title3)
                                .foregroundStyle(Color.black.opacity(0.8))

                            Text("JFK")
                                .foregroundStyle(Color.gray.opacity(0.5))
                                .font(.subheadline)
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 5){
                            Text("5h 25")
                                .font(.subheadline)
                                .foregroundStyle(Color.gray.opacity(0.5))
                            
                            HStack {
                                Text("...........")
                                    .foregroundStyle(Color.gray.opacity(0.5))
                                    .font(.subheadline)
                                
                                Circle()
                                    .fill(Color(red: 0.54, green: 0.37, blue: 0.89))
                                    .frame(width: 10, height: 10)
                                Text("...........")
                                    .foregroundStyle(Color.gray.opacity(0.5))
                                    .font(.subheadline)

                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("02:30")
                                .bold()
                                .font(.title3)
                                .foregroundStyle(Color.black.opacity(0.8))

                            
                            Text("SFO")
                                .foregroundStyle(Color.gray.opacity(0.5))
                                .font(.subheadline)
                        }
                        .padding()
                        
                    }
                    //end of second row
                    
                    HStack {
                        Image("jet-airways") // Footer Image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 2)
                            )
                            .padding()
                                                
                        Text("Jet Airways")
                            .foregroundStyle(Color.gray.opacity(0.7))
                        
                        Spacer()
                        
                        Text("$1,250")
                            .padding()
                            .bold()
                        
                        Image(systemName: "arrow.forward")
                            .padding()

                    }
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.gray.opacity(0.1))
                    
                }
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 1))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                //end of first card
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    SearchDetailView()
}

