//
//  DetailView.swift
//  SwiftUITest
//
//  Created by Joonhwan Jeon on 2022/11/14.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer = false
    
    @State private var showDeleteAleret = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        HStack {
                            Text(memo.content)
                                .padding()
                            
                            Spacer(minLength: 0)
                        }
                        
                        Text(memo.insertDate, style: .date)
                            .padding()
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("메모 상세")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        showDeleteAleret = true
                    } label: {
                        Image(systemName: "trash")
                    }
                    .foregroundColor(.red)
                    .alert("삭제 확인", isPresented: $showDeleteAleret) {
                        Button(role: .destructive) {
                            store.delete(memo: memo)
                            dismiss()
                        } label: {
                            Text("삭제")
                        }
                    } message: {
                        Text("메모를 삭제할까요?")
                    }
                    
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView(memo: memo)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
