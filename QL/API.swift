//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LoadContactsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query LoadContacts {
      allContacts {
        __typename
        ...ContactDetails
      }
    }
    """

  public let operationName = "LoadContacts"

  public var queryDocument: String { return operationDefinition.appending(ContactDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allContacts", type: .nonNull(.list(.nonNull(.object(AllContact.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allContacts: [AllContact]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allContacts": allContacts.map { (value: AllContact) -> ResultMap in value.resultMap }])
    }

    public var allContacts: [AllContact] {
      get {
        return (resultMap["allContacts"] as! [ResultMap]).map { (value: ResultMap) -> AllContact in AllContact(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllContact) -> ResultMap in value.resultMap }, forKey: "allContacts")
      }
    }

    public struct AllContact: GraphQLSelectionSet {
      public static let possibleTypes = ["Contact"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ContactDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, number: Int? = nil, createdAt: String, updatedAt: String) {
        self.init(unsafeResultMap: ["__typename": "Contact", "id": id, "name": name, "number": number, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var contactDetails: ContactDetails {
          get {
            return ContactDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class EditNameMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation EditName($id: ID!, $name: String!) {
      updateContact(id: $id, name: $name) {
        __typename
        name
      }
    }
    """

  public let operationName = "EditName"

  public var id: GraphQLID
  public var name: String

  public init(id: GraphQLID, name: String) {
    self.id = id
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateContact", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name")], type: .object(UpdateContact.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateContact: UpdateContact? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateContact": updateContact.flatMap { (value: UpdateContact) -> ResultMap in value.resultMap }])
    }

    public var updateContact: UpdateContact? {
      get {
        return (resultMap["updateContact"] as? ResultMap).flatMap { UpdateContact(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateContact")
      }
    }

    public struct UpdateContact: GraphQLSelectionSet {
      public static let possibleTypes = ["Contact"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Contact", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class EditNumberMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation EditNumber($id: ID!, $number: Int!) {
      updateContact(id: $id, number: $number) {
        __typename
        number
      }
    }
    """

  public let operationName = "EditNumber"

  public var id: GraphQLID
  public var number: Int

  public init(id: GraphQLID, number: Int) {
    self.id = id
    self.number = number
  }

  public var variables: GraphQLMap? {
    return ["id": id, "number": number]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateContact", arguments: ["id": GraphQLVariable("id"), "number": GraphQLVariable("number")], type: .object(UpdateContact.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateContact: UpdateContact? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateContact": updateContact.flatMap { (value: UpdateContact) -> ResultMap in value.resultMap }])
    }

    public var updateContact: UpdateContact? {
      get {
        return (resultMap["updateContact"] as? ResultMap).flatMap { UpdateContact(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateContact")
      }
    }

    public struct UpdateContact: GraphQLSelectionSet {
      public static let possibleTypes = ["Contact"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("number", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(number: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Contact", "number": number])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var number: Int? {
        get {
          return resultMap["number"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "number")
        }
      }
    }
  }
}

public struct ContactDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment ContactDetails on Contact {
      __typename
      id
      name
      number
      createdAt
      updatedAt
    }
    """

  public static let possibleTypes = ["Contact"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("number", type: .scalar(Int.self)),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
    GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, number: Int? = nil, createdAt: String, updatedAt: String) {
    self.init(unsafeResultMap: ["__typename": "Contact", "id": id, "name": name, "number": number, "createdAt": createdAt, "updatedAt": updatedAt])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var number: Int? {
    get {
      return resultMap["number"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "number")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var updatedAt: String {
    get {
      return resultMap["updatedAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "updatedAt")
    }
  }
}
