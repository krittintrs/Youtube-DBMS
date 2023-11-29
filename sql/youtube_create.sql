DROP DATABASE IF EXISTS youtube; 
CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;

-- Viewer
CREATE TABLE IF NOT EXISTS Viewer (
    ID 				VARCHAR(128)	PRIMARY KEY,
    profilePhotoUrl	VARCHAR(2083),
    displayName 	VARCHAR(30)	    NOT NULL,
    lastLogin 		DATE			NOT NULL,
    createdDate 	DATE			NOT NULL
);

-- Google Account
CREATE TABLE IF NOT EXISTS GoogleAccount (
    ID 					VARCHAR(128) 	PRIMARY KEY,
    googleAccountEmail 	VARCHAR(320)	NOT NULL,
    phoneNumber 		VARCHAR(10),
    recoveryEmail 		VARCHAR(320),
    gender 				CHAR(1)			NOT NULL,
    CONSTRAINT chk_gender CHECK (gender IN ('M', 'F')),
    CONSTRAINT fk_GoogleAcct_viewerID FOREIGN KEY (ID) REFERENCES Viewer(ID)
);

CREATE TABLE IF NOT EXISTS GoogleAcct_billingInfo (
    googleAcctID 			VARCHAR(128),
    googleAcct_cardType 	VARCHAR(30),
    googleAcct_cardNumber 	VARCHAR(16),
    CONSTRAINT chk_cardType CHECK (googleAcct_cardType IN ('American Express', 'Mastercard', 'Union Pay', 'Visa', 'Visa Electron')),
	CONSTRAINT pk_GAbillingInfo PRIMARY KEY (googleAcctID, googleAcct_cardType, googleAcct_cardNumber),
	CONSTRAINT fk_GAbillingInfo_GoogleAcctID FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

CREATE TABLE IF NOT EXISTS GoogleAcct_address (
    googleAcctID 				VARCHAR(128),
    googleAcct_addressNumber 	VARCHAR(20),
    googleAcct_road 			VARCHAR(100),
    googleAcct_district 		VARCHAR(50),
    googleAcct_province 		VARCHAR(50),
    googleAcct_country          VARCHAR(60),
    googleAcct_postalCode 		VARCHAR(10),
    CONSTRAINT pk_GAaddress PRIMARY KEY (googleAcctID, googleAcct_addressNumber, googleAcct_road, googleAcct_district, googleAcct_province, googleAcct_country, googleAcct_postalCode),
	CONSTRAINT fk_GAaddress_GoogleAcctID FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

-- Google Ads Account 
CREATE TABLE IF NOT EXISTS GoogleAdsAccount (
    googleAdsAcctID VARCHAR(128) 	PRIMARY KEY,
    googleAcctID 	VARCHAR(128) 	NOT NULL,
    CONSTRAINT fk_GoogleAdsAcct_GoogleAcctID FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

CREATE TABLE IF NOT EXISTS GoogleAdsAcct_linkedAccount (
    googleAdsAcctID 			VARCHAR(128),
    googleAdsAcct_linkedAcctUrl VARCHAR(2083) NOT NULL,
    PRIMARY KEY (googleAdsAcctID, googleAdsAcct_linkedAcctURL(50)),
    CONSTRAINT fk_GAAlinkedAcct_GoogleAdsAcctID FOREIGN KEY (googleAdsAcctID) REFERENCES GoogleAdsAccount(googleAdsAcctID)
);

-- Channel's Creator
CREATE TABLE IF NOT EXISTS ChannelCreator (
    ID 					VARCHAR(128)	PRIMARY KEY,
    title 				VARCHAR(50)		NOT NULL,
    description 		VARCHAR(1000),
    publishedAt 		DATETIME		NOT NULL,
    customUrl 			VARCHAR(2083)	NOT NULL,
    thumbnailUrl 		VARCHAR(2083)	NOT NULL,
    defaultLanguage     VARCHAR(60)    NOT NULL,
    country             VARCHAR(60)     NOT NULL,
    overallGoodStanding BOOLEAN			NOT NULL,
    communityGuidelines BOOLEAN			NOT NULL,
    copyrightStrikes 	BOOLEAN			NOT NULL,
    contentIdClaims 	BOOLEAN			NOT NULL,
    privacyStatus 		VARCHAR(20)     NOT NULL,
    topicDetails 		VARCHAR(50)     NOT NULL,
    googleAcctID 		VARCHAR(128)	NOT NULL,
    CONSTRAINT chk_privacyStatus CHECK (privacyStatus IN ('private', 'public', 'unlisted')),
    CONSTRAINT fk_ChannelCreator_ViewerID FOREIGN KEY (ID) REFERENCES Viewer(ID),
	CONSTRAINT fk_ChannelCreator_GoogleAcctID FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

CREATE TABLE IF NOT EXISTS Subscribe (
    channelID 			VARCHAR(128),
    subscriberID 		VARCHAR(128),
    subscriptionDate 	DATETIME 		NOT NULL,
    CONSTRAINT pk_Subscribe PRIMARY KEY (channelID, subscriberID),
    CONSTRAINT fk_Subscribe_channelID FOREIGN KEY (channelID) REFERENCES ChannelCreator(ID),
    CONSTRAINT fk_Subscribe_subscriberID FOREIGN KEY (subscriberID) REFERENCES ChannelCreator(ID)
);

-- YPP & Monetization
CREATE TABLE IF NOT EXISTS YPP (
    channelID 	VARCHAR(128),
    YPPID 		VARCHAR(128),
    acceptedAt 	DATETIME	NOT NULL,
	CONSTRAINT pk_YPP PRIMARY KEY (channelID, YPPID),
    CONSTRAINT fk_YPP_channelID FOREIGN KEY (channelID) REFERENCES ChannelCreator(ID)
); 

CREATE TABLE IF NOT EXISTS MonetizationFeature (
    featureName		VARCHAR(50)	PRIMARY KEY,
    description 	VARCHAR(1000)	NOT NULL
);

CREATE TABLE IF NOT EXISTS MntFeature_requirement (
    featureName 		    VARCHAR(50) 	NOT NULL,
    mntFeature_requirement 	VARCHAR(500)	NOT NULL,
    CONSTRAINT pk_MFrequirement PRIMARY KEY (featureName, mntFeature_requirement),
    CONSTRAINT fk_MFrequirement_featureName FOREIGN KEY (featureName) REFERENCES MonetizationFeature(featureName)
);

CREATE TABLE IF NOT EXISTS Manage_MntFeature (
    YPP_channelID 			VARCHAR(128)	NOT NULL,
    YPP_YPPID 				VARCHAR(128) 	NOT NULL,
    mntFeature_featureName	VARCHAR(50) 	NOT NULL,
    isEnable				BOOLEAN			NOT NULL,
    CONSTRAINT pk_ManageMF PRIMARY KEY (YPP_channelID, YPP_YPPID, mntFeature_featureName),
    CONSTRAINT fk_ManageMF_YPP FOREIGN KEY (YPP_channelID, YPP_YPPID) REFERENCES YPP(channelID, YPPID),
    CONSTRAINT fk_ManageMF_featureName FOREIGN KEY (mntFeature_featureName) REFERENCES MonetizationFeature(featureName)
);

CREATE TABLE IF NOT EXISTS RevenueReceivingMethod (
    methodName 		VARCHAR(50) 	PRIMARY KEY,
    isThirdParty 	BOOLEAN 		NOT NULL
);

CREATE TABLE IF NOT EXISTS RRMethod_paymentOption (
    methodName 				VARCHAR(50) 	NOT NULL,
    RRMethod_paymentOption 	VARCHAR(50)		NOT NULL,
    CONSTRAINT pk_RRMpaymentOption PRIMARY KEY (methodName, RRMethod_paymentOption),
    CONSTRAINT fk_RRMpaymentOption_methodName FOREIGN KEY (methodName) REFERENCES RevenueReceivingMethod(methodName)
);

CREATE TABLE IF NOT EXISTS Choose_RRMethod (
    YPP_channelID 		VARCHAR(128)	NOT NULL,
    YPP_YPPID 			VARCHAR(128) 	NOT NULL,
    RRMethod_methodName VARCHAR(50) 	NOT NULL,
    addressNumber 		VARCHAR(10)		NOT NULL,
    road 				VARCHAR(100)    NOT NULL,
    district 			VARCHAR(100)	NOT NULL,
    province 			VARCHAR(100)	NOT NULL,
    postalCode 			VARCHAR(10)		NOT NULL,
    country             VARCHAR(60)		NOT NULL,
    CONSTRAINT pk_ChooseRRM PRIMARY KEY (YPP_channelID, YPP_YPPID, RRMethod_methodName),
    CONSTRAINT fk_ChooseRRM_YPP FOREIGN KEY (YPP_channelID, YPP_YPPID) REFERENCES YPP(channelID, YPPID),
	CONSTRAINT fk_ChooseRRM_methodName FOREIGN KEY (RRMethod_methodName) REFERENCES RevenueReceivingMethod(methodName)
);

-- Video
CREATE TABLE IF NOT EXISTS Video (
    videoID 		VARCHAR(128)	PRIMARY KEY,
    publishedAt 	DATETIME		NOT NULL,
    title 			VARCHAR(50)		NOT NULL,
    description 	VARCHAR(5000),
    thumbnailUrl 	VARCHAR(2083)	NOT NULL,
    caption 		BOOLEAN			NOT NULL,
    duration 		TIME			NOT NULL,
    dimension 		VARCHAR(10)		NOT NULL,
    uploadStatus 	VARCHAR(20)		NOT NULL,
    visibility 		VARCHAR(20)		NOT NULL,
    fileDetailUrl 	VARCHAR(2083)	NOT NULL,
    license			VARCHAR(50)		NOT NULL,
    madeForKids 	BOOLEAN			NOT NULL,
    channelID 		VARCHAR(128)	NOT NULL,
    CONSTRAINT chk_dimension CHECK (dimension IN ('240p', '360p', '480p', '720p', '1080p', '1440p', '2160p', '4320p')),
    CONSTRAINT chk_uploadStatus CHECK (uploadStatus IN ('deleted', 'failed', 'processed', 'rejected', 'uploaded')),
    CONSTRAINT chk_visibility CHECK (visibility IN ('private', 'public', 'unlisted')),
    CONSTRAINT chk_license CHECK (license IN ('creativeCommon', 'youtube')),
    CONSTRAINT fk_Video_channelID FOREIGN KEY (channelID) REFERENCES ChannelCreator(ID)
);

CREATE TABLE IF NOT EXISTS Video_tag (
    videoID 	VARCHAR(128),
    video_tag 	VARCHAR(50)     NOT NULL,
    CONSTRAINT pk_Vtag PRIMARY KEY (videoID, video_tag),
    CONSTRAINT pk_Vtag_videoID FOREIGN KEY (videoID) REFERENCES Video(videoID)
);

CREATE TABLE IF NOT EXISTS MembersOnlyVideo (
    videoID 		VARCHAR(128) 	PRIMARY KEY,
    memberLevel 	VARCHAR(20)		NOT NULL,
    YPP_channelID 	VARCHAR(128)	NOT NULL,
    YPP_YPPID 		VARCHAR(128) 	NOT NULL,
    CONSTRAINT fk_MembersOnlyVideo_videoID FOREIGN KEY (videoID) REFERENCES Video(videoID),
    CONSTRAINT fk_MembersOnlyVideo_YPP FOREIGN KEY (YPP_channelID, YPP_YPPID) REFERENCES YPP(channelID, YPPID)
);

CREATE TABLE IF NOT EXISTS MonetizedVideo (
    videoID 			VARCHAR(128) 	PRIMARY KEY,
    adsType 			VARCHAR(50)	    NOT NULL,
    location 			VARCHAR(60)	    NOT NULL,
    monetizationStatus 	BOOLEAN			NOT NULL,
    YPP_channelID 		VARCHAR(128)	NOT NULL,
    YPP_YPPID 			VARCHAR(128) 	NOT NULL,
    CONSTRAINT fk_MonetizedVideo_videoID FOREIGN KEY (videoID) REFERENCES Video(videoID),
    CONSTRAINT fk_MonetizedVideo_YPP FOREIGN KEY (YPP_channelID, YPP_YPPID) REFERENCES YPP(channelID, YPPID)
);

-- Engage & Comment
CREATE TABLE IF NOT EXISTS Engage (
    viewerID 		VARCHAR(128),
    videoID 		VARCHAR(128),
    usedDevice 		VARCHAR(20)	NOT NULL,
    watchDuration	TIME		NOT NULL,
    isSaved 		BOOLEAN		NOT NULL,
    isDisliked 		BOOLEAN		NOT NULL,
    isLiked 		BOOLEAN		NOT NULL,
    CONSTRAINT pk_Engage PRIMARY KEY (viewerID, videoID),
    CONSTRAINT fk_Engage_viewerID FOREIGN KEY (viewerID) REFERENCES Viewer(ID),
	CONSTRAINT fk_Engage_videoID FOREIGN KEY (videoID) REFERENCES Video(videoID)
);

CREATE TABLE IF NOT EXISTS Comment (
    commentID 				VARCHAR(128)	PRIMARY KEY,
    publishedAt 			DATETIME		NOT NULL,
    updatedAt 				DATETIME		NOT NULL,
    moderationStatus 		VARCHAR(50)		NOT NULL,
    likeCounts 				INT				NOT NULL,
    isPinned 				BOOLEAN			NOT NULL,
    canRate 				BOOLEAN			NOT NULL,
    textOriginal 			VARCHAR(5000)	NOT NULL,
    textDisplay 			VARCHAR(6500)	NOT NULL,
    authorChannelUrl 		VARCHAR(2083)	NOT NULL,
    authorProfileImageUrl	VARCHAR(2083)	NOT NULL,
    authorDisplayName 		VARCHAR(30)	    NOT NULL,
    channelID 				VARCHAR(128)	NOT NULL,
    videoID 				VARCHAR(128)	NOT NULL,
    CONSTRAINT chk_moderationStatus CHECK (moderationStatus IN ('heldForReview', 'likelySpam', 'published', 'rejected')), 
    CONSTRAINT fk_Comment_channelID FOREIGN KEY (channelID) REFERENCES ChannelCreator(ID),
    CONSTRAINT fk_Comment_videoID FOREIGN KEY (videoID) REFERENCES Video(videoID)
);

-- Video Ads
CREATE TABLE IF NOT EXISTS VideoAds (
    videoAdsID		VARCHAR(128)	PRIMARY KEY,
    length			TIME			NOT NULL,
    objective		VARCHAR(500)	NOT NULL,
    videoFormatType	VARCHAR(50)		NOT NULL,
    targetLocation 	VARCHAR(60)	    NOT NULL,
    targetLanguage 	VARCHAR(60)	    NOT NULL,
    budget 			DECIMAL(16,2)	NOT NULL,
    googleAdsAcctID	VARCHAR(128)	NOT NULL,
    CONSTRAINT chk_videoFormatType CHECK (videoFormatType IN ('Skippable video ads', 'Non-skippable video ads', 'Bumper ads')),
    CONSTRAINT fk_VideoAds_GoogleAdsAcctID FOREIGN KEY (googleAdsAcctID) REFERENCES GoogleAdsAccount(googleAdsAcctID)
);

CREATE TABLE IF NOT EXISTS VideoAds_topic (
    videoAdsID 		VARCHAR(128),
    videoAds_topic 	VARCHAR(50),
    videoAds_url 	VARCHAR(2083),
    CONSTRAINT pk_VAtopic PRIMARY KEY (videoAdsID, videoAds_topic, videoAds_url(50)),
    CONSTRAINT fk_VAtopic_videoAdsID FOREIGN KEY (videoAdsID) REFERENCES VideoAds(videoAdsID)
);

CREATE TABLE IF NOT EXISTS VideoAds_placement (
    videoAdsID			VARCHAR(128),
    videoAds_placement	TIME,
    CONSTRAINT pk_VAplacement PRIMARY KEY (videoAdsID, videoAds_placement),
    CONSTRAINT fk_VAplacement_videoAdsID FOREIGN KEY (videoAdsID) REFERENCES VideoAds(videoAdsID)
);

CREATE TABLE IF NOT EXISTS VideoAds_keyword (
    videoAdsID 				VARCHAR(128),
    videoAds_keyword 		VARCHAR(50),
    videoAds_keywordTimes	INT,
    CONSTRAINT pk_VAkeyword PRIMARY KEY (videoAdsID, videoAds_keyword, videoAds_keywordTimes),
    CONSTRAINT fk_VAkeyword_videoAdsID FOREIGN KEY (videoAdsID) REFERENCES VideoAds(videoAdsID)
);

CREATE TABLE IF NOT EXISTS Appear_VideoAds (
    videoID 		VARCHAR(128),
    videoAdsID 		VARCHAR(128),
    videoAdsViews	INT,
	CONSTRAINT pk_AppearVA PRIMARY KEY (videoID, videoAdsID),
    CONSTRAINT fk_AppearVA_videoID FOREIGN KEY (videoID) REFERENCES Video(videoID),
    CONSTRAINT fk_AppearVA_videoAdsID FOREIGN KEY (videoAdsID) REFERENCES VideoAds(videoAdsID)
);
