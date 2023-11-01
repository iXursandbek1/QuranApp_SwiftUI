//
//  DataModel.swift
//  QuranApp_SwiftUI
//
//  Created by Xursandbek Qambaraliyev on 22/10/23.
//

import Foundation

// MARK: - Welcome
struct DataResponse: Codable {
    let code: Int
    let status: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let surahs: [Surah]
    let edition: Edition
}

// MARK: - Edition
struct Edition: Codable {
    let identifier, language, name, englishName: String
    let format, type: String
}

// MARK: - Surah
struct Surah: Codable {
    let number: Int
    let name, englishName, englishNameTranslation: String
    let revelationType: RevelationType
    let ayahs: [Ayah]
}

// MARK: - Ayah
struct Ayah: Codable {
    let number: Int
    let text: String
    let numberInSurah, juz, manzil, page: Int
    let ruku, hizbQuarter: Int
    let sajda: SajdaUnion
}

enum SajdaUnion: Codable {
    case bool(Bool)
    case sajdaClass(SajdaClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(SajdaClass.self) {
            self = .sajdaClass(x)
            return
        }
        throw DecodingError.typeMismatch(SajdaUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SajdaUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .sajdaClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - SajdaClass
struct SajdaClass: Codable {
    let id: Int
    let recommended, obligatory: Bool
}

enum RevelationType: String, Codable {
    case meccan = "Meccan"
    case medinan = "Medinan"
}


//https://api.alquran.cloud/v1/quran/quran-uthmani


struct MockData {
    
    static let sempleSurah = Surah(number: 1,
                                   name: "ٱلۡفَاتِحَةِ",
                                   englishName: "Al-Faatiha",
                                   englishNameTranslation: "The Opening",
                                   revelationType: RevelationType.meccan,
                                   ayahs: [sempleAyah])
    
    static let sempleAyah = Ayah(number: 1,
                                 text: "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
                                 numberInSurah: 1,
                                 juz: 1,
                                 manzil: 1,
                                 page: 1,
                                 ruku: 1,
                                 hizbQuarter: 1,
                                 sajda: SajdaUnion.bool(false))
}

// MARK: - SurahWithID
struct SurahWithId: Codable, Identifiable {
    let id: Int
    let name, englishName, englishNameTranslation: String
    let revelationType: RevelationType
    let ayahs: [Ayah]
}
