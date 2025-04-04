import SwiftUI

struct LoginView: View {
    
    @State private var isChecked = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showFlightPage: Bool = false
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Text("Login instantly")
                .foregroundStyle(Color.gray)
            
            HStack{
                
                //facebook login button
                Button(action: {
                    print("Login button tapped")
                    }) {
                        HStack {
                            Image("facebook")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                           }
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color(red: 0/255, green: 51/255, blue: 102/205))
                           .foregroundColor(.white)
                           .cornerRadius(10)
                           .shadow(radius: 1)
                       }
                       .padding(.horizontal, 1)
                

                //google login button
                Button(action: {
                    print("Login button tapped")
                    }) {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 24, height: 24)
                           }
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.white)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                           .shadow(radius: 1)
                       }
                       .padding(.horizontal, 1)
                
            }
            .padding()
            
            Text("or")
                .foregroundStyle(Color.gray)
            
            VStack(alignment: .leading, spacing: 4){
                
                //login forms
                VStack(alignment: .leading, spacing: 10) {
                    // Email Label
                    Text("E-mail ID")
                        .foregroundStyle(Color.gray)
                        .font(.subheadline)
                        .padding(.leading, 10)

                    // Email Input Field
                    TextField("Enter your email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .frame(width: 370, height: 50)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                    // Password Label
                    Text("Password")
                        .foregroundStyle(Color.gray)
                        .font(.subheadline)
                        .padding(.leading, 10)

                    // Password Input Field
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .frame(width: 370, height: 50)
                        .autocapitalization(.none)

                }
                .padding(.horizontal)

                
                //check button section
                HStack{
                    Button(action: {
                                isChecked.toggle()
                            }) {
                                HStack {
                                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(isChecked ? Color(red: 0.54, green: 0.37, blue: 0.89) : .gray)

                                    Text("Remember me")
                                        .foregroundColor(Color.gray)
                                        .font(.subheadline)
                                }
                                .padding()
                            }
                            .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    //forgotten password section
                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        Text("Forgot password?")
                            .foregroundStyle(Color(red: 0.54, green: 0.37, blue: 0.89))
                            .bold()
                    }
                    .padding()
                    
                }
               
                
                // login button
                ZStack {
                    Button(action: {
                        isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                            showFlightPage = true
                        }
                    }) {
                        HStack {
                            Text("Login")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.54, green: 0.37, blue: 0.89))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .disabled(isLoading)
                        
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(1.2)
                        }
                    }
                    .padding(.horizontal)
                }
                //end of login button
                
                //register for account link
                HStack{
                    
                    Text("Don't have an account?")
                        .foregroundStyle(Color.gray)
                    
                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        Text("Register now")
                            .foregroundStyle(Color(red: 0.54, green: 0.37, blue: 0.89))
                            .bold()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                                
            }
            .fullScreenCover(isPresented: $showFlightPage){
                FlightSearchView()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

#Preview {
    LoginView()
}

