//: [Previous](@previous)

import Foundation

    protocol FileManagable: {
        func isStored(atPath path: String) -> Bool
        func readData(atPath path: String) -> Data?
    }

  class MyFileManager: FileManagable {
       static let shared = MyFileManager()

       func isStored(atPath path: String) -> Bool {
           return FileManager.default.fileExists(atPath: path)
       }
       func readData(atPath path: String) -> Data? {
           return try? Data(contentsOf: URL(fileURLWithPath: path))
       }
  }

  class SomeViewModel {
      
      let fileManager: FileManagable
      
      init(fileManager: FileManagable) {
          self.fileManager = fileManager
      }
      
      func getCachedData() -> Data? {
          let path = "xxxxx"

          if MyFileManager.shared.isStored(atPath: path) {
              return MyFileManager.shared.readData(atPath: path)
          } else {
              return nil
          }
      }
  }

  class TestSomeViewModel: XCTestCase {
      func testGetCachedData() {
          let viewModel = SomeViewModel()

          // How can we reach code coverage of 100% for SomeViewModel.getCachedData() method?
      }
  }
