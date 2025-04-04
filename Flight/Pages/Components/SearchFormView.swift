import SwiftUI

struct SearchFormView: View {
    @State private var origin: String = ""
    @State private var destination: String = ""
    @State private var departureDate: String = ""
    @State private var returnDate: String = ""
    @State private var showSearchDetail: Bool = false

    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            //form section start
            VStack {
                
                Text("Origin")
                    .foregroundStyle(Color.gray)
                    .font(.subheadline)
                    .padding(.leading, 2)
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                TextField("San Francisco", text: $origin)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding(.bottom, 10)
                
                Text("Destination")
                    .foregroundStyle(Color.gray)
                    .font(.subheadline)
                    .padding(.leading, 2)
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                TextField("JFK, New York", text: $destination)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                    .padding(.bottom, 10)
                
                //start of first horizontal
                HStack(spacing: 10){
                    VStack{
                        Text("Depature")
                            .foregroundStyle(Color.gray)
                            .font(.subheadline)
                            .frame(maxWidth:.infinity, alignment: .leading)
                        
                        TextField("30, March 2025", text: $departureDate)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Return")
                            .foregroundStyle(Color.gray)
                            .font(.subheadline)
                            .frame(maxWidth:.infinity, alignment: .leading)
                        
                        TextField("1, September 2025", text: $returnDate)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                    }
                }
                .padding(.bottom, 10)
                //end of first horizontal
                
                
                //start of second horizontal
                HStack(spacing: 10){
                    VStack{
                        Text("Passengers")
                            .foregroundStyle(Color.gray)
                            .font(.subheadline)
                            .frame(maxWidth:.infinity, alignment: .leading)
                        
                        TextField("1 Adult", text: $departureDate)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Class")
                            .foregroundStyle(Color.gray)
                            .font(.subheadline)
                            .frame(maxWidth:.infinity, alignment: .leading)
                        
                        TextField("Economy", text: $returnDate)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                    }
                }
                .padding(.bottom, 10)
                //end of second horizontal
                
                //start of search button
                Button(action: {
                    showSearchDetail = true
                    print("Login button tapped")
                    }) {
                        HStack {
                            Text("SEARCH")
                           }
                           .bold()
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color(red: 0.54, green: 0.37, blue: 0.89))
                           .foregroundColor(.white)
                           .cornerRadius(10)
                           .shadow(radius: 1)
                       }
                //end of search button
                
            }
            .fullScreenCover(isPresented: $showSearchDetail){
                    SearchDetailView()
            }
            .padding(.horizontal)
            //end of form section
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity,alignment: .topLeading)
    }
}

#Preview {
    SearchFormView()
}

