//
//  RecipeModel.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 8/31/21.
//

import Foundation

class RecipeModel: Decodable {
    let title: String
    let description: String
    var chef: Chef?
    var tags: [Tags]?
    var photo: Photo
    enum Field: String, CodingKey {
        case title
        case description
        case chef
        case tags
        case photo
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Field.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.chef = try container.decodeIfPresent(Chef.self, forKey: .chef)
        self.tags = try container.decodeIfPresent([Tags].self, forKey: .tags)
        self.photo = try container.decode(Photo.self, forKey: .photo)
    }
}

protocol NameFieldProtocol: Decodable {
    var name: String? {set get}
}

class Photo: Decodable {
    let sys: Sys
    var url: String?
}

class Chef: Decodable, NameFieldProtocol {
    var name: String?
    let sys: Sys?
}

//Handling tags for recipe
class Tags: Decodable, NameFieldProtocol {
    var name: String?
    let tags: Sys
    enum CodingKeys: String, CodingKey {
        case sys
        case fields
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tags  = try container.decode(Sys.self, forKey: .sys)
    }
}

//Sys Decodable
class Sys: Decodable {
    let type: String?
    let linkType: String?
    let id: String
}

//Image file detail handler
class File: Decodable {
    let fileName: String
    let url: String
}

//Image assets
class Asset: Decodable {
    let file: File
    enum AssetCodingKeys: String, CodingKey {
        case file
        case sys
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AssetCodingKeys.self)
        self.file = try container.decode(File.self, forKey: .file)
    }
}

class NameField: Decodable {
    let name: String?
}

class ItemsModel : Decodable {
    var fields : [RecipeModel] = []
    enum Items: String, CodingKey {
        case items
        case includes
        enum Field: String, CodingKey {
            case fields
            case Asset
            case Entry
        }
        enum AssetsField: String,CodingKey {
            case fields
            case sys
        }
        enum EntryField: String, CodingKey {
            case fields
            case sys
        }
    }
    
    required init(from decoder: Decoder) throws {
        //1.
        let container = try decoder.container(keyedBy: Items.self)
        //2.
        var nestedConatinerItems = try container.nestedUnkeyedContainer(forKey: .items)
        while nestedConatinerItems.isAtEnd  == false {
            let fieldContiner = try nestedConatinerItems.nestedContainer(keyedBy: Items.Field.self)
            var model = try fieldContiner.decode(RecipeModel.self, forKey: .fields)
            try self.extractAssetURLIn(container, modelItem: &model)
            try self.extractTagsIn(container, modelItem: &model)
            self.fields.append(model)
        }
    }
    
    
    /// Get url for recipe and assign it to RecipeModel photo url
    /// - Parameters:
    ///   - container: KeyedDecodingContainer
    ///   - modelItem: RecipeModel
    private func extractAssetURLIn(_ container: KeyedDecodingContainer<Items>,modelItem: inout RecipeModel) throws  {
        let nestedConatinerIncludes = try container.nestedContainer(keyedBy: Items.Field.self, forKey: .includes)
        var allItems = try nestedConatinerIncludes.nestedUnkeyedContainer(forKey: .Asset)
        while  allItems.isAtEnd  == false {
            let fieldSysContainer = try allItems.nestedContainer(keyedBy: Items.AssetsField.self)
            let photoAsset = try fieldSysContainer.decode(Asset.self, forKey:  .fields)
            let sysContainer = try fieldSysContainer.decode(Sys.self, forKey:  .sys)
            //cheeck for same id and assign image URL
            if sysContainer.id == modelItem.photo.sys.id {
                modelItem.photo.url = photoAsset.file.url
                break
            }
        }
    }
    
    /// Find chef name and names assiciated with tag for recipe
    /// - Parameters:
    ///   - container: KeyedDecodingContainer
    ///   - modelItem: RecipeModel
    private func extractTagsIn(_ container: KeyedDecodingContainer<Items>, modelItem: inout RecipeModel) throws  {
        let nestedConatinerIncludes = try container.nestedContainer(keyedBy: Items.Field.self, forKey: .includes)
        var allItems = try nestedConatinerIncludes.nestedUnkeyedContainer(forKey: .Entry)
        while  allItems.isAtEnd  == false {
            let fieldSysContainer = try allItems.nestedContainer(keyedBy: Items.EntryField.self)
            let chefAsset = try fieldSysContainer.decodeIfPresent(NameField.self, forKey:  .fields)
            let tagAsset = try fieldSysContainer.decodeIfPresent(NameField.self, forKey: .fields)
            let sysContainer = try fieldSysContainer.decode(Sys.self, forKey:  .sys)
            //1. Chef name
            if  sysContainer.id == modelItem.chef?.sys?.id, let chefName = chefAsset?.name  {
                modelItem.chef?.name = chefName
            }
            //2. Tag names
            modelItem.tags?.forEach({ ( tag) in
                if tag.tags.id == sysContainer.id, let name = tagAsset?.name  {
                    tag.name = name
                }
            })
        }
    }
}
