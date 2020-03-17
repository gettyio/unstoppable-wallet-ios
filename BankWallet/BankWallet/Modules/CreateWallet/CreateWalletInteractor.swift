class CreateWalletInteractor {
    private let appConfigProvider: IAppConfigProvider
    private let accountCreator: IAccountCreator
    private let accountManager: IAccountManager
    private let walletManager: IWalletManager
    private let coinSettingsManager: IBlockchainSettingsManager

    init(appConfigProvider: IAppConfigProvider, accountCreator: IAccountCreator, accountManager: IAccountManager, walletManager: IWalletManager, coinSettingsManager: IBlockchainSettingsManager) {
        self.appConfigProvider = appConfigProvider
        self.accountCreator = accountCreator
        self.accountManager = accountManager
        self.walletManager = walletManager
        self.coinSettingsManager = coinSettingsManager
    }

}

extension CreateWalletInteractor: ICreateWalletInteractor {

    var coins: [Coin] {
        appConfigProvider.coins
    }

    var featuredCoins: [Coin] {
        appConfigProvider.featuredCoins
    }

    func account(predefinedAccountType: PredefinedAccountType) throws -> Account {
        try accountCreator.newAccount(predefinedAccountType: predefinedAccountType)
    }

    func create(accounts: [Account]) {
        for account in accounts {
            accountManager.save(account: account)
        }
    }

    func save(wallets: [Wallet]) {
        walletManager.save(wallets: wallets)
    }

    func save(settings: [BlockchainSetting]) {
        coinSettingsManager.save(settings: settings)
    }

    func blockchainSettings(coinType: CoinType) -> BlockchainSetting? {
        coinSettingsManager.settingsForCreate(coinType: coinType)
    }

}
