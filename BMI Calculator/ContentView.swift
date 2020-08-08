//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Kadir on 7.08.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var height: String = ""
    @State var weight: String = ""
    @State var bmi: String = ""
    @State var bmiText: String = ""
    @State var bmiDetail: String = ""

    @State var showImage = false
    @State var overWeightImage = false
    @State var underWeightImage = false
    @State var fit = false
    @State var beCareful = false

    var body: some View {
        VStack {
            VStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                        .padding(.bottom, 20)
                    HStack {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24)
                            .foregroundColor(.purple)
                        TextField("Height in cm (like 180)", text: $height)
                            .font(Font.system(size: 24))
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .background(Color.clear)
                            .keyboardType(.numberPad)
                    }
                    Divider()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                        .padding(.horizontal)
                        

                    HStack {
                        Image(systemName: "heart.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24)
                            .foregroundColor(.blue)
                        TextField("Weight in kg (like 75)", text: $weight)
                            .font(Font.system(size: 24))
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .keyboardType(.numberPad)
                    }
                    Divider()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                        .padding(.horizontal)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

                VStack {
                    Text(bmiText)
                        .font(.title)
                        .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.13))

                    Text(bmi)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.13))
                    Text(bmiDetail)
                        .padding(.all)
                        .font(.headline)
                        .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.13))
                    if showImage {
                        if overWeightImage {
                            Image("not-healty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: screen.height * 0.3)
                        } else if beCareful {
                            Image("bmi")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: screen.height * 0.3)
                        } else if fit {
                            Image("fit")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: screen.height * 0.3)
                        } else if underWeightImage {
                            Image("weak")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: screen.height * 0.3)
                        }
                    } else {
                        Image("bmi")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: screen.height * 0.3)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding()
            }

            HStack {
                Button(action: {
                    let weights = Double(self.weight)
                    let height = Double(self.height)
                    if weights != nil, height != nil {
                        let bmis = Int(weights! / ((height! / 100) * (height! / 100)))
                        self.bmi = "\(bmis)"
                        self.bmiText = "Your BMI is"
                        if bmis > 30 {
                            self.bmiDetail = "You are considered to be obese."
                            self.fit = false
                            self.underWeightImage = false
                            self.overWeightImage = true
                            self.beCareful = false
                        } else if bmis > 25 {
                            self.bmiDetail = "You are considered to be overweight."
                            self.fit = false
                            self.underWeightImage = false
                            self.overWeightImage = false
                            self.beCareful = true
                        } else if bmis > 18, bmis < 25 {
                            self.bmiDetail = "You are healthy!"
                            self.fit = true
                            self.underWeightImage = false
                            self.overWeightImage = false
                            self.beCareful = false
                        } else {
                            self.bmiDetail = "You are low weight."
                            self.fit = false
                            self.underWeightImage = true
                            self.overWeightImage = false
                            self.beCareful = false
                        }
                        self.showImage = true
                    }

                }) {
                    Text("Calculate")
                        .frame(width: screen.width * 0.50, height: screen.height * 0.07)
                        .font(.system(size: 20, weight: .semibold))
                        .background(
                            ZStack {
                                Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))

                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)

                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .padding(2)
                                    .blur(radius: 2)
                            }
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(.white))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.endTextEditing()
        }
        .padding(.bottom, screen.height * 0.025)
    }
}

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let screen = UIScreen.main.bounds
