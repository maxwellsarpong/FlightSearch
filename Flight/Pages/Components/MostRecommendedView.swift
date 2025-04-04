import SwiftUI

struct MostRecommendedView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
            //start of recommended text section
            HStack {
                Text("Recommended for you")
                    .padding()
                    .font(.title3)
                    .bold()
                                
                Button(action: {
                    print("Login button tapped")
                    }) {
                        HStack {
                            Text("VIEW ALL")
                                .font(.footnote)
                                .bold()
                           }
                        .frame(maxHeight: 1)
                           .padding()
                           .background(Color.gray.opacity(0.2))
                           .foregroundColor(.black)
                           .cornerRadius(10)
                       }
            }
            //end of text recommend section
            
            //start of first recommended item
            HStack{
                AsyncImage(url: URL(string: "https://content.skyscnr.com/c88da2b091534f7baf8536b3959ce83a/GettyImages-495057957.jpg")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 110, height: 100, alignment: .leading)
                .clipped()
                .cornerRadius(8)
                
                Text("Norway")
                    .padding(.horizontal, 8)
                    .bold()
                
                Text("From")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .padding(.horizontal, 8)
                
                Text("$1,250")
                    .bold()
                    .padding(.horizontal, 8)
                
                
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.forward")
                        
                }

            }
            .padding()
            //end of first recommended item
            
            
            //start of second recommenddation item
            HStack{
                AsyncImage(url: URL(string: "https://content.skyscnr.com/afeafa38f5fb83923c9c58f78bdc195c/GettyImages-185526100.jpg")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 110, height: 100, alignment: .leading)
                .clipped()
                .cornerRadius(8)
                
                Text("Bulgaria")
                    .padding(.horizontal, 8)
                    .bold()
                
                Text("From")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .padding(.horizontal, 8)
                
                Text("$873")
                    .bold()
                    .padding(.horizontal, 8)
                
                
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.forward")
                        
                }

            }
            .padding()
            //end of second recommended item
            
            //start of third recommended item
            HStack{
                AsyncImage(url: URL(string: "https://content.skyscnr.com/a5abc7ea070a8e2a6431477ca00d179e/GettyImages-147049964.jpg")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 110, height: 100, alignment: .leading)
                .clipped()
                .cornerRadius(8)
                
                Text("Bahamas")
                    .padding(.horizontal, 8)
                    .bold()
                
                Text("From")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .padding(.horizontal, 8)
                
                Text("$360")
                    .bold()
                    .padding(.horizontal, 8)
                
                
                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.forward")
                        
                }

            }
            .padding()

            //end of third recommended item
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    MostRecommendedView()
}

