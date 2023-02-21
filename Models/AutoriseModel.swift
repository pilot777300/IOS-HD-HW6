

import Foundation
import RealmSwift


class Authorisation: Object {
    @Persisted var email = ""
    @Persisted var password = ""
}


