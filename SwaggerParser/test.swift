struct AccountOption: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
    let accountId: String
    let status: AccountOptionStatus?
}

extension AccountOption: Equatable { }

enum AccountOptionStatus: String, Codable {
    case available
    case unavailableLimitReached
}

struct ActionReason: Codable {
    let sort: Int
    let confirmDialogMessage: String?
    let confirmDialogTitle: String?
    let id: String
    let title: String
    let confirmDialogPrimaryButton: String?
    let showConfirmDialog: Bool
}

extension ActionReason: Equatable { }

struct ActionsResponse: Codable {
    let actionReasons: [ActionReason]
}

extension ActionsResponse: Equatable { }

struct BaseModel: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
}

extension BaseModel: Equatable { }

import Foundation

struct Card: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
    let canShowCardSettings: Bool?
    let canClose: Bool?
    let canUnfreeze: Bool?
    let canRename: Bool?
    let canEnrollXPay: Bool?
    let canShowCardNotDelivered: Bool?
    let canShowPin: Bool?
    let canFreeze: Bool?
    let canReplace: Bool?
    let canShowInformation: Bool?
    let canShowEstimatedDelivery: Bool?
    let canShowAccount: Bool?
    let schemeIconUrl: String?
    let colorIconUrl: String?
    /// color in HEX format
    let textColor: String?
    /// color in HEX format
    let backgroundColorStart: String?
    let backgroundUrl: String?
    /// color in HEX format
    let backgroundColorEnd: String?
    let iconUrl: String?
    /// An ISO8601 timestamp
    let shippedDate: Date?
    /// An ISO8601 timestamp
    let expectedDate: Date?
    /// An ISO8601 timestamp
    let orderedDate: Date?
    /// An ISO8601 timestamp
    let todayDate: Date?
    let name: String?
    let deliveryAddress: String?
    let accountId: String?
    let type: CardType?
    let panLast4: String?
    let deliveryName: String?
    /// An ISO8601 timestamp
    let expiryDate: Date?
    let cardHolderName: String?
    let maskedPan: String?
    let status: CardStatus?

    enum CodingKeys: String, CodingKey {
        case sort
        case id
        case deleted
        case updated
        case canShowCardSettings
        case canClose
        case canUnfreeze
        case canRename
        case canEnrollXPay
        case canShowCardNotDelivered
        case canShowPin
        case canFreeze
        case canReplace
        case canShowInformation
        case canShowEstimatedDelivery
        case canShowAccount
        case schemeIconUrl
        case colorIconUrl
        case textColor
        case backgroundColorStart
        case backgroundUrl
        case backgroundColorEnd
        case iconUrl
        case shippedDate
        case expectedDate
        case orderedDate
        case todayDate
        case name
        case deliveryAddress
        case accountId
        case type
        case panLast4
        case deliveryName
        case expiryDate
        case cardHolderName
        case maskedPan
        case status
    }

    init(from decoder: Decoder) throws {
        let iso8601DateFormatter = ISO8601DateFormatter()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sort = try container.decode(Int.self, forKey: .sort)
        self.id = try container.decode(String.self, forKey: .id)
        self.deleted = try container.decode(Bool.self, forKey: .deleted)
        self.updated = try container.decode(Int64.self, forKey: .updated)
        self.canShowCardSettings = try container.decodeIfPresent(Bool.self, forKey: .canShowCardSettings)
        self.canClose = try container.decodeIfPresent(Bool.self, forKey: .canClose)
        self.canUnfreeze = try container.decodeIfPresent(Bool.self, forKey: .canUnfreeze)
        self.canRename = try container.decodeIfPresent(Bool.self, forKey: .canRename)
        self.canEnrollXPay = try container.decodeIfPresent(Bool.self, forKey: .canEnrollXPay)
        self.canShowCardNotDelivered = try container.decodeIfPresent(Bool.self, forKey: .canShowCardNotDelivered)
        self.canShowPin = try container.decodeIfPresent(Bool.self, forKey: .canShowPin)
        self.canFreeze = try container.decodeIfPresent(Bool.self, forKey: .canFreeze)
        self.canReplace = try container.decodeIfPresent(Bool.self, forKey: .canReplace)
        self.canShowInformation = try container.decodeIfPresent(Bool.self, forKey: .canShowInformation)
        self.canShowEstimatedDelivery = try container.decodeIfPresent(Bool.self, forKey: .canShowEstimatedDelivery)
        self.canShowAccount = try container.decodeIfPresent(Bool.self, forKey: .canShowAccount)
        self.schemeIconUrl = try container.decodeIfPresent(String.self, forKey: .schemeIconUrl)
        self.colorIconUrl = try container.decodeIfPresent(String.self, forKey: .colorIconUrl)
        self.textColor = try container.decodeIfPresent(String.self, forKey: .textColor)
        self.backgroundColorStart = try container.decodeIfPresent(String.self, forKey: .backgroundColorStart)
        self.backgroundUrl = try container.decodeIfPresent(String.self, forKey: .backgroundUrl)
        self.backgroundColorEnd = try container.decodeIfPresent(String.self, forKey: .backgroundColorEnd)
        self.iconUrl = try container.decodeIfPresent(String.self, forKey: .iconUrl)
        if let shippedDateString = try container.decodeIfPresent(String.self, forKey: .shippedDate) {
            self.shippedDate = iso8601DateFormatter.date(from: shippedDateString)
        } else {
            self.shippedDate = nil
        }
        if let expectedDateString = try container.decodeIfPresent(String.self, forKey: .expectedDate) {
            self.expectedDate = iso8601DateFormatter.date(from: expectedDateString)
        } else {
            self.expectedDate = nil
        }
        if let orderedDateString = try container.decodeIfPresent(String.self, forKey: .orderedDate) {
            self.orderedDate = iso8601DateFormatter.date(from: orderedDateString)
        } else {
            self.orderedDate = nil
        }
        if let todayDateString = try container.decodeIfPresent(String.self, forKey: .todayDate) {
            self.todayDate = iso8601DateFormatter.date(from: todayDateString)
        } else {
            self.todayDate = nil
        }
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.deliveryAddress = try container.decodeIfPresent(String.self, forKey: .deliveryAddress)
        self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
        self.type = try container.decodeIfPresent(CardType.self, forKey: .type)
        self.panLast4 = try container.decodeIfPresent(String.self, forKey: .panLast4)
        self.deliveryName = try container.decodeIfPresent(String.self, forKey: .deliveryName)
        if let expiryDateString = try container.decodeIfPresent(String.self, forKey: .expiryDate) {
            self.expiryDate = iso8601DateFormatter.date(from: expiryDateString)
        } else {
            self.expiryDate = nil
        }
        self.cardHolderName = try container.decodeIfPresent(String.self, forKey: .cardHolderName)
        self.maskedPan = try container.decodeIfPresent(String.self, forKey: .maskedPan)
        self.status = try container.decodeIfPresent(CardStatus.self, forKey: .status)
    }

    func encode(to encoder: Encoder) throws {
        let iso8601DateFormatter = ISO8601DateFormatter()
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sort, forKey: .sort)
        try container.encode(id, forKey: .id)
        try container.encode(deleted, forKey: .deleted)
        try container.encode(updated, forKey: .updated)
        try container.encodeIfPresent(canShowCardSettings, forKey: .canShowCardSettings)
        try container.encodeIfPresent(canClose, forKey: .canClose)
        try container.encodeIfPresent(canUnfreeze, forKey: .canUnfreeze)
        try container.encodeIfPresent(canRename, forKey: .canRename)
        try container.encodeIfPresent(canEnrollXPay, forKey: .canEnrollXPay)
        try container.encodeIfPresent(canShowCardNotDelivered, forKey: .canShowCardNotDelivered)
        try container.encodeIfPresent(canShowPin, forKey: .canShowPin)
        try container.encodeIfPresent(canFreeze, forKey: .canFreeze)
        try container.encodeIfPresent(canReplace, forKey: .canReplace)
        try container.encodeIfPresent(canShowInformation, forKey: .canShowInformation)
        try container.encodeIfPresent(canShowEstimatedDelivery, forKey: .canShowEstimatedDelivery)
        try container.encodeIfPresent(canShowAccount, forKey: .canShowAccount)
        try container.encodeIfPresent(schemeIconUrl, forKey: .schemeIconUrl)
        try container.encodeIfPresent(colorIconUrl, forKey: .colorIconUrl)
        try container.encodeIfPresent(textColor, forKey: .textColor)
        try container.encodeIfPresent(backgroundColorStart, forKey: .backgroundColorStart)
        try container.encodeIfPresent(backgroundUrl, forKey: .backgroundUrl)
        try container.encodeIfPresent(backgroundColorEnd, forKey: .backgroundColorEnd)
        try container.encodeIfPresent(iconUrl, forKey: .iconUrl)
        if let shippedDate = shippedDate {
            let shippedDateString = iso8601DateFormatter.string(from: shippedDate)
            try container.encode(shippedDateString, forKey: .shippedDate)
        }
        if let expectedDate = expectedDate {
            let expectedDateString = iso8601DateFormatter.string(from: expectedDate)
            try container.encode(expectedDateString, forKey: .expectedDate)
        }
        if let orderedDate = orderedDate {
            let orderedDateString = iso8601DateFormatter.string(from: orderedDate)
            try container.encode(orderedDateString, forKey: .orderedDate)
        }
        if let todayDate = todayDate {
            let todayDateString = iso8601DateFormatter.string(from: todayDate)
            try container.encode(todayDateString, forKey: .todayDate)
        }
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(deliveryAddress, forKey: .deliveryAddress)
        try container.encodeIfPresent(accountId, forKey: .accountId)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(panLast4, forKey: .panLast4)
        try container.encodeIfPresent(deliveryName, forKey: .deliveryName)
        if let expiryDate = expiryDate {
            let expiryDateString = iso8601DateFormatter.string(from: expiryDate)
            try container.encode(expiryDateString, forKey: .expiryDate)
        }
        try container.encodeIfPresent(cardHolderName, forKey: .cardHolderName)
        try container.encodeIfPresent(maskedPan, forKey: .maskedPan)
        try container.encodeIfPresent(status, forKey: .status)
    }
}

extension Card: Equatable { }

struct CardActions: Codable {
    let canShowCardSettings: Bool?
    let canClose: Bool?
    let canUnfreeze: Bool?
    let canRename: Bool?
    let canEnrollXPay: Bool?
    let canShowCardNotDelivered: Bool?
    let canShowPin: Bool?
    let canFreeze: Bool?
    let canReplace: Bool?
    let canShowInformation: Bool?
    let canShowEstimatedDelivery: Bool?
    let canShowAccount: Bool?
}

extension CardActions: Equatable { }

import Foundation

struct CardDelivery: Codable {
    /// An ISO8601 timestamp
    let shippedDate: Date?
    /// An ISO8601 timestamp
    let expectedDate: Date?
    /// An ISO8601 timestamp
    let orderedDate: Date?
    /// An ISO8601 timestamp
    let todayDate: Date?

    enum CodingKeys: String, CodingKey {
        case shippedDate
        case expectedDate
        case orderedDate
        case todayDate
    }

    init(from decoder: Decoder) throws {
        let iso8601DateFormatter = ISO8601DateFormatter()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let shippedDateString = try container.decodeIfPresent(String.self, forKey: .shippedDate) {
            self.shippedDate = iso8601DateFormatter.date(from: shippedDateString)
        } else {
            self.shippedDate = nil
        }
        if let expectedDateString = try container.decodeIfPresent(String.self, forKey: .expectedDate) {
            self.expectedDate = iso8601DateFormatter.date(from: expectedDateString)
        } else {
            self.expectedDate = nil
        }
        if let orderedDateString = try container.decodeIfPresent(String.self, forKey: .orderedDate) {
            self.orderedDate = iso8601DateFormatter.date(from: orderedDateString)
        } else {
            self.orderedDate = nil
        }
        if let todayDateString = try container.decodeIfPresent(String.self, forKey: .todayDate) {
            self.todayDate = iso8601DateFormatter.date(from: todayDateString)
        } else {
            self.todayDate = nil
        }
    }

    func encode(to encoder: Encoder) throws {
        let iso8601DateFormatter = ISO8601DateFormatter()
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let shippedDate = shippedDate {
            let shippedDateString = iso8601DateFormatter.string(from: shippedDate)
            try container.encode(shippedDateString, forKey: .shippedDate)
        }
        if let expectedDate = expectedDate {
            let expectedDateString = iso8601DateFormatter.string(from: expectedDate)
            try container.encode(expectedDateString, forKey: .expectedDate)
        }
        if let orderedDate = orderedDate {
            let orderedDateString = iso8601DateFormatter.string(from: orderedDate)
            try container.encode(orderedDateString, forKey: .orderedDate)
        }
        if let todayDate = todayDate {
            let todayDateString = iso8601DateFormatter.string(from: todayDate)
            try container.encode(todayDateString, forKey: .todayDate)
        }
    }
}

extension CardDelivery: Equatable { }

struct CardDesign: Codable {
    let schemeIconUrl: String?
    let colorIconUrl: String?
    /// color in HEX format
    let textColor: String?
    /// color in HEX format
    let backgroundColorStart: String?
    let backgroundUrl: String?
    /// color in HEX format
    let backgroundColorEnd: String?
    let iconUrl: String?
}

extension CardDesign: Equatable { }

struct CardOption: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
    let schemeIconUrl: String?
    let colorIconUrl: String?
    /// color in HEX format
    let textColor: String?
    /// color in HEX format
    let backgroundColorStart: String?
    let backgroundUrl: String?
    /// color in HEX format
    let backgroundColorEnd: String?
    let iconUrl: String?
    let type: CardType?
    let name: String?
    let status: CardOptionStatus?
    let currency: String?
    let price: Double?
}

extension CardOption: Equatable { }

enum CardOptionStatus: String, Codable {
    case available
    case unavailableLimitReached
    case unavailableComingSoon
    case unavailableRequiresPremium
}

struct CardResponse: Codable {
    let card: Card
}

extension CardResponse: Equatable { }

enum CardStatus: String, Codable {
    case active
    case frozen
    case blocked
    case deleted
}

enum CardType: String, Codable {
    case physical
    case virtual
}

struct Challenge: Codable {
    /// The challenge id
    let id: String
    /// The challenge provider
    let provider: String
}

extension Challenge: Equatable { }

struct DeliveryOption: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
    let title: String?
    let currency: String
    let price: Double
    let subtitle: String?
}

extension DeliveryOption: Equatable { }

/// Error object
struct ErrorViewModel: Codable {
    /// Message
    let message: String?
    let challenge: Challenge?
    /// Display message
    let reasonDisplayMessage: String?
    /// A reason code
    let reasonCode: String?
}

extension ErrorViewModel: Equatable { }

struct GetCardsResponse: Codable {
    let cards: [Card]
}

extension GetCardsResponse: Equatable { }

struct GetOrderResponse: Codable {
    let orderOption: OrderOption?
}

extension GetOrderResponse: Equatable { }

struct GetPINConfigResponse: Codable {
    /// Comes in HEX format, used to encrypt transportKey
    let publicKey: String
    /// Formatted in PKIX HEX format, used to encrypt transportKey
    let publicKeyPKIX: String
}

extension GetPINConfigResponse: Equatable { }

struct GetReplaceOrderResponse: Codable {
    let orderOption: ReplaceOrderOption?
}

extension GetReplaceOrderResponse: Equatable { }

struct GetWalletTokensResponse: Codable {
    let tokens: [WalletToken]
}

extension GetWalletTokensResponse: Equatable { }

struct OrderOption: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
    let deliveryOptions: [DeliveryOption]
    let cardOptions: [CardOption]
    let deliveryName: String?
    let accountOptions: [AccountOption]?
    let deliveryAddress: String?
}

extension OrderOption: Equatable { }

struct PatchCardName: Codable {
    let name: String
}

extension PatchCardName: Equatable { }

struct PostApplePayEnrollRequest: Codable {
    let applePublicCert: String
    let nonce: String
    let nonceSignature: String
}

extension PostApplePayEnrollRequest: Equatable { }

struct PostApplePayEnrollResponse: Codable {
    let activationData: String?
    let payload: String?
    let countryCode: String?
    let address: String?
    let name: String?
    let postalCode: String?
    let city: String?
    let phoneNumber: String?
}

extension PostApplePayEnrollResponse: Equatable { }

struct PostCardImageRequest: Codable {
    /// A uniq uuidv4 for each card image request
    let requestId: String
}

extension PostCardImageRequest: Equatable { }

struct PostCardImageResponse: Codable {
    let cardImageId: String?
    let javascriptURL: String?
}

extension PostCardImageResponse: Equatable { }

struct PostGooglePayEnrollRequest: Codable {
    let deviceId: String
    let walletAccountId: String
}

extension PostGooglePayEnrollRequest: Equatable { }

struct PostGooglePayEnrollResponse: Codable {
    let payload: String?
    let name: String?
    let phoneNumber: String?
    let postalCode: String?
    let address: String?
    let countryCode: String?
    let city: String?
    let activationData: String?
}

extension PostGooglePayEnrollResponse: Equatable { }

struct PostOrderRequest: Codable {
    let currency: String
    let accountId: String?
    let totalOrderAmount: Double
    let deliveryOptionId: String?
    let requestId: String
    let pinId: String?
    let cardOptionId: String
}

extension PostOrderRequest: Equatable { }

struct PostPINGetRequest: Codable {
    let encryptedTransportKey: String
}

extension PostPINGetRequest: Equatable { }

struct PostPinGetResponse: Codable {
    let encryptedPinBlock: String
}

extension PostPinGetResponse: Equatable { }

struct PostPinNewRequest: Codable {
    let encryptedTransportKey: String
    let encryptedPinBlock: String
}

extension PostPinNewRequest: Equatable { }

struct PostPinNewResponse: Codable {
    let pinId: String
}

extension PostPinNewResponse: Equatable { }

struct PostReplaceOrderRequest: Codable {
    let currency: String
    let reasonId: String
    let requestId: String
    let deliveryOptionId: String
    let pinId: String
    let totalOrderAmount: Double
}

extension PostReplaceOrderRequest: Equatable { }

struct ReasonIdRequest: Codable {
    let reasonId: String
}

extension ReasonIdRequest: Equatable { }

struct ReplaceOrderOption: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
    let deliveryName: String?
    let deliveryAddress: String?
    let price: Double?
    let currency: String?
    let deliveryOptions: [DeliveryOption]
}

extension ReplaceOrderOption: Equatable { }

struct WalletToken: Codable {
    let sort: Int
    let id: String
    let deleted: Bool
    let updated: Int64
    let status: String
    let refId: String
    let cardId: String
}

extension WalletToken: Equatable { }
