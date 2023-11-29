DROP DATABASE IF EXISTS youtube; 
CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;

-- Viewer
CREATE TABLE IF NOT EXISTS Viewer (
    ID 				varchar(128)	PRIMARY KEY,
    profilePhoto 	varchar(128),
    displayName 	varchar(128)	NOT NULL,
    lastLogin 		date			NOT NULL,
    createdDate 	date			NOT NULL
);

-- Google Account
CREATE TABLE IF NOT EXISTS GoogleAccount (
    ID 					varchar(128) 	PRIMARY KEY,
    googleAccountEmail 	varchar(100)	NOT NULL,
    phoneNumber 		varchar(10),
    recoveryEmail 		varchar(100),
    gender 				char(1)			NOT NULL,
    CONSTRAINT chk_gender CHECK (gender IN ('M', 'F')),
    CONSTRAINT fk_GoogleAcct_Viewer FOREIGN KEY (ID) REFERENCES Viewer(ID)
);

CREATE TABLE IF NOT EXISTS GoogleAcct_billingInfo (
    googleAcctID 			varchar(128),
    googleAcct_cardType 	varchar(20),
    googleAcct_cardNumber 	varchar(16),
	CONSTRAINT pk_GAbillingInfo PRIMARY KEY (googleAcctID, googleAcct_cardType, googleAcct_cardNumber),
	CONSTRAINT fk_GAbillingInfo_GoogleAcct FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

CREATE TABLE IF NOT EXISTS GoogleAcct_address (
    googleAcctID 				varchar(128),
    googleAcct_addressNumber 	varchar(20),
    googleAcct_postCode 		varchar(10),
    googleAcct_district 		varchar(50),
    googleAcct_province 		varchar(50),
    googleAcct_road 			varchar(100),
    CONSTRAINT pk_GAaddress PRIMARY KEY (googleAcctID, googleAcct_addressNumber, googleAcct_postCode, googleAcct_district, googleAcct_province, googleAcct_road),
	CONSTRAINT fk_GAaddress_GoogleAcct FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

-- Google Ads Account 
CREATE TABLE IF NOT EXISTS GoogleAdsAccount (
    googleAdsAcctID varchar(128) 	PRIMARY KEY,
    googleAcctID 	varchar(128) 	NOT NULL,
    CONSTRAINT fk_GoogleAdsAcct_GoogleAcct FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

CREATE TABLE IF NOT EXISTS GoogleAdsAcct_linkedAccount (
    googleAdsAcctID 			varchar(128),
    googleAdsAcct_linkedAccount varchar(125) NOT NULL,
    PRIMARY KEY (googleAdsAcctID, googleAdsAcct_linkedAccount),
    CONSTRAINT fk_GAAlinkedAcct_GoogleAdsAcct FOREIGN KEY (googleAdsAcctID) REFERENCES GoogleAdsAccount(googleAdsAcctID)
);

-- Channel's Creator
CREATE TABLE IF NOT EXISTS ChannelCreator (
    ID 					VARCHAR(128)	PRIMARY KEY,
    publishedAt 		DATETIME		NOT NULL,
    customUrl 			VARCHAR(128)	NOT NULL,
    description 		VARCHAR(1000),
    brandingSettings 	VARCHAR(128)	NOT NULL,
    overallGoodStanding BOOLEAN			NOT NULL,
    communityGuidelines BOOLEAN			NOT NULL,
    copyrightStrikes 	BOOLEAN			NOT NULL,
    contentIdClaims 	BOOLEAN			NOT NULL,
    contentOwnerDetails VARCHAR(128)	NOT NULL,
    localizations 		VARCHAR(128)	NOT NULL,
    title 				VARCHAR(50)		NOT NULL,
    topicDetails 		VARCHAR(128)	NOT NULL,
    privacyStatus 		VARCHAR(128)	NOT NULL,
    likePlaylist 		VARCHAR(128),
    uploadPlaylist 		VARCHAR(128),
    thumbnails 			VARCHAR(128)	NOT NULL,
    googleAcctID 		VARCHAR(128)	NOT NULL,
    CONSTRAINT fk_ChannelCreator_Viewer FOREIGN KEY (ID) REFERENCES Viewer(ID),
	CONSTRAINT fk_ChannelCreator_GoogleAcct FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

CREATE TABLE IF NOT EXISTS Subscribe (
    channelID 			VARCHAR(128),
    subscriberID 		VARCHAR(128),
    subscriptionDate 	DATE 			NOT NULL,
    CONSTRAINT pk_Subscribe PRIMARY KEY (channelID, subscriberID),
    CONSTRAINT fk_Subscribe_channel FOREIGN KEY (channelID) REFERENCES ChannelCreator(ID),
    CONSTRAINT fk_Subscribe_subscriber FOREIGN KEY (subscriberID) REFERENCES ChannelCreator(ID)
);

-- YPP & Monetization
CREATE TABLE IF NOT EXISTS YPP (
    channelID 	VARCHAR(128),
    YPPID 		VARCHAR(128),
    acceptedAt 	DATETIME	NOT NULL,
	CONSTRAINT pk_YPP PRIMARY KEY (channelID, YPPID),
    CONSTRAINT fk_YPP_channel FOREIGN KEY (channelID) REFERENCES ChannelCreator(ID)
); 

CREATE TABLE MonetizationFeature (
    featureName		VARCHAR(128)	PRIMARY KEY,
    description 	VARCHAR(1000)	NOT NULL
);

CREATE TABLE MntFeature_requirement (
    featureName 		VARCHAR(128) 	NOT NULL,
    mntFeature_requirement 	VARCHAR(500)	NOT NULL,
    CONSTRAINT pk_MntFeatureRequirement PRIMARY KEY (featureName, mntFeature_requirement),
    CONSTRAINT fk_MntFeatureRequirement_featureName FOREIGN KEY (featureName) REFERENCES MonetizationFeature(featureName)
);

CREATE TABLE Manage_MntFeature (
    YPP_channelID 			VARCHAR(128)	NOT NULL,
    YPP_YPPID 				VARCHAR(128) 	NOT NULL,
    mntFeature_featureName	VARCHAR(128)	NOT NULL,
    isEnable				BOOLEAN			NOT NULL,
    CONSTRAINT pk_ManageMntFeature PRIMARY KEY (YPP_channelID, YPP_YPPID, mntFeature_featureName),
    CONSTRAINT fk_ManageMntFeature_YPP FOREIGN KEY (YPP_channelID, YPP_YPPID) REFERENCES YPP(channelID, YPPID),
    CONSTRAINT fk_ManageMntFeature_featureName FOREIGN KEY (mntFeature_featureName) REFERENCES MonetizationFeature(featureName)
);

CREATE TABLE RevenueReceivingMethod (
    methodName 		VARCHAR(128) 	PRIMARY KEY,
    isThirdParty 	BOOLEAN 		NOT NULL
);

CREATE TABLE RRMethod_paymentOption (
    methodName 				VARCHAR(128) 	NOT NULL,
    RRMethod_paymentOption 	VARCHAR(50)		NOT NULL,
    CONSTRAINT pk_RRMethodPaymentOption PRIMARY KEY (methodName, RRMethod_paymentOption),
    CONSTRAINT fk_RRMethodPaymentOption_methodName FOREIGN KEY (methodName) REFERENCES RevenueReceivingMethod(methodName)
);

CREATE TABLE Choose_RRMethod (
    YPP_channelID 		VARCHAR(128)	NOT NULL,
    YPP_YPPID 			VARCHAR(128) 	NOT NULL,
    RRMethod_methodName VARCHAR(128)	NOT NULL,
    addressNumber 		VARCHAR(10)		NOT NULL,
    road 				VARCHAR(100),
    district 			VARCHAR(100)	NOT NULL,
    province 			VARCHAR(100)	NOT NULL,
    postalCode 			VARCHAR(10)		NOT NULL,
    CONSTRAINT pk_ChooseRRMethod PRIMARY KEY (YPP_channelID, YPP_YPPID, RRMethod_paymentOption),
    CONSTRAINT fk_ChooseRRMethod_YPP FOREIGN KEY (YPP_channelID, YPP_YPPID) REFERENCES YPP(channelID, YPPID),
	CONSTRAINT fk_ChooseRRMethod_methodName FOREIGN KEY (RRMMethodName) REFERENCES RevenueReceivingMethod(methodName)
);


-- Video
CREATE TABLE Video (
    videoID 		VARCHAR(128)	PRIMARY KEY,
    publishedAt 	DATETIME		NOT NULL,
    title 			VARCHAR(50)		NOT NULL,
    description 	VARCHAR(5000),
    thumbnails 		VARCHAR(128)	NOT NULL,
    caption 		BOOLEAN			NOT NULL,
    duration 		TIME			NOT NULL,
    dimension 		VARCHAR(10)		NOT NULL,
    uploadStatus 	VARCHAR(20)		NOT NULL,
    visibility 		VARCHAR(20)		NOT NULL,
    fileDetails 	VARCHAR(128)	NOT NULL,
    suggestions 	VARCHAR(128)	NOT NULL,
    localizations 	VARCHAR(128)	NOT NULL,
    channelID 		VARCHAR(128)	NOT NULL,
    CONSTRAINT fk_Video_channel FOREIGN KEY (channelID) REFERENCES ChannelCreator(ID)
);

CREATE TABLE IF NOT EXISTS Video_tags (
    videoID 	VARCHAR(128),
    video_tags 	VARCHAR(128),
    CONSTRAINT pk_Vtags PRIMARY KEY (videoID, video_tags),
    CONSTRAINT pk_Vtags_Video FOREIGN KEY (videoID) REFERENCES Video(videoID)
);

CREATE TABLE Members_only_Video (
    videoID VARCHAR(128) PRIMARY KEY,
    memberLevel VARCHAR(20),
    channelID VARCHAR(20),
    YPPID VARCHAR(20),
    CONSTRAINT fk_members_only_video_video FOREIGN KEY (videoID) REFERENCES Video(videoID),
    CONSTRAINT fk_members_only_video_ypp FOREIGN KEY (channelID, YPPID) REFERENCES YPP(channelID, YPPID)
);



CREATE TABLE Monetized_Video (
    videoID VARCHAR(128) PRIMARY KEY,
    adsType VARCHAR(128),
    location VARCHAR(128),
    monetizationStatus BOOLEAN,
    channelID VARCHAR(128),
    YPPID VARCHAR(128),
    CONSTRAINT fk_monetized_video_video FOREIGN KEY (videoID) REFERENCES Video(videoID),
    CONSTRAINT fk_monetized_video_ypp FOREIGN KEY (channelID, YPPID) REFERENCES YPP(channelID, YPPID)
);


CREATE TABLE Comments (
    commentID VARCHAR(128) PRIMARY KEY,
    updateTime TIME,
    publishedTime TIME,
    moderationStatus VARCHAR(128),
    likeCounts VARCHAR(50),
    viewerRating VARCHAR(128),
    rateStatus BOOLEAN,
    textOriginal VARCHAR(128),
    textDisplay VARCHAR(128),
    authorChannelUrl VARCHAR(128),
    authorProfileImageUrl VARCHAR(128),
    authorDisplayName VARCHAR(128),
    channelID VARCHAR(128),
    videoID VARCHAR(128),
    CONSTRAINT fk_comments_channelID FOREIGN KEY (channelID) REFERENCES Channel_Creator(ID)
);

CREATE TABLE IF NOT EXISTS Engage (
    viewerID varchar(128),
    videoID varchar(128),
    usedDevice varchar(20),
    watchDuration time,
    isSaved boolean,
    isDisliked boolean,
    isLiked boolean,
    PRIMARY KEY (viewerID, videoID),
    FOREIGN KEY (viewerID) REFERENCES Viewer(ID),
    FOREIGN KEY (videoID) REFERENCES Video(videoID)
);

CREATE TABLE IF NOT EXISTS `Video Ads` (
    videoAdsID VARCHAR(128) PRIMARY KEY,
    length TIME,
    objective VARCHAR(128),
    videoFormatType VARCHAR(128),
    targetLocation VARCHAR(128),
    targetLanguage VARCHAR(128),
    budget DECIMAL(16,2),
    googleAdsID VARCHAR(128),
    FOREIGN KEY (googleAdsID) REFERENCES GoogleAdsAccount(googleAdsAccountID)
);

CREATE TABLE IF NOT EXISTS `Appear_Ads` (
    videoID VARCHAR(128),
    videoAdsID VARCHAR(128),
    videoAdsViews INT,
    PRIMARY KEY (videoID, videoAdsID),
    FOREIGN KEY (videoID) REFERENCES `Video`(videoID),
    FOREIGN KEY (videoAdsID) REFERENCES `Video Ads`(videoAdsID)
);


CREATE TABLE IF NOT EXISTS `VideoAds_topics` (
    videoAdsID VARCHAR(128),
    VIDEOADStopics VARCHAR(128),
    URLlinkofVideoAds VARCHAR(255),
    PRIMARY KEY (videoAdsID, VIDEOADStopics),
    FOREIGN KEY (videoAdsID) REFERENCES `Video Ads`(videoAdsID)
);

CREATE TABLE IF NOT EXISTS `VideoAds_placements` (
    videoAdsID VARCHAR(128),
    VIDEOADSplacements TIME,
    PRIMARY KEY (videoAdsID, VIDEOADSplacements),
    FOREIGN KEY (videoAdsID) REFERENCES `Video Ads`(videoAdsID)
);

CREATE TABLE IF NOT EXISTS `VideoAds_keywords` (
    videoAdsID VARCHAR(128),
    VIDEOADSkeywords VARCHAR(128),
    times INT,
    PRIMARY KEY (videoAdsID, VIDEOADSkeywords),
    FOREIGN KEY (videoAdsID) REFERENCES `Video Ads`(videoAdsID)
);
