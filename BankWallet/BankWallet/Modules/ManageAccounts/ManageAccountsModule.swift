protocol IManageAccountsView: class {
    func showDoneButton()
    func show(error: Error)
    func reload()
    func showCreateConfirmation(predefinedAccountType: IPredefinedAccountType)
    func showSuccess()
}

protocol IManageAccountsViewDelegate {
    func viewDidLoad()
    var itemsCount: Int { get }
    func item(index: Int) -> ManageAccountViewItem

    func didTapUnlink(index: Int)
    func didTapBackup(index: Int)
    func didTapShowKey(index: Int)
    func didTapCreate(index: Int)
    func didTapRestore(index: Int)

    func didConfirmCreate(predefinedAccountType: IPredefinedAccountType)

    func didTapDone()
}

protocol IManageAccountsInteractor {
    var predefinedAccountTypes: [IPredefinedAccountType] { get }
    func account(predefinedAccountType: IPredefinedAccountType) -> Account?
    func createAccount(predefinedAccountType: IPredefinedAccountType) throws
    func restoreAccount(accountType: AccountType, syncMode: SyncMode?)
}

protocol IManageAccountsInteractorDelegate: class {
    func didUpdateAccounts()
}

protocol IManageAccountsRouter {
    func showUnlink(account: Account)
    func showBackup(account: Account)
    func showKey(account: Account)
    func showRestore(defaultAccountType: DefaultAccountType, delegate: IRestoreAccountTypeDelegate)
    func close()
}

struct ManageAccountItem {
    let predefinedAccountType: IPredefinedAccountType
    let account: Account?
}

struct ManageAccountViewItem {
    let title: String
    let coinCodes: String
    let state: ManageAccountViewItemState
}

enum ManageAccountViewItemState {
    case linked(backedUp: Bool)
    case notLinked
}