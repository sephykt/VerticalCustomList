//
//  ContentView.swift
//  VerticalCustomList
//
//  Created by Ayaal Ivanov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.viewModels) { item in
                    VerticalCell(viewModels: item.horizontalCellViewModels)
                    Text(String(describing: item.id))
                        .font(.system(size: 12))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct VerticalCell: View {

    var viewModels: [HorizontalCellViewModel]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(viewModels) { item in
                    HorizontalCell(number: item.number)
                }
            }
        }
    }
}

struct HorizontalCell: View {

    @State private var timer: Timer?
    @State private var totalSeconds: Int = 1
    @State private var seconds: Int = 0

    @State var number: Int = 0

    var body: some View {
        Button(action: {
            print("Button Tapped!")
        }, label: {
            Text(String(describing: number))
                .frame(width: 50, height: 50)
                .addBorder(Color.gray, width: 1, cornerRadius: 20)
        })
        .buttonStyle(CustomButtonStyle())
        .onAppear {
            startTimer()
        }
    }

    private func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                updateTimer()
            }
            timer?.tolerance = 0.2
        }
    }

    private func updateTimer() {
        if seconds > 0 {
            seconds -= 1
        } else {
            number = Int.random(in: 1..<100)
            seconds = totalSeconds
        }
    }

    private func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
}

struct CustomButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

#Preview {
    ContentView()
}
