//
//  ContentView.swift
//  LiraTech
//

import SwiftUI

let Blue = Color(red: 107.0/255.0, green: 149.0/255.0, blue: 255.0/255.0)

// Databases:
// class user - user_id, name, email, pass
// class test_user - user_id, test_id, question_id, answer_id
// class test - test_id, name
// class test_questions - test_id, question_id, question, correct answer_id
// class test_answers - question_id, answer_id, answer
// class photos - user_id, test_id, photo_id, photo
class user {
    var user_id: Int
    var full_name: String
    var photo: Image
    var email: String
    var pass: String
    
    init(user_id: Int, full_name: String, photo: Image, email: String, pass: String) {
            self.user_id = user_id
            self.full_name = full_name
            self.photo = photo
            self.email = email
            self.pass = pass
        }
}

class test {
    var test_id: Int
    var title: String
    
    init(test_id: Int, title: String) {
            self.test_id = test_id
            self.title = title
        }
}


// class user - user_id, full_name, photo, email, pass
// class test - test_id, title
// class test_user - user_id, test_id, question_id, answer_id

// class test_questions - test_id, question_id, question, correct answer_id
// class test_answers - question_id, answer_id, answer
// class photos - user_id, test_id, photo_id, photo

struct ContentView: View {
    var body: some View {
        OnboardingScreen()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 300)
                        .padding(.top, 18)
                        .padding(.bottom, 18)
            .font(.system(size: 18, weight: .bold, design: .default))
            .background(Color(red: 0.421, green: 0.585, blue: 1))
            .foregroundColor(.white)
            .cornerRadius(8.0)
            
    }
}

struct AnswerButton: ButtonStyle {
    @State public var selected = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 300, alignment: .leading)
                        .padding(.top, 18)
                        .padding(.leading, 10)
                        .padding(.bottom, 18)
            .font(.system(size: 16, weight: .regular, design: .default))
            .background(selected ? Color(red: 0.421, green: 0.585, blue: 1) : Color(red: 0.945, green: 0.961, blue: 1))
            .cornerRadius(8.0)
            .foregroundColor(.black)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                              .stroke(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
            

    }
}



struct MainLogo: View{
    var body: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 74.0, height: 74.0, alignment: .center)
            .padding(.bottom, 50)
    }
}


struct Bell: View{
    var body: some View {
        Image("bell")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30.0, height: 30.0)
    }
}


struct ProfilePhoto: View{
    var body: some View {
        Image("profile")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
            .clipShape(Circle())
            .frame(width: 60.0, height: 60.0, alignment: .trailing)
    }
}


struct LogoSmallOnTheLeft: View{
    var body: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60.0, height: 60.0, alignment: .leading)
    }
}


struct TestButton: View {
    
    
    var body: some View {
        HStack{
            Text("title")
                .font(.system(size: 16, weight: .regular, design: .default))
                .foregroundColor(Color.black)
                .frame(maxWidth: 250, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 18)
                .padding(.bottom, 18)
            VStack(alignment: .trailing){
                Text(String("grade"))
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(Color.white)

            }
            .frame(width: 50, height: 52)
            .background(Color(red: 0.421, green: 0.585, blue: 1))
        }
        .frame(minWidth: 0, maxWidth: 300)
        .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
        .cornerRadius(8.0)
    }
}


struct OnboardingScreen: View {
    
    var body: some View {
        NavigationView {
            VStack{
                MainLogo()
                Text("Ласкаво просимо до системи!")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .padding(.bottom, 30)
                
                Button(action: {}, label: {
                    NavigationLink(destination: LoginStudent()){
                        Text("Увійти як студент")
                    }
                })
                .buttonStyle(BlueButton())
                .padding(.bottom, 10)
                
                
                Button(action: {}, label: {
                    NavigationLink(destination: RegisterStudent()){
                        Text("Увійти як викладач")
                    }
                }).buttonStyle(BlueButton())
                .padding(.bottom, 220)
            }
        }
    }
}


struct LoginStudent: View {
    @ObservedObject private var loginManager = LoginManager()
    @State var colorfield = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var pass: String = ""
    @State var showMain: Bool = false
    
    var body: some View {
            VStack {
                MainLogo()
                Text("Вхід у кабінет студента")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .padding(.bottom, 30)

                Text("Уведіть логін")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .padding(.bottom, 8)
                    .frame(width: 300, height: 20, alignment: .leading)
                TextField("", text: $email)
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
                
                Text("Уведіть пароль")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .padding(.bottom, 8)
                    .frame(width: 300, height: 20, alignment: .leading)
                SecureField("", text: $pass)
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
                    .padding(.bottom, 24)
                
                NavigationLink(destination: MainPersonalScreen(user_id: 2),
                    isActive: self.$showMain) {
                    Button(action: {
                        self.showMain =
                            !self.email.isEmpty &&
                            !self.pass.isEmpty &&
                            loginManager.isAccessible(email: email, password: pass)
                    }, label: { Text("Увійти у систему") }
                    ).buttonStyle(BlueButton())
                    .padding(.bottom, 10)
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    NavigationLink(destination: RegisterStudent()){
                        Text("У мене немає акаунту")
                    }
                })
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 0.421, green: 0.585, blue: 1))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Забув пароль")
                })
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 0.421, green: 0.585, blue: 1))
        }
    }
}



struct RegisterStudent: View {
    @ObservedObject private var registerManager = RegisterManager()
    @State var colorfield = Color.black.opacity(0.7)
    @State var name: String = ""
    @State var email: String = ""
    @State var pass: String = ""
    @State var pass1: String = ""
    @State var showMain: Bool = false
    
    var body: some View {
            VStack {
                MainLogo()
                Text("Реєстрація студента")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .padding(.bottom, 30)
                Text("Уведіть повне ім'я")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .padding(.bottom, 8)
                    .frame(width: 300, height: 20, alignment: .leading)
                TextField("", text: $name)
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
                
                Text("Уведіть логін")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .padding(.bottom, 8)
                    .frame(width: 300, height: 20, alignment: .leading)
                TextField("", text: $email)
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
                
                Text("Уведіть пароль")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .padding(.bottom, 8)
                    .frame(width: 300, height: 20, alignment: .leading)
                SecureField("", text: $pass)
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
                    .padding(.bottom, 24)
                
                NavigationLink(destination: MainPersonalScreen(user_id: 2),
                    isActive: self.$showMain) {
                    Button(action: {
                        self.showMain =
                            !self.email.isEmpty &&
                            !self.pass.isEmpty &&
                            !self.name.isEmpty &&
                            registerManager.register(name: name, email: email, password: pass)
                    }, label: { Text("Зареєструватися") }
                    ).buttonStyle(BlueButton())
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    NavigationLink(destination: LoginStudent()){
                        Text("У мене є акаунт")
                    }
                })
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 0.421, green: 0.585, blue: 1))
        }
    }
}


struct MainPersonalScreen: View {
    @State var TestName: String = "МКР №1"
    @ObservedObject private var mainPageManager: MainPageManager
    
    init(user_id: Int64) {
        mainPageManager = MainPageManager()
    }
    
    var body: some View {
        VStack{
            HStack{
                LogoSmallOnTheLeft()
                    .padding(.trailing, 120)
                Bell()
                    .padding(.trailing, 12)
                ProfilePhoto()
            }
                
            Text("Особистий кабінет студента")
                .font(.system(size: 20, weight: .medium, design: .default))
                .padding(30)
            
            
            Button(action: {}, label: {
                    NavigationLink(destination: CodeToTest()){
                        Text("Пройти тестування")
                    }})
                .buttonStyle(BlueButton())
            
            // лист з тестами
            //тут приклад
            // https://matteomanferdini.com/swiftui/
            HStack{
                ForEach(mainPageManager.userTests, id: \.self) { userTest in
                    Text("Тест " + String(mainPageManager.userTests.count))
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: 250, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 18)
                        .padding(.bottom, 18)
                    VStack(alignment: .trailing){
                        Text(String("50%"))
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(Color.white)

                    }
                    .frame(width: 50, height: 52)
                    .background(Color(red: 0.421, green: 0.585, blue: 1))
                }
                .frame(minWidth: 0, maxWidth: 300)
                .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
                .cornerRadius(8.0)
                            }
        }
    }
}


struct CodeToTest: View {
    @State var code: String = ""

    var body: some View {
        VStack{
            HStack{
                LogoSmallOnTheLeft()
                    .padding(.trailing, 120)
                Bell()
                    .padding(.trailing, 12)
                ProfilePhoto()
            }
            .padding(.bottom, 30)
            Text("Введіть код для входу у тест")
                .font(.system(size: 20, weight: .medium, design: .default))
                .padding(.bottom, 40)
            
              Text("Уведіть код тесту")
                .font(.system(size: 18, weight: .medium, design: .default))
                .padding(.bottom, 8)
                .frame(width: 300, height: 20, alignment: .leading)
            TextField("", text: $code)
                .frame(minWidth: 0, maxWidth: 300)
                .padding(.top, 18)
                .padding(.bottom, 18)
                .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
            
            Button(action: {}, label: {
                    NavigationLink(destination: EnterConfirmation()){
                    Text("Увійти у тестування")
                    }
                    
                })
            .buttonStyle(BlueButton())
            .padding(.bottom, 400)
        }
    }
}
    


struct EnterConfirmation: View {

    var body: some View {
        VStack{
            HStack{
                LogoSmallOnTheLeft()
                    .padding(.trailing, 120)
                Bell()
                    .padding(.trailing, 12)
                ProfilePhoto()
            }
            .padding(.bottom, 30)
            Text("Ви входите у тест №02010")
                .font(.system(size: 20, weight: .medium, design: .default))
                .padding(.bottom, 8)
            Text("“Тест №1: Loops: while, for”")
              .font(.system(size: 18, weight: .medium, design: .default))
              .padding(.bottom, 8)
       
            VStack{
                Text("Увага!")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.top, 32)
                    .foregroundColor(Color(red: 0.421, green: 0.585, blue: 1))
                    .frame(minWidth: 0, maxWidth: 280, alignment: .leading)
                Text("Під час написання тестування ведеться відеозйомка. Будуть робитися фотографії людини, яка проходить тестування. Так викладач удостовіриться, що саме його студент проходив тестування. Якщо Ви згодні з умовами, натисніть на кнопку нижче. Вся інформація конфіденціальна, всі фотографії будуть видалені після 2 тижнів з перевірки тесту викладачем.")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .frame(width: 280, height: 250, alignment: .leading)
                Button(action: {}, label: {
                        NavigationLink(destination: QuestionView()){
                        Text("Я згоден з умовами")
                        }
                    })
                    .buttonStyle(BlueButton())
                    .frame(minWidth: 0, maxWidth: 280)
                    
                    .padding(.bottom, 32)
            }
            .frame(width: 320, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color(red: 0.421, green: 0.585, blue: 1), lineWidth: 2))
            .padding(.bottom, 16)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Я не згоден, вийти з тесту")
            })
            .frame(minWidth: 0, maxWidth: 300, alignment: .center)
            .padding(.bottom, 96)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color(red: 0.421, green: 0.585, blue: 1))
        }
    }
}

struct QuestionView: View {
    @State var title: String = "Тест № 1"
    @State var timeRemaining = 25*60
    @State var selected = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    var body: some View {
        VStack{
            HStack{
                LogoSmallOnTheLeft()
                    .padding(.trailing, 120)
                Bell()
                    .padding(.trailing, 12)
                ProfilePhoto()
            }
            .padding(.bottom, 30)
            Text("Тест № 1")
                .font(.system(size: 20, weight: .medium, design: .default))
            HStack{
                Text("Час проходження")
                  .font(.system(size: 18, weight: .medium, design: .default))
                    .frame(maxWidth: 250, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 18)
                    .padding(.bottom, 18)
                //далі ламаний відлік :)
                VStack{
                    Text("\(timeString(time: timeRemaining))") // відлік
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 0.421, green: 0.585, blue: 1))
                        .onReceive(timer){ _ in
                                if self.timeRemaining > 0 {
                                    self.timeRemaining -= 1
                                }else{
                                    self.timer.upstream.connect().cancel()
                                }
                            }
                }
                .frame(maxWidth: 50, alignment: .trailing)
            }
            .frame(minWidth: 0, maxWidth: 300)
        }
        VStack(alignment: .leading) {
            Text("1. Питання")
                .font(.system(size: 16, weight: .regular, design: .default))
            Button(action: {}, label: {
                Text("a) answer")
            })
            .buttonStyle(AnswerButton())
            
        }
        .frame(maxWidth: 300, alignment: .leading)

    }
    
    func timeString(time: Int) -> String {
            let minutes = Int(time) % 60
            let seconds = Int(time) % 60
            return String(format:"%02i:%02i", minutes, seconds)
        }
}
