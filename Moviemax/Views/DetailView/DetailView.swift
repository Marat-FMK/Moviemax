//
//  DetailView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI


struct DetailImage: View { // marat
    
    let imageURL: String
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { Image in
            Image
                .resizable()
                .scaledToFit()
                .frame(width: width , height: height)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .imageShadow, radius: 10, x: 0, y: 0)
                .padding(.top, 20)
        } placeholder: {
            ShimmerView(width: width, height: height, color: .accentPurple)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .imageShadow, radius: 10, x: 0, y: 0)
                .padding(.top, 20)
        }
    }
}

struct DetailVStack: View { //  marat
    
    let description: String
    let persons: [Person]
    
    var body: some View {
    VStack(alignment: .leading) {
        Text("Story Line")
            .customFont(name: .plusJacartaSemiBold, size: 16)
            .padding(.bottom, 16)
            .foregroundStyle(.textBlack)
        
        ExpandableText(description, lineLimit: 6)
            .customFont(name: .plusJacartaRegular, size: 14)
            .foregroundStyle(.subtextGray)
            .padding(.bottom, 24)
        Text("Cast and Crew")
            .customFont(name: .plusJacartaSemiBold, size: 16)
            .padding(.bottom, 16)
            .foregroundStyle(.textBlack)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(persons, id: \.id) { person in
                    CrewMemberView(image: person.photo ?? "", name: person.name ?? "no name", role: person.profession ?? "no info")
                }
            }
        }
        .frame(height: 41)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
}


struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    let id: Int
    @StateObject var viewModel =  DetailViewModel()
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        
        NavigationStack {
            
            if viewModel.movie == Movie.empty {
                VStack {
                    ShimmerView(width: ((screenWidth * 9) / 16), height: screenWidth, color: .buttonPurple)
                        .clipShape( RoundedRectangle(cornerRadius: 16))
                    Image("serverError")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 310)
                    Spacer()
                }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Movie Detail")
                                .customFont(name: .plusJacartaBold, size: 18)
                                .foregroundStyle(.textBlack)
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            BackButtonView(action: { dismiss() })
                        }
                    }
            } else {
                ScrollView {
                    VStack(spacing: 0) {
                        // .frame(width: ((screenWidth * 9) / 16) , height: screenWidth)
                        DetailImage(imageURL: viewModel.movie.poster?.url ?? "", height: screenWidth, width: ((screenWidth * 9) / 16))
                        
                        Text(viewModel.movie.name ?? "no name")
                            .foregroundStyle(.textBlack)
                            .padding(.top, 24)
                            .customFont(name: .plusJacartaBold, size: 24)
                        HStack(alignment: .center, spacing: 20) {
                            MovieTimeView(time: viewModel.movie.movieLength ?? 0)
                            MovieDateVIew(date: String(viewModel.movie.year ?? 0))
                            
                            // ???
                            MovieCategoryView(category: viewModel.movie.genres?.first?.name ?? "All")
                        }
                        .padding(.vertical, 17)
                        RatingStarView(rating: Int(viewModel.movie.rating?.imdb ?? 0.0))
                            .padding(.bottom, 32)
                        
                        DetailVStack(description: viewModel.movie.description ?? "", persons: viewModel.movie.persons ?? [])
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Movie Detail")
                            .customFont(name: .plusJacartaBold, size: 18)
                            .foregroundStyle(.textBlack)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            viewModel.changeFavorite()
                        } label: {
                            Image(
                                systemName: viewModel.isFavorite
                                ? "heart.fill"
                                : "heart"
                            )
                            .foregroundColor(viewModel.isFavorite ? .accentPurple : Color.textBlack)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        BackButtonView(action: { dismiss() })
                    }
                }
                .background(.whiteBackground)
                .safeAreaInset(edge: .bottom) {
                    MiddleButtonView(action: {}, label: "Watch now")
//                        .padding(20)
                        .padding(.horizontal, 30)
                        .background(.ultraThinMaterial.opacity(0.6))
                        .shadow(radius: 40)
                        .zIndex(1)
                }
            }
        }
        .onAppear {
            viewModel.fetchFullInfoAboutFilm(id: id)
        }// end nav
        
        
    }
}



struct CrewMemberView:  View {
    let image: String
    let name: String
    let role: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { Image in
                Image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.toogle)
                    }
                    .padding(2)
            } placeholder: {
                ShimmerView(width: 50, height: 50, color: .accentPurple)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.buttonPurple)
                    }
                    .padding(2)
            }

            VStack(alignment: .leading) {
                Text(name)
					.customFont(name: .plusJacartaSemiBold, size: 14)
                Text(role)
					.customFont(name: .plusJacartaRegular, size: 10)
                    .foregroundStyle(.gray)
            }
        }
    }
}

struct ExpandableText: View {
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    private var text: String
    
    let lineLimit: Int
    
    init(_ text: String, lineLimit: Int) {
        self.text = text
        self.lineLimit = lineLimit
    }
    
    private var moreLessText: String {
        if !truncated {
            return ""
        } else {
            return self.expanded ? " Show less" : " Show more"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .background(
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { visibleTextGeometry in
                            ZStack { //large size zstack to contain any size of text
                                Text(self.text)
                                    .background(GeometryReader { fullTextGeometry in
                                        Color.clear.onAppear {
                                            self.truncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        })
                        .hidden() //keep hidden
                )
            if truncated {
                Button(action: {
                    withAnimation {
                        expanded.toggle()
                    }
                }, label: {
                    Text(moreLessText)
						.foregroundStyle(.accentPurple)
                })
            }
        }
    }
}

//#Preview {
//	DetailView(id: 659613)
//}
