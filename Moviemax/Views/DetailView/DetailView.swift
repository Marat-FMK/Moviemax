//
//  DetailView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: DetailViewModel
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
	init(movie: Movie) {
		_viewModel = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    Image(viewModel.movie.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: ((screenWidth * 9) / 16) , height: screenWidth)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .imageShadow, radius: 10, x: 0, y: 0)
                        .padding(.top, 20)
                    Text(viewModel.movie.title)
						.foregroundStyle(.textBlack)
                        .padding(.top, 24)
						.customFont(name: .plusJacartaBold, size: 24)
                    HStack(alignment: .center, spacing: 20) {
                        MovieTimeView(time: viewModel.movie.timing)
                        MovieDateVIew(date: viewModel.movie.date)
                        MovieCategoryView(category: viewModel.movie.category)
                    }
                    .padding(.vertical, 17)
                    RatingStarView(rating: Int(viewModel.movie.rating))
                        .padding(.bottom, 32)
                    
                    VStack(alignment: .leading) {
                        Text("Story Line")
							.customFont(name: .plusJacartaSemiBold, size: 16)
                            .padding(.bottom, 16)
							.foregroundStyle(.textBlack)

                        ExpandableText(viewModel.movie.description, lineLimit: 6)
							.customFont(name: .plusJacartaRegular, size: 14)
							.foregroundStyle(.subtextGray)
                            .padding(.bottom, 24)
                        Text("Cast and Crew")
							.customFont(name: .plusJacartaSemiBold, size: 16)
                            .padding(.bottom, 16)
							.foregroundStyle(.textBlack)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.movie.castCrew, id: \.self) { crewMember in
                                    CrewMemberView(image: crewMember.image, name: crewMember.name, role: crewMember.role)
                                }
                            }
                        }
                        .frame(height: 41)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                    .padding(20)
                    .padding(.horizontal, 30)
                    .background(.whiteBackground)
                    .background(.ultraThinMaterial)
                    .shadow(radius: 60)
            }
			.onAppear {
				viewModel.getFavourite()
			}
        }
    }
}

struct CrewMemberView: View {
    let image: String
    let name: String
    let role: String
    
    var body: some View {
        HStack {
            Image(image)
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

#Preview {
	DetailView(
		movie: Movie(title: "Luck", date: .now, image: "luck", urlTrailer: "", rating: 4, timing: 148, responders: 53, category: "Action", description: """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
 """, castCrew: [
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
 ]))
}
