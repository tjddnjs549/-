import Foundation


//https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2Cstatistics&chart=mostPopular&key=AIzaSyB4mgZGx7am_zDKQr4I75nerrwG0KFZVeE&maxResults=3&regionCode=KR
// 카테고리나 검색으로 인해 파라미터로 받을 것들: chart=mostPopular <- 인기나 다른 것들 카테고리로 쓰기 위해 , regionCode=KR <- 나라별로 카테고리



// MARK: - Welcome
struct Video: Codable {
    let items: [Item] //필수❗️
}

// MARK: - Item
struct Item: Codable {
    let id: String //id를 이용해서 영상을 보여지게 함❗️
    let snippet: Snippet
    let statistics: Statistics // viewCount, likeCount, favoriteCount, commentCount -> 필요❗️
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: Date // "2023-09-02T22:45:26Z"
    let title: String //"(PL 4R) 번리 2-5 토트넘 홋스퍼 // 2분 하이라이트 (현지해설)"
    let description: String //"*2분 하이라이트* 토트넘 홋스퍼가 23-24 시즌 4라운드 번리전 원정 경기에서 2-5 승리를 거두었습니다.\n\n#토트넘 #COYS #EPL\n\n스퍼스플레이에서 다양한 컨텐츠를 확인해보세요! ► https://bit.ly/3a9klBi \n\n토트넘 홋스퍼 공식 계정을 팔로우하세요!\nInstagram: https://www.instagram.com/spursofficial/\nTwitch: https://www.twitch.tv/tottenhamhotspur/\nTikTok: https://www.tiktok.com/@spursofficial\nTwitter: https://twitter.com/Spurs_KR\nFacebook: https://www.facebook.com/TottenhamHotspur/\n\n스퍼스 공식 앱 주소: https://www.tottenhamhotspur.com/spurs-official-app/"
    let categoryID: String // 17: 스포츠 , 23: 예능 등등
    let thumbnails: Thumbnails //사진
    let channelTitle: String //Tottenham Hotspur
    //let tags: [String] // "Spurs", "Tottenham Hotspur", "토트넘" 등등 -> 여기서는 못씀

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case title, description, thumbnails, channelTitle //, tags
        case categoryID = "categoryId"
    }
}
// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default //섬네일 사진들

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String //https://i.ytimg.com/vi/43FZXOo6oRM/maxresdefault.jpg
}

// MARK: - Statistics
struct Statistics: Codable {
    let viewCount, favoriteCount, commentCount: String //, likeCount 지움
}
func fetchDataFromAPI(completion: @escaping (Result<[Item], Error>) -> Void) {
    // Define the API endpoint URL
    let apiUrl = URL(string: "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2Cstatistics&chart=mostPopular&videoCategoryId=17&key=AIzaSyB4mgZGx7am_zDKQr4I75nerrwG0KFZVeE&maxResults=3&regionCode=KR")!

    // Create a URLSession
    let session = URLSession.shared

    // Create a data task to make the API request
    let task = session.dataTask(with: apiUrl) { data, response, error in
        // Handle potential errors
        if let error = error {
            completion(.failure(error))
            print("error!")
            return
        }

        // Ensure there is data
        guard let data = data else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            print("error!!")
            return
        }

        do {
            // Use JSONDecoder to decode the JSON data into the Welcome struct
            let decoder = JSONDecoder()
            //ate 타입의 값을 별도의 디코딩을 해주지 않으면 Double로 디코딩하기 때문에 데이터 표준에 따라서 다음의 코드를 추가⭐️⭐️⭐️
            decoder.dateDecodingStrategy = .iso8601
            let video = try decoder.decode(Video.self, from: data)

            // Call the completion handler with the parsed data
            completion(.success(video.items))
        } catch {
            // Handle JSON decoding errors
            completion(.failure(error))
            print("error!!!")
        }
    }

    // Start the data task
    task.resume()
}


fetchDataFromAPI { result in
    switch result {
    case .success(let welcome):
        // Handle the parsed data (e.g., access properties of the Welcome struct)
        dump("\(welcome)")
    case .failure(let error):
        // Handle errors (e.g., network error, JSON decoding error)
        print("Error: \(error)")
        print("error!!!!")
    }
}





//// MARK: - Welcome
//struct Welcome: Codable {
//    let kind, etag: String
//    let items: [Item]
//    let nextPageToken: String
//    let pageInfo: PageInfo
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let kind, etag, id: String
//    let snippet: Snippet
//    let statistics: Statistics
//}
//
//// MARK: - Snippet
//struct Snippet: Codable {
//    let publishedAt: Date
//    let channelID, title, description: String
//    let thumbnails: Thumbnails
//    let channelTitle: String
//    let tags: [String]
//    let categoryID, liveBroadcastContent: String
//    let localized: Localized
//    let defaultAudioLanguage: String
//
//    enum CodingKeys: String, CodingKey {
//        case publishedAt
//        case channelID = "channelId"
//        case title, description, thumbnails, channelTitle, tags
//        case categoryID = "categoryId"
//        case liveBroadcastContent, localized, defaultAudioLanguage
//    }
//}
//
//// MARK: - Localized
//struct Localized: Codable {
//    let title, description: String
//}
//
//// MARK: - Thumbnails
//struct Thumbnails: Codable {
//    let thumbnailsDefault, medium, high, standard: Default
//    let maxres: Default
//
//    enum CodingKeys: String, CodingKey {
//        case thumbnailsDefault = "default"
//        case medium, high, standard, maxres
//    }
//}
//
//// MARK: - Default
//struct Default: Codable {
//    let url: String
//    let width, height: Int
//}
//
//// MARK: - Statistics
//struct Statistics: Codable {
//    let viewCount, likeCount, favoriteCount, commentCount: String
//}
//
//// MARK: - PageInfo
//struct PageInfo: Codable {
//    let totalResults, resultsPerPage: Int
//}
