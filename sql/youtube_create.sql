DROP DATABASE IF EXISTS youtube; 
CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;

CREATE TABLE IF NOT EXISTS Viewer (
    ID varchar(128) 			PRIMARY KEY,
    profilePhoto varchar(128),
    displayName varchar(128)	NOT NULL,
    lastLogin date				NOT NULL,
    createdDate date			NOT NULL
);

-- Create the Google Account table
CREATE TABLE IF NOT EXISTS GoogleAccount (
    ID varchar(128) 				PRIMARY KEY,
    googleAccountEmail varchar(100)	NOT NULL,
    phoneNumber varchar(10),
    recoveryEmail varchar(100),
    gender char(1)					NOT NULL,
    CONSTRAINT chk_gender CHECK (gender IN ('M', 'F'))
);

-- Create the Google_billingInfo table
CREATE TABLE IF NOT EXISTS GoogleAcct_billingInfo (
    googleAcctID varchar(128),
    googleAcct_cardType varchar(20),
    googleAcct_cardNumber varchar(16),
	PRIMARY KEY (googleAcctID, googleAcct_cardType, googleAcct_cardNumber),
	FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

-- Create the Google_address table
CREATE TABLE IF NOT EXISTS GoogleAcct_address (
    googleAcctID varchar(128),
    googleAcct_addressNumber varchar(20),
    googleAcct_postCode varchar(10),
    googleAcct_district varchar(50),
    googleAcct_province varchar(50),
    googleAcct_road varchar(100),
    PRIMARY KEY (googleAcctID, googleAcct_addressNumber, googleAcct_postCode, googleAcct_district, googleAcct_province, googleAcct_road),
    FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

-- Create the Google Ads Account table
CREATE TABLE IF NOT EXISTS GoogleAdsAccount (
    googleAdsAcctID varchar(128) 	PRIMARY KEY,
    googleAcctID varchar(128) 		NOT NULL,
    FOREIGN KEY (googleAcctID) REFERENCES GoogleAccount(ID)
);

-- Create the GoogleAds_linkedAccount table
CREATE TABLE IF NOT EXISTS GoogleAdsAcct_linkedAccount (
    googleAdsAcctID varchar(128),
    googleAdsAcct_linkedAccount varchar(125) NOT NULL,
    PRIMARY KEY (googleAdsAcctID, googleAdsAcct_linkedAccount),
    FOREIGN KEY (googleAdsAcctID) REFERENCES GoogleAdsAccount(googleAdsAcctID)
);

CREATE TABLE Channel_Creator (
    ID VARCHAR(128) PRIMARY KEY,
    publishedAt TIME,
    customUrl VARCHAR(128),
    description VARCHAR(150),
    brandingSettings VARCHAR(128),
    overallGoodStanding VARCHAR(128),
    communityGuidelines VARCHAR(128),
    copyrightStrikes VARCHAR(128),
    contentIdClaims VARCHAR(128),
    contentOwnerDetails VARCHAR(128),
    localizations VARCHAR(128),
    title VARCHAR(50),
    topicDetails VARCHAR(128),
    privacyStatus VARCHAR(128),
    likePlaylist VARCHAR(128),
    uploadPlaylist VARCHAR(128),
    thumbnails VARCHAR(128),
    googleID VARCHAR(128),
	CONSTRAINT fk_channel_creator_google FOREIGN KEY (googleID) REFERENCES GoogleAccount(ID)
);


CREATE TABLE Video (
    videoID VARCHAR(128) PRIMARY KEY,
    publishedAt VARCHAR(128),
    title VARCHAR(50),
    description VARCHAR(128),
    thumbnails VARCHAR(128),
    caption VARCHAR(255),
    duration TIME,
    dimension VARCHAR(128),
    status BOOLEAN,
    visibility BOOLEAN,
    fileDetails VARCHAR(128),
    suggestions VARCHAR(128),
    localizations VARCHAR(128),
    channelID VARCHAR(128),
    CONSTRAINT fk_video_channel FOREIGN KEY (channelID) REFERENCES Channel_Creator(ID)
);

CREATE TABLE IF NOT EXISTS YPP (
    channelID varchar(128),
    YPPID varchar(128) NOT NULL,
    eligibilityStatus boolean,
PRIMARY KEY (channelID,YPPID),
    FOREIGN KEY (channelID) REFERENCES Channel_Creator(ID)
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

CREATE TABLE IF NOT EXISTS Subscribe (
    channelID varchar(128),
    subscriberID varchar(128),
    subscriptionDate date,
    PRIMARY KEY (channelID, subscriberID),
    FOREIGN KEY (channelID) REFERENCES Channel_Creator(ID),
    FOREIGN KEY (subscriberID) REFERENCES Channel_Creator(ID)
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

CREATE TABLE IF NOT EXISTS Video_Tags (
    videoID varchar(128),
    videoTags varchar(128),
    PRIMARY KEY (videoID, videoTags),
    FOREIGN KEY (videoID) REFERENCES Video(videoID)
);
CREATE TABLE Revenue_Receiving_Method (
    methodName varchar(128) 	NOT NULL UNIQUE PRIMARY KEY,
    isThirdParty boolean 		NOT NULL
);

CREATE TABLE RRM_paymentOption (
    methodName varchar(128) 		NOT NULL,
    RRMpaymentOption varchar(50)	NOT NULL,
    CONSTRAINT pk_RRMpaymentOption PRIMARY KEY (methodName, RRMpaymentOption),
    CONSTRAINT fk_RRMpaymentOptionMethodName FOREIGN KEY (methodName) REFERENCES Revenue_Receiving_Method(methodName)
);

CREATE TABLE Choose_RRM (
    channelID varchar(128)		NOT NULL,
    YPPID varchar(128) 			NOT NULL,
    RRMMethodName varchar(128)	NOT NULL,
    addressNumber varchar(10)	NOT NULL,
    road varchar(100),
    district varchar(100)		NOT NULL,
    province varchar(100)		NOT NULL,
    postalCode varchar(10)		NOT NULL,
    CONSTRAINT pk_ChooseRRM PRIMARY KEY (channelID, YPPID, RRMMethodName),
    CONSTRAINT fk_ChooseRRMYPP FOREIGN KEY (channelID, YPPID) REFERENCES YPP(channelID, YPPID),
	CONSTRAINT fk_ChooseRRMMethodName FOREIGN KEY (RRMMethodName) REFERENCES Revenue_Receiving_Method(methodName)
);

CREATE TABLE Monetization_Feature (
    featureName varchar(128)	NOT NULL UNIQUE PRIMARY KEY,
    description varchar(500)	NOT NULL
);

CREATE TABLE MF_requirement (
    featureName varchar(128) 	NOT NULL,
    MFrequirement varchar(500)	NOT NULL,
    CONSTRAINT pk_MFrequirement PRIMARY KEY (featureName, MFrequirement),
    CONSTRAINT fk_MFrequirementFeatureName FOREIGN KEY (featureName) REFERENCES Monetization_Feature(featureName)
);

CREATE TABLE Manage_MF (
    channelID varchar(128)		NOT NULL,
    YPPID varchar(128) 			NOT NULL,
    MFFeatureName varchar(128)	NOT NULL,
    isEnable boolean			NOT NULL,
    CONSTRAINT pk_ManageMF PRIMARY KEY (channelID, YPPID, MFFeatureName),
    CONSTRAINT fk_ManageMFYPP FOREIGN KEY (channelID, YPPID) REFERENCES YPP(channelID, YPPID),
    CONSTRAINT fk_ManageMFFeatureName FOREIGN KEY (MFFeatureName) REFERENCES Monetization_Feature(featureName)
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
