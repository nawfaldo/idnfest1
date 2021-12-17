//
//  RegisterView.swift
//  Instagram
//
//  Created by Nawfaldo on 25/06/21.
//

import SwiftUI

struct RegisterationView: View {
    @Environment(\.presentationMode) var mode
    @State var email = ""
    @State var username = ""
    @State var fullname = ""
    @State var password = ""
    @State var chooseImage = false
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @State var registeration = 0
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            if registeration == 0 {
                HStack {
                    Button(action: {mode.wrappedValue.dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color("Adaptive"))
                    })
                    
                    Spacer()
                }
                
                VStack(alignment: .center, spacing: 5) {
                    Text("Upload Picture")
                        .font(.title2)
                    
                    Text("Upload a picture for your new account.\n You can always change it later.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color("Adaptive"))
                    }
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
                .padding()
                
                Button(action: {
                    withAnimation {
                        registeration = 1
                    }
                }, label: {
                    HStack {
                        Spacer()
                        
                        Text("Next")
                            .foregroundColor(selectedImage == nil ? .white.opacity(0.7) : .white)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding(10)
                    .background(selectedImage == nil ? Color.blue.opacity(0.7) : Color.blue)
                    .cornerRadius(5)
                })
                .disabled(selectedImage == nil ? true : false)
            } else if registeration == 1 {
                HStack {
                    Button(action: {
                        withAnimation {
                            registeration = 0
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color("Adaptive"))
                    })
                    
                    Spacer()
                }
                
                VStack(alignment: .center, spacing: 5) {
                    Text("Create Name")
                        .font(.title2)
                    
                    Text("Create a name for your new account.\n You can always change it later.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                VStack(spacing: 10) {
                    CustomTextField(text: $username, placeholder: Text("Username"))
                    
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"))
                    
                    Button(action: {
                        withAnimation {
                            registeration = 2
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            
                            Text("Next")
                                .foregroundColor(username.isEmpty || fullname.isEmpty ? .white.opacity(0.7) : .white)
                                .fontWeight(.medium)
                            
                            Spacer()
                        }
                        .padding(10)
                        .background(username.isEmpty || fullname.isEmpty ? Color.blue.opacity(0.7) : Color.blue)
                        .cornerRadius(5)
                    })
                    .disabled(username.isEmpty || fullname.isEmpty ? true : false)
                }
            } else {
                HStack {
                    Button(action: {
                        withAnimation {
                            registeration = 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color("Adaptive")) 
                    })
                    
                    Spacer()
                }
                
                VStack(alignment: .center, spacing: 5) {
                    Text("Choose Email")
                        .font(.title2)
                    
                    Text("Choose an email and create password\n for your new account. You can always change it later.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                VStack(spacing: 10) {
                    CustomTextField(text: $email, placeholder: Text("Email"))
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                    
                    Button(action: {
                        viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                    }, label: {
                        HStack {
                            Spacer()
                            
                            Text("Register")
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
            }
            Spacer()
        }
        .padding()
    }
}

extension RegisterationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegisterationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterationView()
            .preferredColorScheme(.dark)
    }
}

