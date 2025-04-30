//
//  CarouselView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 08/04/2025.
//

import SwiftUI

struct CarouselView: View {
	let images: [Movie]

	@Binding var currentIndex: Int

    var body: some View {
		GeometryReader { geometry in
			let imageWidth = geometry.size.width * 0.5
			let imageHeight = geometry.size.height * 0.8

			ZStack {
				if images.count > 1 {
					// Left Image
					CaruselCardView(image: images[previousIndex()], imageWidth: imageWidth, imageHeight: imageHeight, offset: -imageWidth - 20, degrees: -4)

					// Right Image
					CaruselCardView(image: images[nextIndex()], imageWidth: imageWidth, imageHeight: imageHeight, offset: imageWidth + 20, degrees: 4)

					// Center Image
					CaruselCenterCardView(movie: images[currentIndex], action: {}, imageWidth: imageWidth, imageHeight: imageHeight)
				} else if images.count == 1 {
					CaruselCenterCardView(movie: images[0], action: {}, imageWidth: imageWidth, imageHeight: imageHeight)
				}

			}
			.frame(width: geometry.size.width, height: geometry.size.height)
			.gesture(
				DragGesture()
					.onEnded { value in
						let threshold: CGFloat = 50
						if value.translation.width < -threshold {
							// Swiped Left
							withAnimation {
								currentIndex = nextIndex()
							}
						} else if value.translation.width > threshold {
							// Swiped Right
							withAnimation {
								currentIndex = previousIndex()
							}
						}
					}
			)
		}
		.frame(height: 350)
    }

	private func nextIndex() -> Int {
		(currentIndex + 1) % images.count
	}

	private func previousIndex() -> Int {
		(currentIndex - 1 + images.count) % images.count
	}
}

struct CaruselCardView: View {
	let image: Movie
	let imageWidth: CGFloat
	let imageHeight: CGFloat
	let offset: CGFloat
	let degrees: CGFloat

	var body: some View {
		Image(image.image)
			.resizable()
			.scaledToFill()
			.frame(width: imageWidth, height: imageHeight)
			.clipped()
			.cornerRadius(16)
			.rotationEffect(.degrees(degrees))
			.offset(x: offset, y: 30)
	}
}

struct CaruselCenterCardView: View {
	let movie: Movie
	let action: () -> Void
	let imageWidth: CGFloat
	let imageHeight: CGFloat

	var body: some View {
		ZStack {
			Image(movie.image)
				.resizable()
				.scaledToFill()
				.frame(width: imageWidth, height: imageHeight)
				.clipped()
				.cornerRadius(20)
				.shadow(radius: 10)
			LinearGradient(
				gradient: Gradient(colors: [Color.gradient, Color.clear]),
				startPoint: .bottom,
				endPoint: .top
			)
//			.frame(width: imageWidth, height: imageHeight)
			.clipShape(RoundedRectangle(cornerRadius: 16))
			HStack {
				VStack(alignment: .leading) {
					Spacer()
					Button(movie.category) {
						action()
					}
					.padding(.horizontal, 8)
					.padding(.vertical, 4)
					.background(Color.white.opacity(0.2))
					.customFont(name: .plusJacartaRegular, size: 10)
					.clipShape(Capsule())
					.foregroundStyle(.totalWhiteText)
					Text(movie.title)
						.customFont(name: .plusJacartaBold, size: 14)

				}
				.padding(.horizontal, 14)
				.padding(.bottom, 20)
				Spacer()
			}
		}
		.frame(width: imageWidth, height: imageHeight)
	}
}

//#Preview {
//	CarouselView(images: [Movie(title: "Luck", date: .now, image: "luck", urlTrailer: "", rating: 4.4, timing: 148, responders: 53, category: "Adventure", description: """
// Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
// """, castCrew: [
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
// ])], currentIndex: .constant(1))
//}
