//
//  OwlleryTests.swift
//  OwlleryTests
//
//  Created by Nathalia Cardoso on 21/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import XCTest
@testable import Owllery

// swiftlint:disable trailing_whitespace

class OwlleryTests: XCTestCase {
    
    func test_loaderJson_save_json() {
        //given
        let sut = LoaderJson()
        let album = AlbumModel(name: "teste", albumImage: nil, collectionImages: [])
        
        //when
        sut.save(update: [album])
        let albuns = sut.load()
        
        //then
        XCTAssert(albuns?[0].name == album.name)
        
    }
    
    func test_NewAlbumViewController_setUpAlbumImage() {
        //given
        let sut = NewAlbumViewController()
        
        //then
        XCTAssertNoThrow(sut.setUpAlbumImage())
    }
    
    func test_NewAlbumViewController_setUpNameLabel() {
        //given
        let sut = NewAlbumViewController()
        
        //then
        XCTAssertNoThrow(sut.setUpNameLabel())
    }
    
    func test_NewAlbumViewController_convertAssetToImages() {
        //given
        let sut = NewAlbumViewController()
        
        //then
        XCTAssertNoThrow(sut.convertAssetToImages())
    }
    
    func test_GalleryTableViewCell_setAlbum() {
        //given
        let sut = GalleryTableViewCell()
        
        //then
        XCTAssertNoThrow(sut.set(album: AlbumModel(name: "", albumImage: nil, collectionImages: [])))
    }

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            APIManager().getData { (result) in
//                switch result {
//                case .success(let apiPhotos):
//                    XCTAssertNotNil(apiPhotos)
//                case .failure(let error):
//                    XCTAssertNotNil(error)
//                }
//            }
//        }
//    }

}
