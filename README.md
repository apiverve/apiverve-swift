# APIVerve Swift SDK

Swift clients for the [APIVerve](https://apiverve.com?utm_source=swiftpm&utm_medium=referral&utm_content=readme) catalog of 387 APIs: email and phone validation, IP, DNS and SSL lookups, exchange and VAT rates, VIN decoding, document conversion and more. One package, one library product per API, so your app only compiles the APIs it uses.

![Platform](https://img.shields.io/badge/Platform-iOS%2015%2B%20%7C%20macOS%2012%2B-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.7+-orange.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

## Installation

In Xcode, choose **File > Add Package Dependencies**, enter `https://github.com/apiverve/apiverve-swift`, and pick the products you need.

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/apiverve/apiverve-swift", from: "1.2.3"),
],
targets: [
    .target(name: "MyApp", dependencies: [
        .product(name: "APIVerveEmailValidator", package: "apiverve-swift"),
    ]),
]
```

## Quick start

Get a free API key at [dashboard.apiverve.com](https://dashboard.apiverve.com?utm_source=swiftpm&utm_medium=referral&utm_content=readme), then:

```swift
import APIVerveEmailValidator

let client = EmailValidatorAPIClient(apiKey: "YOUR_API_KEY")
let response = try await client.execute(parameters: ["email": "support@apiverve.com"])
print(response.data?.mapValues { $0.value } ?? [:])
```

Every client has the same shape: `execute(parameters:)` with async/await or a completion handler, returning an `APIResponse` whose `data` holds the API's result. Errors are thrown as `APIVerveError`, with `statusCode`, `isAuthenticationError` and `isRateLimitError` helpers.

The shared types (`APIResponse`, `APIVerveValue`, `APIVerveError`) live in the `APIVerveCore` product. Every API product depends on it and re-exports it, so `import APIVerveEmailValidator` is all you need, and importing several APIs never makes those names ambiguous.

## APIs

| API | Product | Client |
| --- | --- | --- |
| [Acronym Expander](https://apiverve.com/marketplace/acronymexpander?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAcronymExpander` | `AcronymExpanderAPIClient` |
| [Acronym Generator](https://apiverve.com/marketplace/acronymgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAcronymGenerator` | `AcronymGeneratorAPIClient` |
| [Acrostic Puzzle Generator](https://apiverve.com/marketplace/acrostic?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAcrosticPuzzleGenerator` | `AcrosticPuzzleGeneratorAPIClient` |
| [Advice Generator](https://apiverve.com/marketplace/advice?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAdviceGenerator` | `AdviceGeneratorAPIClient` |
| [Age Calculator](https://apiverve.com/marketplace/agecalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAgeCalculator` | `AgeCalculatorAPIClient` |
| [Airline Lookup](https://apiverve.com/marketplace/airlinelookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAirlineLookup` | `AirlineLookupAPIClient` |
| [Airport Code Converter](https://apiverve.com/marketplace/airportcodeconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAirportCodeConverter` | `AirportCodeConverterAPIClient` |
| [Airport Distance](https://apiverve.com/marketplace/airportdistance?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAirportDistance` | `AirportDistanceAPIClient` |
| [Airports Lookup](https://apiverve.com/marketplace/airports?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAirportsLookup` | `AirportsLookupAPIClient` |
| [Air Quality](https://apiverve.com/marketplace/airquality?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAirQuality` | `AirQualityAPIClient` |
| [Anagram Detector](https://apiverve.com/marketplace/anagramdetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAnagramDetector` | `AnagramDetectorAPIClient` |
| [Anagram Puzzle Generator](https://apiverve.com/marketplace/anagrampuzzle?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAnagramPuzzleGenerator` | `AnagramPuzzleGeneratorAPIClient` |
| [Antonym Finder](https://apiverve.com/marketplace/antonym?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveAntonymFinder` | `AntonymFinderAPIClient` |
| [Article Ideas Generator](https://apiverve.com/marketplace/articleideas?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveArticleIdeasGenerator` | `ArticleIdeasGeneratorAPIClient` |
| [ASCII85 Encoder](https://apiverve.com/marketplace/ascii85encoder?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveASCII85Encoder` | `ASCII85EncoderAPIClient` |
| [ASN Lookup](https://apiverve.com/marketplace/asnlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveASNLookup` | `ASNLookupAPIClient` |
| [Baby Name Generator](https://apiverve.com/marketplace/babynamegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBabyNameGenerator` | `BabyNameGeneratorAPIClient` |
| [Background Remover](https://apiverve.com/marketplace/backgroundremover?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBackgroundRemover` | `BackgroundRemoverAPIClient` |
| [Balance Sheet](https://apiverve.com/marketplace/balancesheet?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBalanceSheet` | `BalanceSheetAPIClient` |
| [Barcode Generator](https://apiverve.com/marketplace/barcodegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBarcodeGenerator` | `BarcodeGeneratorAPIClient` |
| [Barcode Reader](https://apiverve.com/marketplace/barcodereader?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBarcodeReader` | `BarcodeReaderAPIClient` |
| [Base64 Encoder/Decoder](https://apiverve.com/marketplace/base64?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBase64EncoderDecoder` | `Base64EncoderDecoderAPIClient` |
| [Benchmark Rate](https://apiverve.com/marketplace/benchmarkrate?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBenchmarkRate` | `BenchmarkRateAPIClient` |
| [Bible](https://apiverve.com/marketplace/bible?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBible` | `BibleAPIClient` |
| [BIMI Record Validator](https://apiverve.com/marketplace/bimivalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBIMIRecordValidator` | `BIMIRecordValidatorAPIClient` |
| [Bingo Card Generator](https://apiverve.com/marketplace/bingocardgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBingoCardGenerator` | `BingoCardGeneratorAPIClient` |
| [BIN Lookup](https://apiverve.com/marketplace/binlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBINLookup` | `BINLookupAPIClient` |
| [Birth Chart](https://apiverve.com/marketplace/birthchart?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBirthChart` | `BirthChartAPIClient` |
| [Birthstones](https://apiverve.com/marketplace/birthstones?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBirthstones` | `BirthstonesAPIClient` |
| [Bitcoin Price](https://apiverve.com/marketplace/bitcoin?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBitcoinPrice` | `BitcoinPriceAPIClient` |
| [Bluetooth Company Lookup](https://apiverve.com/marketplace/bluetoothlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBluetoothCompanyLookup` | `BluetoothCompanyLookupAPIClient` |
| [BMI Calculator](https://apiverve.com/marketplace/bmicalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBMICalculator` | `BMICalculatorAPIClient` |
| [Boggle Board Generator](https://apiverve.com/marketplace/boggleboardgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBoggleBoardGenerator` | `BoggleBoardGeneratorAPIClient` |
| [Bot Detector](https://apiverve.com/marketplace/botdetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBotDetector` | `BotDetectorAPIClient` |
| [Bucket List](https://apiverve.com/marketplace/bucketlist?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveBucketList` | `BucketListAPIClient` |
| [CAA Record Parser](https://apiverve.com/marketplace/caaparser?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCAARecordParser` | `CAARecordParserAPIClient` |
| [Captcha Generator](https://apiverve.com/marketplace/captchagenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCaptchaGenerator` | `CaptchaGeneratorAPIClient` |
| [Card Deck Shuffler](https://apiverve.com/marketplace/carddeckshuffler?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCardDeckShuffler` | `CardDeckShufflerAPIClient` |
| [Card Validator](https://apiverve.com/marketplace/cardvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCardValidator` | `CardValidatorAPIClient` |
| [Cash Flow Statement](https://apiverve.com/marketplace/cashflow?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCashFlowStatement` | `CashFlowStatementAPIClient` |
| [Charades Generator](https://apiverve.com/marketplace/charades?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCharadesGenerator` | `CharadesGeneratorAPIClient` |
| [Chart Generator](https://apiverve.com/marketplace/chartgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveChartGenerator` | `ChartGeneratorAPIClient` |
| [Chess Move Validator](https://apiverve.com/marketplace/chessmovevalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveChessMoveValidator` | `ChessMoveValidatorAPIClient` |
| [Chinese Zodiac](https://apiverve.com/marketplace/chinesezodiac?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveChineseZodiac` | `ChineseZodiacAPIClient` |
| [Chuck Norris Jokes](https://apiverve.com/marketplace/chucknorris?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveChuckNorrisJokes` | `ChuckNorrisJokesAPIClient` |
| [Cities Lookup](https://apiverve.com/marketplace/citieslookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCitiesLookup` | `CitiesLookupAPIClient` |
| [Cloud Counter](https://apiverve.com/marketplace/counter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCloudCounter` | `CloudCounterAPIClient` |
| [Cocktail Recipe](https://apiverve.com/marketplace/cocktail?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCocktailRecipe` | `CocktailRecipeAPIClient` |
| [Code Detector](https://apiverve.com/marketplace/codedetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCodeDetector` | `CodeDetectorAPIClient` |
| [Coin Flipper](https://apiverve.com/marketplace/coinflipper?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCoinFlipper` | `CoinFlipperAPIClient` |
| [Color Brightness Calculator](https://apiverve.com/marketplace/colorbrightness?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveColorBrightnessCalculator` | `ColorBrightnessCalculatorAPIClient` |
| [Color Converter](https://apiverve.com/marketplace/colorconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveColorConverter` | `ColorConverterAPIClient` |
| [Color Name Finder](https://apiverve.com/marketplace/colornamefinder?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveColorNameFinder` | `ColorNameFinderAPIClient` |
| [Color Palette Generator](https://apiverve.com/marketplace/colorpalette?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveColorPaletteGenerator` | `ColorPaletteGeneratorAPIClient` |
| [Color Similarity Calculator](https://apiverve.com/marketplace/colorsimilarity?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveColorSimilarityCalculator` | `ColorSimilarityCalculatorAPIClient` |
| [Comment Generator](https://apiverve.com/marketplace/commentgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCommentGenerator` | `CommentGeneratorAPIClient` |
| [Company Lookup](https://apiverve.com/marketplace/companylookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCompanyLookup` | `CompanyLookupAPIClient` |
| [Company Name Generator](https://apiverve.com/marketplace/companynamegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCompanyNameGenerator` | `CompanyNameGeneratorAPIClient` |
| [Compliment Generator](https://apiverve.com/marketplace/compliments?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveComplimentGenerator` | `ComplimentGeneratorAPIClient` |
| [Contact Extractor](https://apiverve.com/marketplace/contactextractor?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveContactExtractor` | `ContactExtractorAPIClient` |
| [Content Filter](https://apiverve.com/marketplace/contentfilter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveContentFilter` | `ContentFilterAPIClient` |
| [Coordinates Are Sea](https://apiverve.com/marketplace/coordinatesaresea?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCoordinatesAreSea` | `CoordinatesAreSeaAPIClient` |
| [Cost of Living](https://apiverve.com/marketplace/costliving?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCostofLiving` | `CostofLivingAPIClient` |
| [Country Borders](https://apiverve.com/marketplace/countryborders?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCountryBorders` | `CountryBordersAPIClient` |
| [Country Boundaries](https://apiverve.com/marketplace/countryboundaries?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCountryBoundaries` | `CountryBoundariesAPIClient` |
| [Country Calling Code](https://apiverve.com/marketplace/callingcode?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCountryCallingCode` | `CountryCallingCodeAPIClient` |
| [Country Flags](https://apiverve.com/marketplace/countryflags?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCountryFlags` | `CountryFlagsAPIClient` |
| [Country Languages](https://apiverve.com/marketplace/countrylanguages?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCountryLanguages` | `CountryLanguagesAPIClient` |
| [Country Lookup](https://apiverve.com/marketplace/countrylookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCountryLookup` | `CountryLookupAPIClient` |
| [County Data Lookup](https://apiverve.com/marketplace/countydata?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCountyDataLookup` | `CountyDataLookupAPIClient` |
| [CPI Inflation](https://apiverve.com/marketplace/cpiinflation?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCPIInflation` | `CPIInflationAPIClient` |
| [Cron Expression Generator](https://apiverve.com/marketplace/crongenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCronExpressionGenerator` | `CronExpressionGeneratorAPIClient` |
| [Cron Expression Parser](https://apiverve.com/marketplace/cronparser?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCronExpressionParser` | `CronExpressionParserAPIClient` |
| [Crossword Generator](https://apiverve.com/marketplace/crossword?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCrosswordGenerator` | `CrosswordGeneratorAPIClient` |
| [Cryptogram Generator](https://apiverve.com/marketplace/cryptogram?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCryptogramGenerator` | `CryptogramGeneratorAPIClient` |
| [CSR Parser](https://apiverve.com/marketplace/csrparser?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCSRParser` | `CSRParserAPIClient` |
| [CSV to JSON Converter](https://apiverve.com/marketplace/csvtojson?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCSVtoJSONConverter` | `CSVtoJSONConverterAPIClient` |
| [Cuid Generator](https://apiverve.com/marketplace/cuidgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCuidGenerator` | `CuidGeneratorAPIClient` |
| [Currency Converter](https://apiverve.com/marketplace/currencyconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCurrencyConverter` | `CurrencyConverterAPIClient` |
| [Currency Symbols](https://apiverve.com/marketplace/currencysymbols?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveCurrencySymbols` | `CurrencySymbolsAPIClient` |
| [Dad Jokes](https://apiverve.com/marketplace/dadjokes?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDadJokes` | `DadJokesAPIClient` |
| [DANE Record Validator](https://apiverve.com/marketplace/danevalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDANERecordValidator` | `DANERecordValidatorAPIClient` |
| [Data Masking](https://apiverve.com/marketplace/datamasking?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDataMasking` | `DataMaskingAPIClient` |
| [Date Calculator](https://apiverve.com/marketplace/datecalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDateCalculator` | `DateCalculatorAPIClient` |
| [Daylight Duration Calculator](https://apiverve.com/marketplace/daylightduration?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDaylightDurationCalculator` | `DaylightDurationCalculatorAPIClient` |
| [D&D Generator](https://apiverve.com/marketplace/dndgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDDGenerator` | `DDGeneratorAPIClient` |
| [Dice Roller](https://apiverve.com/marketplace/diceroller?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDiceRoller` | `DiceRollerAPIClient` |
| [Dictionary](https://apiverve.com/marketplace/dictionary?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDictionary` | `DictionaryAPIClient` |
| [Did You Mean](https://apiverve.com/marketplace/didyoumean?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDidYouMean` | `DidYouMeanAPIClient` |
| [Disposable Email Checker](https://apiverve.com/marketplace/emaildisposablechecker?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDisposableEmailChecker` | `DisposableEmailCheckerAPIClient` |
| [Disposable Phone Number Checker](https://apiverve.com/marketplace/disposablephone?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDisposablePhoneNumberChecker` | `DisposablePhoneNumberCheckerAPIClient` |
| [Distance Calculator](https://apiverve.com/marketplace/distancecalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDistanceCalculator` | `DistanceCalculatorAPIClient` |
| [Dividends](https://apiverve.com/marketplace/dividends?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDividends` | `DividendsAPIClient` |
| [DKIM Validator](https://apiverve.com/marketplace/dkimvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDKIMValidator` | `DKIMValidatorAPIClient` |
| [DMARC Validator](https://apiverve.com/marketplace/dmarcvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDMARCValidator` | `DMARCValidatorAPIClient` |
| [DNS Lookup](https://apiverve.com/marketplace/dnslookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDNSLookup` | `DNSLookupAPIClient` |
| [DNS Propagation Checker](https://apiverve.com/marketplace/dnspropagation?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDNSPropagationChecker` | `DNSPropagationCheckerAPIClient` |
| [DNSSEC Checker](https://apiverve.com/marketplace/dnsseccheck?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDNSSECChecker` | `DNSSECCheckerAPIClient` |
| [Dog Breeds](https://apiverve.com/marketplace/dogbreeds?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDogBreeds` | `DogBreedsAPIClient` |
| [Domain Age](https://apiverve.com/marketplace/domainage?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDomainAge` | `DomainAgeAPIClient` |
| [Domain and IP Pinger](https://apiverve.com/marketplace/pinger?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDomainandIPPinger` | `DomainandIPPingerAPIClient` |
| [Domain Availability](https://apiverve.com/marketplace/domainavailability?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDomainAvailability` | `DomainAvailabilityAPIClient` |
| [Domain Expiration](https://apiverve.com/marketplace/domainexpiration?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDomainExpiration` | `DomainExpirationAPIClient` |
| [DTC Lookup](https://apiverve.com/marketplace/dtclookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDTCLookup` | `DTCLookupAPIClient` |
| [Due Date Calculator](https://apiverve.com/marketplace/duedatecalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveDueDateCalculator` | `DueDateCalculatorAPIClient` |
| [Earnings Report](https://apiverve.com/marketplace/earnings?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveEarningsReport` | `EarningsReportAPIClient` |
| [Email Validator](https://apiverve.com/marketplace/emailvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveEmailValidator` | `EmailValidatorAPIClient` |
| [Emoji Decorator](https://apiverve.com/marketplace/emojidecorator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveEmojiDecorator` | `EmojiDecoratorAPIClient` |
| [Emoji Lookup](https://apiverve.com/marketplace/emoji?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveEmojiLookup` | `EmojiLookupAPIClient` |
| [Ethereum Price](https://apiverve.com/marketplace/ethereum?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveEthereumPrice` | `EthereumPriceAPIClient` |
| [Exchange Rate](https://apiverve.com/marketplace/exchangerate?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveExchangeRate` | `ExchangeRateAPIClient` |
| [Exercises](https://apiverve.com/marketplace/exercises?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveExercises` | `ExercisesAPIClient` |
| [Face Detector](https://apiverve.com/marketplace/facedetect?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFaceDetector` | `FaceDetectorAPIClient` |
| [Fibonacci Generator](https://apiverve.com/marketplace/fibonaccigenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFibonacciGenerator` | `FibonacciGeneratorAPIClient` |
| [File Size Formatter](https://apiverve.com/marketplace/filesizeformatter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFileSizeFormatter` | `FileSizeFormatterAPIClient` |
| [Fill in the Blanks Generator](https://apiverve.com/marketplace/fillintheblanks?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFillintheBlanksGenerator` | `FillintheBlanksGeneratorAPIClient` |
| [Financial Ratios](https://apiverve.com/marketplace/financialratios?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFinancialRatios` | `FinancialRatiosAPIClient` |
| [Fortune Cookie Generator](https://apiverve.com/marketplace/fortunecookie?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFortuneCookieGenerator` | `FortuneCookieGeneratorAPIClient` |
| [Fortune Teller](https://apiverve.com/marketplace/fortuneteller?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFortuneTeller` | `FortuneTellerAPIClient` |
| [Fully Qualified Domain](https://apiverve.com/marketplace/fullyqualifieddomain?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveFullyQualifiedDomain` | `FullyQualifiedDomainAPIClient` |
| [Game Character Generator](https://apiverve.com/marketplace/gamecharacter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGameCharacterGenerator` | `GameCharacterGeneratorAPIClient` |
| [Gas Prices](https://apiverve.com/marketplace/gasprices?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGasPrices` | `GasPricesAPIClient` |
| [GDP Data](https://apiverve.com/marketplace/gdp?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGDPData` | `GDPDataAPIClient` |
| [Gender Detector](https://apiverve.com/marketplace/genderdetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGenderDetector` | `GenderDetectorAPIClient` |
| [Gibberish Detector](https://apiverve.com/marketplace/gibberishdetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGibberishDetector` | `GibberishDetectorAPIClient` |
| [Global Stock Market](https://apiverve.com/marketplace/globalstockmarket?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGlobalStockMarket` | `GlobalStockMarketAPIClient` |
| [Gold Price](https://apiverve.com/marketplace/goldprice?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGoldPrice` | `GoldPriceAPIClient` |
| [Grammar Check](https://apiverve.com/marketplace/grammarcheck?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGrammarCheck` | `GrammarCheckAPIClient` |
| [Gravatar Lookup](https://apiverve.com/marketplace/gravatarlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGravatarLookup` | `GravatarLookupAPIClient` |
| [GUID Generator](https://apiverve.com/marketplace/guidgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveGUIDGenerator` | `GUIDGeneratorAPIClient` |
| [Hangman Word Generator](https://apiverve.com/marketplace/hangmanword?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHangmanWordGenerator` | `HangmanWordGeneratorAPIClient` |
| [Hash Generator](https://apiverve.com/marketplace/hashgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHashGenerator` | `HashGeneratorAPIClient` |
| [Hashtag Generator](https://apiverve.com/marketplace/hashtaggenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHashtagGenerator` | `HashtagGeneratorAPIClient` |
| [HEIC Converter](https://apiverve.com/marketplace/heicconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHEICConverter` | `HEICConverterAPIClient` |
| [Historical Events](https://apiverve.com/marketplace/historicalevents?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHistoricalEvents` | `HistoricalEventsAPIClient` |
| [HMAC Generator](https://apiverve.com/marketplace/hmac?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHMACGenerator` | `HMACGeneratorAPIClient` |
| [Horoscope](https://apiverve.com/marketplace/horoscope?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHoroscope` | `HoroscopeAPIClient` |
| [HTML Entities Encoder/Decoder](https://apiverve.com/marketplace/htmlentities?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHTMLEntitiesEncoderDecoder` | `HTMLEntitiesEncoderDecoderAPIClient` |
| [HTML to Image](https://apiverve.com/marketplace/htmltoimage?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHTMLtoImage` | `HTMLtoImageAPIClient` |
| [HTML to PDF](https://apiverve.com/marketplace/htmltopdf?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHTMLtoPDF` | `HTMLtoPDFAPIClient` |
| [HTML to Text](https://apiverve.com/marketplace/htmltotext?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHTMLtoText` | `HTMLtoTextAPIClient` |
| [HTTP Status Code Lookup](https://apiverve.com/marketplace/httpstatuslookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHTTPStatusCodeLookup` | `HTTPStatusCodeLookupAPIClient` |
| [Human Name Parser](https://apiverve.com/marketplace/humannameparser?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveHumanNameParser` | `HumanNameParserAPIClient` |
| [IBAN Validator](https://apiverve.com/marketplace/ibanvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIBANValidator` | `IBANValidatorAPIClient` |
| [I-Bond Rates](https://apiverve.com/marketplace/savingsbonds?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIBondRates` | `IBondRatesAPIClient` |
| [IFSC Lookup](https://apiverve.com/marketplace/ifsclookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIFSCLookup` | `IFSCLookupAPIClient` |
| [Image Caption](https://apiverve.com/marketplace/imagecaption?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveImageCaption` | `ImageCaptionAPIClient` |
| [Image Converter](https://apiverve.com/marketplace/imageconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveImageConverter` | `ImageConverterAPIClient` |
| [Image to Text](https://apiverve.com/marketplace/imagetotext?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveImagetoText` | `ImagetoTextAPIClient` |
| [IMEI Generator](https://apiverve.com/marketplace/imeigenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIMEIGenerator` | `IMEIGeneratorAPIClient` |
| [Income Statement](https://apiverve.com/marketplace/incomestatement?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIncomeStatement` | `IncomeStatementAPIClient` |
| [Income Tax Brackets](https://apiverve.com/marketplace/incometax?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIncomeTaxBrackets` | `IncomeTaxBracketsAPIClient` |
| [Income Tax Calculator](https://apiverve.com/marketplace/incometaxcalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIncomeTaxCalculator` | `IncomeTaxCalculatorAPIClient` |
| [Inflation Rate](https://apiverve.com/marketplace/inflation?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveInflationRate` | `InflationRateAPIClient` |
| [Initialism Generator](https://apiverve.com/marketplace/initialismgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveInitialismGenerator` | `InitialismGeneratorAPIClient` |
| [Insider Trading](https://apiverve.com/marketplace/insidertrading?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveInsiderTrading` | `InsiderTradingAPIClient` |
| [Interest Rate](https://apiverve.com/marketplace/interestrate?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveInterestRate` | `InterestRateAPIClient` |
| [Invoice Generator](https://apiverve.com/marketplace/invoicegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveInvoiceGenerator` | `InvoiceGeneratorAPIClient` |
| [IP Blacklist Lookup](https://apiverve.com/marketplace/ipblacklistlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIPBlacklistLookup` | `IPBlacklistLookupAPIClient` |
| [IP Demographics](https://apiverve.com/marketplace/ipdemographics?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIPDemographics` | `IPDemographicsAPIClient` |
| [IP Lookup](https://apiverve.com/marketplace/iplookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveIPLookup` | `IPLookupAPIClient` |
| [ISBN Validator](https://apiverve.com/marketplace/isbnvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveISBNValidator` | `ISBNValidatorAPIClient` |
| [Job Postings](https://apiverve.com/marketplace/jobpostings?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJobPostings` | `JobPostingsAPIClient` |
| [Job Search](https://apiverve.com/marketplace/jobsearch?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJobSearch` | `JobSearchAPIClient` |
| [Jobs Report](https://apiverve.com/marketplace/jobsreport?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJobsReport` | `JobsReportAPIClient` |
| [JSON Schema Generator](https://apiverve.com/marketplace/jsonschemagenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJSONSchemaGenerator` | `JSONSchemaGeneratorAPIClient` |
| [JSON Schema Validator](https://apiverve.com/marketplace/jsonschemavalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJSONSchemaValidator` | `JSONSchemaValidatorAPIClient` |
| [JSON to CSV Converter](https://apiverve.com/marketplace/jsontocsv?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJSONtoCSVConverter` | `JSONtoCSVConverterAPIClient` |
| [JSON to JSONP](https://apiverve.com/marketplace/jsontojsonp?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJSONtoJSONP` | `JSONtoJSONPAPIClient` |
| [Julian Day Calculator](https://apiverve.com/marketplace/julianday?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJulianDayCalculator` | `JulianDayCalculatorAPIClient` |
| [JWT Decoder](https://apiverve.com/marketplace/jwtdecoder?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveJWTDecoder` | `JWTDecoderAPIClient` |
| [Keyword Extractor](https://apiverve.com/marketplace/keywordextractor?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveKeywordExtractor` | `KeywordExtractorAPIClient` |
| [Language Detector](https://apiverve.com/marketplace/languagedetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLanguageDetector` | `LanguageDetectorAPIClient` |
| [Leet Speak](https://apiverve.com/marketplace/leetspeak?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLeetSpeak` | `LeetSpeakAPIClient` |
| [Levenshtein Distance](https://apiverve.com/marketplace/levenshteindistance?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLevenshteinDistance` | `LevenshteinDistanceAPIClient` |
| [Line Sorter](https://apiverve.com/marketplace/linesorter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLineSorter` | `LineSorterAPIClient` |
| [Link Scraper](https://apiverve.com/marketplace/linkscraper?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLinkScraper` | `LinkScraperAPIClient` |
| [Liturgical Calendar](https://apiverve.com/marketplace/liturgicalcalendar?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLiturgicalCalendar` | `LiturgicalCalendarAPIClient` |
| [Loan Calculator](https://apiverve.com/marketplace/loanpaymentcalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLoanCalculator` | `LoanCalculatorAPIClient` |
| [Lorem Ipsum Generator](https://apiverve.com/marketplace/loremipsumgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLoremIpsumGenerator` | `LoremIpsumGeneratorAPIClient` |
| [Lottery Number Generator](https://apiverve.com/marketplace/lotterypicker?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLotteryNumberGenerator` | `LotteryNumberGeneratorAPIClient` |
| [Lottery Numbers](https://apiverve.com/marketplace/lottery?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLotteryNumbers` | `LotteryNumbersAPIClient` |
| [Love Calculator](https://apiverve.com/marketplace/lovecalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveLoveCalculator` | `LoveCalculatorAPIClient` |
| [MAC Address Lookup](https://apiverve.com/marketplace/macaddresslookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMACAddressLookup` | `MACAddressLookupAPIClient` |
| [Mad Libs Generator](https://apiverve.com/marketplace/madlibs?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMadLibsGenerator` | `MadLibsGeneratorAPIClient` |
| [Magic 8-Ball](https://apiverve.com/marketplace/magic8ball?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMagic8Ball` | `Magic8BallAPIClient` |
| [Marine Weather](https://apiverve.com/marketplace/marineweather?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMarineWeather` | `MarineWeatherAPIClient` |
| [Markdown Link Extractor](https://apiverve.com/marketplace/markdownlinkextractor?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMarkdownLinkExtractor` | `MarkdownLinkExtractorAPIClient` |
| [Markdown Table Generator](https://apiverve.com/marketplace/markdowntable?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMarkdownTableGenerator` | `MarkdownTableGeneratorAPIClient` |
| [Markdown to HTML](https://apiverve.com/marketplace/markdowntohtml?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMarkdowntoHTML` | `MarkdowntoHTMLAPIClient` |
| [Markdown to Image](https://apiverve.com/marketplace/markdowntoimage?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMarkdowntoImage` | `MarkdowntoImageAPIClient` |
| [Markdown to PDF](https://apiverve.com/marketplace/markdowntopdf?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMarkdowntoPDF` | `MarkdowntoPDFAPIClient` |
| [Math Calculator](https://apiverve.com/marketplace/math?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMathCalculator` | `MathCalculatorAPIClient` |
| [Mayan Calendar](https://apiverve.com/marketplace/mayancalendar?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMayanCalendar` | `MayanCalendarAPIClient` |
| [Maze Generator](https://apiverve.com/marketplace/maze?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMazeGenerator` | `MazeGeneratorAPIClient` |
| [Meeting Time Converter](https://apiverve.com/marketplace/meetingtimeconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMeetingTimeConverter` | `MeetingTimeConverterAPIClient` |
| [Menstrual Cycle Calculator](https://apiverve.com/marketplace/menstrualcycle?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMenstrualCycleCalculator` | `MenstrualCycleCalculatorAPIClient` |
| [Metadata Extractor](https://apiverve.com/marketplace/metadataextractor?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMetadataExtractor` | `MetadataExtractorAPIClient` |
| [Meteorite Landings](https://apiverve.com/marketplace/meteorites?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMeteoriteLandings` | `MeteoriteLandingsAPIClient` |
| [MIME Type Lookup](https://apiverve.com/marketplace/mimetypelookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMIMETypeLookup` | `MIMETypeLookupAPIClient` |
| [Minimum Wage](https://apiverve.com/marketplace/minimumwage?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMinimumWage` | `MinimumWageAPIClient` |
| [Moon Phases](https://apiverve.com/marketplace/moonphases?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMoonPhases` | `MoonPhasesAPIClient` |
| [Moon Position](https://apiverve.com/marketplace/moonposition?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMoonPosition` | `MoonPositionAPIClient` |
| [Moonrise Moonset](https://apiverve.com/marketplace/moonrisemoonset?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMoonriseMoonset` | `MoonriseMoonsetAPIClient` |
| [Morse Code](https://apiverve.com/marketplace/morsecode?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMorseCode` | `MorseCodeAPIClient` |
| [Mortgage Calculator](https://apiverve.com/marketplace/mortgagecalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMortgageCalculator` | `MortgageCalculatorAPIClient` |
| [Mortgage Rate](https://apiverve.com/marketplace/mortgagerate?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMortgageRate` | `MortgageRateAPIClient` |
| [MurmurHash](https://apiverve.com/marketplace/murmurhash?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMurmurHash` | `MurmurHashAPIClient` |
| [Music Note Generator](https://apiverve.com/marketplace/musicnotegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMusicNoteGenerator` | `MusicNoteGeneratorAPIClient` |
| [MX Lookup](https://apiverve.com/marketplace/mxlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveMXLookup` | `MXLookupAPIClient` |
| [Nameservers](https://apiverve.com/marketplace/nameservers?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNameservers` | `NameserversAPIClient` |
| [National Debt](https://apiverve.com/marketplace/nationaldebt?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNationalDebt` | `NationalDebtAPIClient` |
| [Never Have I Ever](https://apiverve.com/marketplace/neverhaveiever?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNeverHaveIEver` | `NeverHaveIEverAPIClient` |
| [Nobel Prizes](https://apiverve.com/marketplace/nobelprizes?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNobelPrizes` | `NobelPrizesAPIClient` |
| [NSFW Image Detector](https://apiverve.com/marketplace/nsfwimagedetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNSFWImageDetector` | `NSFWImageDetectorAPIClient` |
| [Number Base Converter](https://apiverve.com/marketplace/numberbaseconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNumberBaseConverter` | `NumberBaseConverterAPIClient` |
| [Number to Words](https://apiverve.com/marketplace/numbertowords?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNumbertoWords` | `NumbertoWordsAPIClient` |
| [Nutrition](https://apiverve.com/marketplace/nutrition?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveNutrition` | `NutritionAPIClient` |
| [Office to PDF](https://apiverve.com/marketplace/officetopdf?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveOfficetoPDF` | `OfficetoPDFAPIClient` |
| [Open Source Licenses](https://apiverve.com/marketplace/openlicenses?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveOpenSourceLicenses` | `OpenSourceLicensesAPIClient` |
| [Ovulation Calculator](https://apiverve.com/marketplace/ovulationcalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveOvulationCalculator` | `OvulationCalculatorAPIClient` |
| [Palindrome Checker](https://apiverve.com/marketplace/palindromechecker?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePalindromeChecker` | `PalindromeCheckerAPIClient` |
| [Palladium Price](https://apiverve.com/marketplace/palladiumprice?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePalladiumPrice` | `PalladiumPriceAPIClient` |
| [Parts Of Speech](https://apiverve.com/marketplace/partsofspeech?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePartsOfSpeech` | `PartsOfSpeechAPIClient` |
| [Password Breach Checker](https://apiverve.com/marketplace/passwordbreach?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePasswordBreachChecker` | `PasswordBreachCheckerAPIClient` |
| [Password Generator](https://apiverve.com/marketplace/passwordgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePasswordGenerator` | `PasswordGeneratorAPIClient` |
| [Password Strength](https://apiverve.com/marketplace/passwordstrength?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePasswordStrength` | `PasswordStrengthAPIClient` |
| [PDF Merge](https://apiverve.com/marketplace/pdfmerge?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePDFMerge` | `PDFMergeAPIClient` |
| [PDF Page Numbers](https://apiverve.com/marketplace/pdfpagenumbers?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePDFPageNumbers` | `PDFPageNumbersAPIClient` |
| [PDF to Image](https://apiverve.com/marketplace/pdftoimage?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePDFtoImage` | `PDFtoImageAPIClient` |
| [PDF to Text](https://apiverve.com/marketplace/pdftotext?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePDFtoText` | `PDFtoTextAPIClient` |
| [Periodic Table](https://apiverve.com/marketplace/periodictable?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePeriodicTable` | `PeriodicTableAPIClient` |
| [Permutation & Combination Calculator](https://apiverve.com/marketplace/permutationcombination?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePermutationCombinationCalculator` | `PermutationCombinationCalculatorAPIClient` |
| [Phishing Domain Checker](https://apiverve.com/marketplace/phishingcheck?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePhishingDomainChecker` | `PhishingDomainCheckerAPIClient` |
| [Phone Number Validator](https://apiverve.com/marketplace/phonenumbervalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePhoneNumberValidator` | `PhoneNumberValidatorAPIClient` |
| [Phonetic Encoder](https://apiverve.com/marketplace/phonetic?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePhoneticEncoder` | `PhoneticEncoderAPIClient` |
| [Pictionary Generator](https://apiverve.com/marketplace/pictionary?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePictionaryGenerator` | `PictionaryGeneratorAPIClient` |
| [Pig Latin](https://apiverve.com/marketplace/piglatin?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePigLatin` | `PigLatinAPIClient` |
| [Placeholder Text Generator](https://apiverve.com/marketplace/placeholdertext?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePlaceholderTextGenerator` | `PlaceholderTextGeneratorAPIClient` |
| [Planet Positions](https://apiverve.com/marketplace/planetpositions?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePlanetPositions` | `PlanetPositionsAPIClient` |
| [Platinum Price](https://apiverve.com/marketplace/platinumprice?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePlatinumPrice` | `PlatinumPriceAPIClient` |
| [Population Data](https://apiverve.com/marketplace/population?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePopulationData` | `PopulationDataAPIClient` |
| [Port Number Lookup](https://apiverve.com/marketplace/portnumberlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePortNumberLookup` | `PortNumberLookupAPIClient` |
| [Profanity Filter](https://apiverve.com/marketplace/profanityfilter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveProfanityFilter` | `ProfanityFilterAPIClient` |
| [Punycode Converter](https://apiverve.com/marketplace/punycode?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePunycodeConverter` | `PunycodeConverterAPIClient` |
| [Purchasing Power](https://apiverve.com/marketplace/purchasingpower?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVervePurchasingPower` | `PurchasingPowerAPIClient` |
| [QR Code Generator](https://apiverve.com/marketplace/qrcodegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveQRCodeGenerator` | `QRCodeGeneratorAPIClient` |
| [QR Code Reader](https://apiverve.com/marketplace/qrcodereader?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveQRCodeReader` | `QRCodeReaderAPIClient` |
| [Query String Builder](https://apiverve.com/marketplace/querystringbuilder?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveQueryStringBuilder` | `QueryStringBuilderAPIClient` |
| [Random Data Generator](https://apiverve.com/marketplace/randomgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomDataGenerator` | `RandomDataGeneratorAPIClient` |
| [Random Facts](https://apiverve.com/marketplace/randomfacts?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomFacts` | `RandomFactsAPIClient` |
| [Random Identity Generator](https://apiverve.com/marketplace/randomidentitygenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomIdentityGenerator` | `RandomIdentityGeneratorAPIClient` |
| [Random Joke](https://apiverve.com/marketplace/randomjoke?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomJoke` | `RandomJokeAPIClient` |
| [Random Pun](https://apiverve.com/marketplace/randompun?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomPun` | `RandomPunAPIClient` |
| [Random Quote](https://apiverve.com/marketplace/randomquote?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomQuote` | `RandomQuoteAPIClient` |
| [Random User Generator](https://apiverve.com/marketplace/randomusergenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomUserGenerator` | `RandomUserGeneratorAPIClient` |
| [Random Word](https://apiverve.com/marketplace/randomwords?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRandomWord` | `RandomWordAPIClient` |
| [Reading Time Calculator](https://apiverve.com/marketplace/readingtime?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveReadingTimeCalculator` | `ReadingTimeCalculatorAPIClient` |
| [Recipe Generator](https://apiverve.com/marketplace/recipe?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRecipeGenerator` | `RecipeGeneratorAPIClient` |
| [Regex Tester](https://apiverve.com/marketplace/regextester?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRegexTester` | `RegexTesterAPIClient` |
| [Relative Time Formatter](https://apiverve.com/marketplace/relativetimeformatter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRelativeTimeFormatter` | `RelativeTimeFormatterAPIClient` |
| [Remove Punctuation](https://apiverve.com/marketplace/removepunctuation?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRemovePunctuation` | `RemovePunctuationAPIClient` |
| [Reverse DNS Lookup](https://apiverve.com/marketplace/reversednslookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveReverseDNSLookup` | `ReverseDNSLookupAPIClient` |
| [Reverse Geocode](https://apiverve.com/marketplace/reversegeocode?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveReverseGeocode` | `ReverseGeocodeAPIClient` |
| [Reverse Text](https://apiverve.com/marketplace/reversetext?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveReverseText` | `ReverseTextAPIClient` |
| [Rhyming Words](https://apiverve.com/marketplace/wordrhymes?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRhymingWords` | `RhymingWordsAPIClient` |
| [Ring Size Converter](https://apiverve.com/marketplace/ringsizeconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRingSizeConverter` | `RingSizeConverterAPIClient` |
| [Rock Paper Scissors](https://apiverve.com/marketplace/rockpaperscissors?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRockPaperScissors` | `RockPaperScissorsAPIClient` |
| [Roman Numeral Converter](https://apiverve.com/marketplace/romanconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRomanNumeralConverter` | `RomanNumeralConverterAPIClient` |
| [Roman Numeral Math](https://apiverve.com/marketplace/romannumeralmath?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRomanNumeralMath` | `RomanNumeralMathAPIClient` |
| [Routing Number Lookup](https://apiverve.com/marketplace/routinglookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRoutingNumberLookup` | `RoutingNumberLookupAPIClient` |
| [RSS to JSON](https://apiverve.com/marketplace/rsstojson?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveRSStoJSON` | `RSStoJSONAPIClient` |
| [Sales Tax Calculator](https://apiverve.com/marketplace/salestaxcalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSalesTaxCalculator` | `SalesTaxCalculatorAPIClient` |
| [Sales Tax Lookup](https://apiverve.com/marketplace/salestax?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSalesTaxLookup` | `SalesTaxLookupAPIClient` |
| [Sanctions Screening](https://apiverve.com/marketplace/sanctionscreening?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSanctionsScreening` | `SanctionsScreeningAPIClient` |
| [Scrabble Word Scorer](https://apiverve.com/marketplace/scrabblescorer?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveScrabbleWordScorer` | `ScrabbleWordScorerAPIClient` |
| [SEC Filings](https://apiverve.com/marketplace/secfilings?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSECFilings` | `SECFilingsAPIClient` |
| [Sentiment Analysis](https://apiverve.com/marketplace/sentimentanalysis?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSentimentAnalysis` | `SentimentAnalysisAPIClient` |
| [SEO Data Scraper](https://apiverve.com/marketplace/seoscraper?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSEODataScraper` | `SEODataScraperAPIClient` |
| [SEO Quick Validator](https://apiverve.com/marketplace/seovalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSEOQuickValidator` | `SEOQuickValidatorAPIClient` |
| [Shoe Size Converter](https://apiverve.com/marketplace/shoesizeconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveShoeSizeConverter` | `ShoeSizeConverterAPIClient` |
| [Short Code Generator](https://apiverve.com/marketplace/shortcodegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveShortCodeGenerator` | `ShortCodeGeneratorAPIClient` |
| [Silver Price](https://apiverve.com/marketplace/silverprice?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSilverPrice` | `SilverPriceAPIClient` |
| [Sitemap Generator](https://apiverve.com/marketplace/sitemapgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSitemapGenerator` | `SitemapGeneratorAPIClient` |
| [Slot Machine Simulator](https://apiverve.com/marketplace/slotmachine?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSlotMachineSimulator` | `SlotMachineSimulatorAPIClient` |
| [Slugify](https://apiverve.com/marketplace/slugify?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSlugify` | `SlugifyAPIClient` |
| [Solar Potential](https://apiverve.com/marketplace/solarpotential?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSolarPotential` | `SolarPotentialAPIClient` |
| [Spam Detector](https://apiverve.com/marketplace/spamdetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSpamDetector` | `SpamDetectorAPIClient` |
| [Spell Checker](https://apiverve.com/marketplace/spellchecker?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSpellChecker` | `SpellCheckerAPIClient` |
| [Spelling Bee Generator](https://apiverve.com/marketplace/spellingbee?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSpellingBeeGenerator` | `SpellingBeeGeneratorAPIClient` |
| [SPF Validator](https://apiverve.com/marketplace/spfvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSPFValidator` | `SPFValidatorAPIClient` |
| [SQL Explainer](https://apiverve.com/marketplace/sqlexplainer?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSQLExplainer` | `SQLExplainerAPIClient` |
| [SRV Record Parser](https://apiverve.com/marketplace/srvparser?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSRVRecordParser` | `SRVRecordParserAPIClient` |
| [SSL Certificate Checker](https://apiverve.com/marketplace/sslchecker?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSSLCertificateChecker` | `SSLCertificateCheckerAPIClient` |
| [Stars Lookup](https://apiverve.com/marketplace/starslookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveStarsLookup` | `StarsLookupAPIClient` |
| [State Boundaries](https://apiverve.com/marketplace/stateboundaries?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveStateBoundaries` | `StateBoundariesAPIClient` |
| [Stock Exchange](https://apiverve.com/marketplace/stockexchange?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveStockExchange` | `StockExchangeAPIClient` |
| [Stock Market Open Times](https://apiverve.com/marketplace/stockmarketopentimes?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveStockMarketOpenTimes` | `StockMarketOpenTimesAPIClient` |
| [Street Address Parser](https://apiverve.com/marketplace/streetaddressparser?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveStreetAddressParser` | `StreetAddressParserAPIClient` |
| [Subdomain Finder](https://apiverve.com/marketplace/subdomainfinder?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSubdomainFinder` | `SubdomainFinderAPIClient` |
| [Sudoku Generator](https://apiverve.com/marketplace/sudoku?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSudokuGenerator` | `SudokuGeneratorAPIClient` |
| [Sun Position](https://apiverve.com/marketplace/sunposition?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSunPosition` | `SunPositionAPIClient` |
| [Sunrise Sunset](https://apiverve.com/marketplace/sunrisesunset?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSunriseSunset` | `SunriseSunsetAPIClient` |
| [Superhero Name Generator](https://apiverve.com/marketplace/superheroname?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSuperheroNameGenerator` | `SuperheroNameGeneratorAPIClient` |
| [SVG Converter](https://apiverve.com/marketplace/svgconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSVGConverter` | `SVGConverterAPIClient` |
| [SWIFT Code Lookup](https://apiverve.com/marketplace/swiftlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSWIFTCodeLookup` | `SWIFTCodeLookupAPIClient` |
| [Syllable Counter](https://apiverve.com/marketplace/syllablecounter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveSyllableCounter` | `SyllableCounterAPIClient` |
| [Tax ID Validator](https://apiverve.com/marketplace/taxidvalidator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTaxIDValidator` | `TaxIDValidatorAPIClient` |
| [Tense Converter](https://apiverve.com/marketplace/tenseconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTenseConverter` | `TenseConverterAPIClient` |
| [Test Card Generator](https://apiverve.com/marketplace/cardgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTestCardGenerator` | `TestCardGeneratorAPIClient` |
| [Text Language](https://apiverve.com/marketplace/textlanguage?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTextLanguage` | `TextLanguageAPIClient` |
| [Text Lemmatizer](https://apiverve.com/marketplace/lemmatizer?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTextLemmatizer` | `TextLemmatizerAPIClient` |
| [Text Readability Score](https://apiverve.com/marketplace/readabilityscore?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTextReadabilityScore` | `TextReadabilityScoreAPIClient` |
| [Text Similarity](https://apiverve.com/marketplace/textsimilarity?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTextSimilarity` | `TextSimilarityAPIClient` |
| [Text Styler](https://apiverve.com/marketplace/textstyler?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTextStyler` | `TextStylerAPIClient` |
| [Text Summarizer](https://apiverve.com/marketplace/textsummarizer?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTextSummarizer` | `TextSummarizerAPIClient` |
| [Text to Color](https://apiverve.com/marketplace/texttocolor?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTexttoColor` | `TexttoColorAPIClient` |
| [Text to Emoji](https://apiverve.com/marketplace/texttoemoji?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTexttoEmoji` | `TexttoEmojiAPIClient` |
| [Thesaurus](https://apiverve.com/marketplace/thesaurus?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveThesaurus` | `ThesaurusAPIClient` |
| [Ticker News](https://apiverve.com/marketplace/tickernews?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTickerNews` | `TickerNewsAPIClient` |
| [Ticker Symbols](https://apiverve.com/marketplace/tickersymbols?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTickerSymbols` | `TickerSymbolsAPIClient` |
| [Timezone Lookup](https://apiverve.com/marketplace/timezonelookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTimezoneLookup` | `TimezoneLookupAPIClient` |
| [Tip Calculator](https://apiverve.com/marketplace/tipcalculator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTipCalculator` | `TipCalculatorAPIClient` |
| [Title Case Converter](https://apiverve.com/marketplace/titlecapitalization?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTitleCaseConverter` | `TitleCaseConverterAPIClient` |
| [TLD Lookup](https://apiverve.com/marketplace/tldlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTLDLookup` | `TLDLookupAPIClient` |
| [TLS Checker](https://apiverve.com/marketplace/tlscheck?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTLSChecker` | `TLSCheckerAPIClient` |
| [Tor Node Detector](https://apiverve.com/marketplace/tordetect?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTorNodeDetector` | `TorNodeDetectorAPIClient` |
| [TOTP Generator](https://apiverve.com/marketplace/totpgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTOTPGenerator` | `TOTPGeneratorAPIClient` |
| [Trade Balance](https://apiverve.com/marketplace/tradebalance?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTradeBalance` | `TradeBalanceAPIClient` |
| [Translator](https://apiverve.com/marketplace/translator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTranslator` | `TranslatorAPIClient` |
| [Treasury Yields](https://apiverve.com/marketplace/treasuryyields?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTreasuryYields` | `TreasuryYieldsAPIClient` |
| [Trivia Generator](https://apiverve.com/marketplace/trivia?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTriviaGenerator` | `TriviaGeneratorAPIClient` |
| [Truth or Dare](https://apiverve.com/marketplace/truthordare?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTruthorDare` | `TruthorDareAPIClient` |
| [Truth Table Generator](https://apiverve.com/marketplace/truthtable?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveTruthTableGenerator` | `TruthTableGeneratorAPIClient` |
| [ULID Generator](https://apiverve.com/marketplace/ulidgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveULIDGenerator` | `ULIDGeneratorAPIClient` |
| [Unemployment Rate](https://apiverve.com/marketplace/unemployment?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUnemploymentRate` | `UnemploymentRateAPIClient` |
| [Unicode Character Lookup](https://apiverve.com/marketplace/unicodelookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUnicodeCharacterLookup` | `UnicodeCharacterLookupAPIClient` |
| [Unicode Escape/Unescape](https://apiverve.com/marketplace/unicodeescape?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUnicodeEscapeUnescape` | `UnicodeEscapeUnescapeAPIClient` |
| [Unit Converter](https://apiverve.com/marketplace/unitconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUnitConverter` | `UnitConverterAPIClient` |
| [Unix Timestamp Converter](https://apiverve.com/marketplace/unixtimestamp?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUnixTimestampConverter` | `UnixTimestampConverterAPIClient` |
| [URL Encoder/Decoder](https://apiverve.com/marketplace/urlencode?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveURLEncoderDecoder` | `URLEncoderDecoderAPIClient` |
| [URL Lookup](https://apiverve.com/marketplace/urllookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveURLLookup` | `URLLookupAPIClient` |
| [URL Title](https://apiverve.com/marketplace/urltitle?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveURLTitle` | `URLTitleAPIClient` |
| [URL to Markdown](https://apiverve.com/marketplace/urltomarkdown?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveURLtoMarkdown` | `URLtoMarkdownAPIClient` |
| [URL Unshortener](https://apiverve.com/marketplace/urlunshortener?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveURLUnshortener` | `URLUnshortenerAPIClient` |
| [USB Vendor Lookup](https://apiverve.com/marketplace/usbvendorlookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUSBVendorLookup` | `USBVendorLookupAPIClient` |
| [US Car Models](https://apiverve.com/marketplace/carmodels?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUSCarModels` | `USCarModelsAPIClient` |
| [USDA Hardiness Zone](https://apiverve.com/marketplace/hardinesszone?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUSDAHardinessZone` | `USDAHardinessZoneAPIClient` |
| [User Agent Generator](https://apiverve.com/marketplace/useragentgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUserAgentGenerator` | `UserAgentGeneratorAPIClient` |
| [User Agent Parser](https://apiverve.com/marketplace/useragentparser?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUserAgentParser` | `UserAgentParserAPIClient` |
| [Username Generator](https://apiverve.com/marketplace/usernamegenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUsernameGenerator` | `UsernameGeneratorAPIClient` |
| [Username Profanity](https://apiverve.com/marketplace/usernameprofanity?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUsernameProfanity` | `UsernameProfanityAPIClient` |
| [UTM Coordinate Converter](https://apiverve.com/marketplace/utmconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUTMCoordinateConverter` | `UTMCoordinateConverterAPIClient` |
| [UUID Generator](https://apiverve.com/marketplace/uuidgenerator?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveUUIDGenerator` | `UUIDGeneratorAPIClient` |
| [Variable Name Converter](https://apiverve.com/marketplace/variablenameconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveVariableNameConverter` | `VariableNameConverterAPIClient` |
| [VAT Rates](https://apiverve.com/marketplace/vatrates?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveVATRates` | `VATRatesAPIClient` |
| [VIN Decoder](https://apiverve.com/marketplace/vindecoder?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveVINDecoder` | `VINDecoderAPIClient` |
| [Visa Requirements](https://apiverve.com/marketplace/visarequirements?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveVisaRequirements` | `VisaRequirementsAPIClient` |
| [Vowel Counter](https://apiverve.com/marketplace/vowelcounter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveVowelCounter` | `VowelCounterAPIClient` |
| [VPN Proxy Detector](https://apiverve.com/marketplace/vpndetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveVPNProxyDetector` | `VPNProxyDetectorAPIClient` |
| [Weather](https://apiverve.com/marketplace/weatherforecast?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWeather` | `WeatherAPIClient` |
| [Weather Alerts](https://apiverve.com/marketplace/weatheralerts?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWeatherAlerts` | `WeatherAlertsAPIClient` |
| [Weather Seasons](https://apiverve.com/marketplace/weatherseasons?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWeatherSeasons` | `WeatherSeasonsAPIClient` |
| [WebP Converter](https://apiverve.com/marketplace/webpconverter?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWebPConverter` | `WebPConverterAPIClient` |
| [Website Images Scraper](https://apiverve.com/marketplace/webimagescraper?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWebsiteImagesScraper` | `WebsiteImagesScraperAPIClient` |
| [Website Readability](https://apiverve.com/marketplace/websitereadability?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWebsiteReadability` | `WebsiteReadabilityAPIClient` |
| [Website Screenshot](https://apiverve.com/marketplace/webscreenshots?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWebsiteScreenshot` | `WebsiteScreenshotAPIClient` |
| [Website Tech Stack Detector](https://apiverve.com/marketplace/techstackdetector?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWebsiteTechStackDetector` | `WebsiteTechStackDetectorAPIClient` |
| [Website to PDF](https://apiverve.com/marketplace/websitetopdf?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWebsitetoPDF` | `WebsitetoPDFAPIClient` |
| [Website to Text](https://apiverve.com/marketplace/websitetotext?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWebsitetoText` | `WebsitetoTextAPIClient` |
| [WHOIS Lookup](https://apiverve.com/marketplace/whoislookup?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWHOISLookup` | `WHOISLookupAPIClient` |
| [Word Ladder Generator](https://apiverve.com/marketplace/wordladder?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordLadderGenerator` | `WordLadderGeneratorAPIClient` |
| [Wordle Helper](https://apiverve.com/marketplace/wordlehelper?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordleHelper` | `WordleHelperAPIClient` |
| [Word Lexicon Analyzer](https://apiverve.com/marketplace/lexicon?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordLexiconAnalyzer` | `WordLexiconAnalyzerAPIClient` |
| [Word Opposites](https://apiverve.com/marketplace/wordopposite?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordOpposites` | `WordOppositesAPIClient` |
| [Word Pronunciation](https://apiverve.com/marketplace/wordpronunciation?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordPronunciation` | `WordPronunciationAPIClient` |
| [Word Scramble Generator](https://apiverve.com/marketplace/wordscramble?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordScrambleGenerator` | `WordScrambleGeneratorAPIClient` |
| [Word Search Generator](https://apiverve.com/marketplace/wordsearch?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordSearchGenerator` | `WordSearchGeneratorAPIClient` |
| [Words to Numbers](https://apiverve.com/marketplace/wordstonumbers?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWordstoNumbers` | `WordstoNumbersAPIClient` |
| [Working Days](https://apiverve.com/marketplace/workingdays?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWorkingDays` | `WorkingDaysAPIClient` |
| [World Holidays](https://apiverve.com/marketplace/worldholidays?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWorldHolidays` | `WorldHolidaysAPIClient` |
| [World News](https://apiverve.com/marketplace/news?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWorldNews` | `WorldNewsAPIClient` |
| [World Time](https://apiverve.com/marketplace/worldtime?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWorldTime` | `WorldTimeAPIClient` |
| [Worldwide Earthquakes](https://apiverve.com/marketplace/earthquake?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveWorldwideEarthquakes` | `WorldwideEarthquakesAPIClient` |
| [XML to JSON](https://apiverve.com/marketplace/xmltojson?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveXMLtoJSON` | `XMLtoJSONAPIClient` |
| [Zip Codes Lookup](https://apiverve.com/marketplace/zipcodes?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveZipCodesLookup` | `ZipCodesLookupAPIClient` |
| [ZIP Demographics](https://apiverve.com/marketplace/zipdemographics?utm_source=swiftpm&utm_medium=referral&utm_content=readme) | `APIVerveZIPDemographics` | `ZIPDemographicsAPIClient` |

Each API's page has its parameters, response fields, pricing and a live test console. Full reference: [docs.apiverve.com](https://docs.apiverve.com?utm_source=swiftpm&utm_medium=referral&utm_content=readme).

## Support

- **Documentation:** [docs.apiverve.com](https://docs.apiverve.com?utm_source=swiftpm&utm_medium=referral&utm_content=readme)
- **Issues:** [GitHub Issues](https://github.com/apiverve/apiverve-swift/issues)
- **Customer support:** [apiverve.com/contact](https://apiverve.com/contact?utm_source=swiftpm&utm_medium=referral&utm_content=readme)
- **Updates:** [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=swiftpm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=swiftpm&utm_medium=referral&utm_content=readme).

## License

MIT. See [LICENSE](LICENSE).
