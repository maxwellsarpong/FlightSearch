import Foundation

let urlEndpoint = "http://127.0.0.1:8000"

//access token format
struct AuthResponse: Codable {
    let access_token: String
}

//login already created user
func login(email: String, password: String) async -> Bool{
    guard let url = URL(string: "\(urlEndpoint)/login") else {
        print("Invalid URL")
        return false
    }
    
    let credentials = ["email": email, "password": password]
    
    guard let jsonData = try? JSONEncoder().encode(credentials) else {
        print("Encoding error")
        return false
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    
    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            print("Invalid response")
            return false
        }
        
        // Decode the token or response object here
        // e.g., assuming the response is { "token": "..." }
        let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
        print("Logged in! Token: \(authResponse.access_token)")
        return true
        
    } catch {
        debugPrint(error)
        return false
    }
}


//create a new user
func createUser(name: String, email: String, password: String) async -> Bool {
    guard let url=URL(string: "\(urlEndpoint)/register") else {
        print("Invalid URL")
        return false
    }
    
    let userData = ["name": name, "email": email, "password": password]
    
    guard let jsonData = try? JSONEncoder().encode(userData) else{
        print("Decoding error")
        return false
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    
    do {
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 || httpResponse.statusCode == 201  else {
            print("Invalid response")
            return false
        }
        
        return true
        
    } catch {
        debugPrint(error)
        return false
    }

}

