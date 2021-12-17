//
//  LoginView.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    Image("instagramtext")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 140, height: 60)
                    
                    VStack(spacing: 10) {
                        CustomTextField(text: $email, placeholder: Text("Email"))
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                        
                        Button(action: {
                            viewModel.login(withEmail: email, password: password)
                        }, label: {
                            HStack {
                                Spacer()
                                
                                Text("Sign In")
                                    .foregroundColor(email.isEmpty || password.isEmpty ? .white.opacity(0.7) : .white)
                                    .fontWeight(.medium)
                                
                                Spacer()
                            }
                            .padding(10)
                            .background(email.isEmpty || password.isEmpty ? Color.blue.opacity(0.7) : Color.blue)
                            .cornerRadius(5)
                        })
                        .disabled(email.isEmpty || password.isEmpty ? true : false)
                    }
                    .padding()
                    
                    Spacer()
                }
                
                VStack(spacing: 17) {
                    Spacer()
                    
                    Divider()
                    
                    HStack {
                        Text("Doens't have an account?")
                            .font(.caption)
                        
                        NavigationLink(
                            destination: RegisterationView().navigationBarHidden(true),
                            label: {
                                Text("Sign Up.")
                                    .font(.caption)
                                    .fontWeight(.medium)
                            })
                    }
                }
                .padding(.bottom, 10)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}

