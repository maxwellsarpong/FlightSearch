import SwiftUI

struct RegistrationView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isLoading: Bool = false
    @State private var showLoginPage: Bool = false
    @State private var registrationError = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            Text("Register for an account")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(Color.gray.opacity(0.5))
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .center)
                
            Text("Name")
                .font(.subheadline)
                .foregroundStyle(Color.gray)
                .padding(.leading, 1)
            
                
            // Name Input Field
            TextField("Enter your Name", text: $name)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .frame(width: 370, height: 50)
                .autocapitalization(.none)
                .textContentType(.name)
            
            
            Text("Email")
                .font(.subheadline)
                .foregroundStyle(Color.gray)
                .padding(.leading, 1)
            
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
                .textContentType(.emailAddress)
            
            
            Text("Password")
                .foregroundStyle(Color.gray)
                .font(.subheadline)
                .padding(.leading, 1)

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
            
            
            //confirm password
            Text("Confirm Password")
                .foregroundStyle(Color.gray)
                .font(.subheadline)
                .padding(.leading, 1)

            // Password Input Field
            SecureField("Enter your password to confirm", text: $confirmPassword)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .frame(width: 370, height: 50)
                .autocapitalization(.none)
            
                .padding(.bottom, 10)
            
            //registration error toast
            if !registrationError.isEmpty {
                  Text(registrationError)
                      .foregroundColor(.red)
                      .multilineTextAlignment(.center)
            }
            
            
            // login button
            ZStack {
                Button(action: {
                    Task {
                        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
                            registrationError = "All fields are required"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                registrationError = ""
                            }
                            return
                        }
                        
                        guard password == confirmPassword else {
                            registrationError = "Passwords do not match"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                registrationError = ""
                            }
                            return
                        }
                        
                        isLoading = true
                        registrationError = ""
                        
                        let success = await createUser(name: name, email: email, password: password)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                            
                            if success{
                                showLoginPage = true
                            }else{
                                registrationError = "Registration failed. Try again."
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    registrationError = ""
                                }
                            }
                        }
                    }
                
                }) {
                    HStack {
                        Text("Register")
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
            }
            //end of login button
            .fullScreenCover(isPresented: $showLoginPage){
                LoginView()
            }
            
            }
            .padding()
        }
    }


#Preview {
    RegistrationView()
}
