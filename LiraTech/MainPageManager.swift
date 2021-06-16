//
//  MainPageManager.swift
//  LiraTech
//
//  Created by Ira Zozulya on 02.06.2021.
//

import Combine

final class MainPageManager: ObservableObject {
    var userTests: [User_tests] = []
    
    struct QuizModel  {
        var text : String?
        var answer : [String]
        //specify what is the correct answer
        var correct : Int?
    }


    var Quiz1 : [QuizModel] = [

        QuizModel(
        text: "1. Якою компанією була розроблена мова SWIFT?",
        answer: ["a) Microsoft","b) Apple","c) Amazon","d) Samsung"],
        correct: 1),
        
        QuizModel(
        text: "2. Синтаксис звичний для знайомих з ними розробників, але водночас відрізняється?",
        answer: ["a) використанням засобів автоматичного розподілу пам'яті і контролю переповнення змінних і масивів, що значно збільшує надійність і безпеку коду","b) швидкі операції над колекціями, елементи функційного програмування","c) використанням засобів ","d) використанням засобів розподілу пам'яті"],
        correct: 2),
        
        QuizModel(
        text: "3. Яке прізвище першого президента України?",
        answer: ["a) Зеленський","b) Ющенко","c) Кравчук","d) Кучма"],
        correct: 2),
        
        QuizModel(
        text: "4. Наступне ціле число після 45?",
        answer: ["a) 0","b) 34","c) 70","d) 46"],
        correct: 3),
        

    ]
}
