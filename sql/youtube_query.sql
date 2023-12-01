-- Query 1
SELECT 
    VideoAds.videoAdsID,
    VideoAds.videoFormatType,
    VideoAds.targetLocation,
    VideoAds.targetLanguage,
    Appear_VideoAds.videoAdsViews 
FROM 
    VideoAds
INNER JOIN 
    Appear_VideoAds ON VideoAds.videoAdsID = Appear_VideoAds.videoAdsID
WHERE 
	targetLocation = 'United Kingdom' AND videoAdsViews > 8000;

-- Query 2
SELECT 
    VideoAds.videoAdsID,
    VideoAds_keyword.VideoAds_keyword,
    VideoAds.objective,
    VideoAds.videoFormatType
FROM 
    VideoAds
INNER JOIN 
    VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
WHERE 
	VideoAds_keyword.VideoAds_keyword = 'travel' AND videoFormatType = 'Skippable video ads';

-- Query 3
SELECT 
    VideoAds.videoAdsID,
    VideoAds.targetLocation,
    VideoAds.length,
    VideoAds.budget
FROM 
    VideoAds
WHERE 
    length > '00:00:15'
ORDER BY
    VideoAds.length;

-- Query 4
SELECT 
    VideoAds.googleAdsAcctID,
    VideoAds.videoAdsID,
	VideoAds_keyword.VideoAds_keyword,
    VideoAds.budget
FROM 
    VideoAds
INNER JOIN 
    VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
INNER JOIN 
    GoogleAdsAccount ON VideoAds.googleAdsAcctID = GoogleAdsAccount.googleAdsAcctID
WHERE 
    VideoAds_keyword.VideoAds_keyword <> 'technology';

-- Q5
SELECT 
    GoogleAdsAccount.googleAdsAcctID,
    VideoAds.videoAdsID,
    VideoAds.targetLocation,
    Appear_VideoAds.videoAdsViews
FROM 
    VideoAds
INNER JOIN 
     Appear_VideoAds ON VideoAds.videoAdsID =  Appear_VideoAds.videoAdsID
INNER JOIN 
    GoogleAdsAccount ON VideoAds.googleAdsAcctID = GoogleAdsAccount.googleAdsAcctID
WHERE
    VideoAds.targetLocation = 'Germany' AND videoAdsViews > 10000;

-- Query 6
SELECT
    VideoAds.videoAdsID,
    VideoAds_keyword.videoAds_keyword,
    VideoAds.Length,
    Appear_VideoAds.videoAdsViews
FROM
    VideoAds
INNER JOIN
    Appear_VideoAds ON VideoAds.videoAdsID =  Appear_VideoAds.videoAdsID
INNER JOIN
    VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
WHERE
   length > '00:00:20' AND videoAdsViews > 12000
ORDER BY
    Appear_VideoAds.videoAdsViews DESC;

-- Query 7
SELECT
    VideoAds.videoAdsID,
    VideoAds_topic.videoAds_topic,
    VideoAds_keyword.videoAds_keyword
FROM
    VideoAds
INNER JOIN
    VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
INNER JOIN
    VideoAds_topic ON VideoAds.videoAdsID = VideoAds_topic.videoAdsID;

-- Query 8
SELECT
    VideoAds.videoAdsID,
    VideoAds.budget,
    Appear_VideoAds.videoAdsViews
FROM
    VideoAds 
JOIN
    Appear_VideoAds ON VideoAds.videoAdsID = Appear_VideoAds.videoAdsID
ORDER BY
   VideoAds.budget ASC;

-- Query 9
SELECT
    VideoAds.videoFormatType,
    VideoAds.budget,
    VideoAds.objective
FROM
    VideoAds 
WHERE
    VideoAds.videoFormatType = 'Skippable video ads'
ORDER BY
	VideoAds.budget ASC;

-- Query 10
SELECT
    VideoAds_placement.videoAdsID,
    VideoAds_placement.videoAds_placement,
    VideoAds_keyword.videoAds_keyword
FROM
    VideoAds 
JOIN
    VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
JOIN
    VideoAds_placement ON VideoAds.videoAdsID = VideoAds_placement.videoAdsID;

-- Query 11
SELECT
	distinct a.googleAcct_addressNumber, 
	a.googleAcct_district
FROM
	GoogleAccount g
JOIN 
	GoogleAcct_address a on g.id = a.googleAcctID
WHERE 
	a.googleAcct_province = 'Bangkok';

-- Query 12
SELECT 
	COUNT(DISTINCT g.googleAccountEmail) AS count_no_address
FROM
	GoogleAccount g
LEFT JOIN 
	GoogleAcct_address a on g.id = a.googleAcctID
WHERE
	a.googleAcct_province IS NULL;

-- Query 13
SELECT
	a.googleAdsAcctID, 
    SUM(v.budget) AS Total_budget
From
	googleAdsAccount a
JOIN
	VideoAds v ON v.googleAdsAcctID = a.googleAdsAcctID
GROUP BY
	a.googleAdsAcctID
ORDER BY Total_budget DESC;

-- Query 14
SELECT 
	addr.googleAcct_province,
	SUM(DISTINCT v.budget) AS total_budget
FROM
	GoogleAdsaccount ggads
JOIN
	VideoAds v ON v.googleAdsAcctID = ggads.googleAdsAcctID
JOIN
	GoogleAcct_address addr ON addr.googleAcctID = ggads.googleAcctID
GROUP BY
	addr.googleAcct_province
ORDER BY
	total_budget DESC;
    
-- Query 15
SELECT 
    v.videoAdsID,
    v.length,
    v.budget AS min_budget
FROM 
    VideoAds v
JOIN 
    GoogleAdsaccount ggads ON ggads.googleAdsAcctID = v.googleAdsAcctID
JOIN 
    GoogleAcct_address addr ON addr.googleAcctID = ggads.googleAcctID
WHERE 
	addr.googleAcct_province LIKE 'Bangkok'
ORDER BY 
    v.budget
LIMIT 1;

-- Query 16
SELECT 
    addr.googleAcct_province,
    COUNT(DISTINCT CASE WHEN v.videoFormatType = 'Skippable video ads' THEN v.videoAdsID END) AS skippableAds,
    COUNT(DISTINCT CASE WHEN v.videoFormatType = 'Non-skippable video ads' THEN v.videoAdsID END) AS nonSkippableAds,
    Count(DISTINCT CASE WHEN v.videoFormatType = 'Bumper ads' THEN v.videoAdsID END) AS bumperAds
FROM
    GoogleAcct_address addr
JOIN
    GoogleAdsaccount ggads ON ggads.googleAcctID = addr.googleAcctID
JOIN (
    SELECT DISTINCT googleAdsAcctID, videoAdsID, videoFormatType
    FROM VideoAds
) v ON v.googleAdsAcctID = ggads.googleAdsAcctID
GROUP BY
    addr.googleAcct_province;

-- Query 17
SELECT
    g.googleAccountEmail,
    c.title AS ChannelTitle,
    SUM(s.ViewDuration) AS SumViewDuration
FROM
    GoogleAccount g
JOIN
    ChannelCreator c ON g.ID = c.googleAcctID
JOIN
    Video v ON v.channelID = c.ID
JOIN
    (
        SELECT
            v.videoID,
            COUNT(e.viewerID) AS ViewCount,
            SUM(e.watchDuration) AS ViewDuration
        FROM
            engage e
        JOIN
            video v ON e.videoID = v.videoID
        GROUP BY
            v.videoID
    ) s ON s.VideoID = v.videoID
GROUP BY
    g.googleAccountEmail, c.title
ORDER BY
    SumViewDuration DESC;

-- Query 18
SELECT
    g.googleAccountEmail,
    c.title AS ChannelTitle,
    MAX(s.ViewDuration) AS MaxViewDuration
FROM
    GoogleAccount g
JOIN
    ChannelCreator c ON g.ID = c.googleAcctID
JOIN
    Video v ON v.channelID = c.ID
JOIN
    (
        SELECT
            v.videoID,
            SUM(e.watchDuration) AS ViewDuration
        FROM
            engage e
        JOIN
            video v ON e.videoID = v.videoID
        GROUP BY
            v.videoID
    ) s ON s.VideoID = v.videoID
GROUP BY
    g.googleAccountEmail, c.title
ORDER BY
    MaxViewDuration DESC;

-- Query 19
SELECT 
    DISTINCT g.GoogleAcct_cardType AS cardType, 
    count(g.GoogleAcct_cardType) AS cardTypeCount
FROM GoogleAcct_billingInfo g
GROUP BY cardType;

-- Query 20
SELECT 
    c.title, 
    SUM(vads.budget) AS TotalBudget,
    ANY_VALUE(t.Subcount) AS MaxSubcount
FROM 
    (
        SELECT
            c.ID AS ChannelID,
            COUNT(s.subscriberID) AS SubCount
        FROM
            ChannelCreator c
        JOIN
            Subscribe s ON c.ID = s.subscriberID
        GROUP BY
            c.ID
    ) t
JOIN ChannelCreator c ON c.ID = t.ChannelID
JOIN GoogleAdsAccount a ON a.googleAcctID = c.googleAcctID
LEFT JOIN VideoAds vads ON vads.googleAdsAcctID = a.googleAdsAcctID
GROUP BY 
    c.title
ORDER BY
    TotalBudget DESC;


-- Query 41
USE youtube;
SELECT
	featureName,
    description
FROM MonetizationFeature
WHERE featureName IN (
	SELECT mntFeature_featureName
	FROM Manage_MntFeature
	WHERE YPP_YPPID = 'YPP3456789012' AND isEnable = true
);

-- Query 42
SELECT
	featureName,
    GROUP_CONCAT(mntFeature_requirement SEPARATOR ', ') AS all_requirements
FROM MntFeature_requirement
GROUP BY featureName;

-- Query 43
SELECT
	c.RRMethod_methodName,
    CONCAT(c.addressNumber, ' ', c.road, ', ', c.district, ', ', c.province, ', ', c.country, ', ', c.postalCode) AS full_address
FROM Choose_RRMethod AS c
INNER JOIN RevenueReceivingMethod AS r
	ON c.RRMethod_methodName = r.methodName
WHERE c.YPP_YPPID = 'YPP7890123456' AND r.isThirdParty = true;

-- Query 44
SELECT 
	v.ID,
	v.displayName,
    g.googleAccountEmail,
    g.phoneNumber,
    g.recoveryEmail,
	DATEDIFF(NOW(), createdDate) AS create_duration
FROM Viewer AS V
INNER JOIN GoogleAccount AS G
	ON V.ID = G.ID
ORDER BY create_duration DESC
LIMIT 3;

-- Query 45
SELECT 
    v.title,
    v.description,
    v.caption,
    v.duration,
    v.visibility,
    v.license,
    v.madeForKids,
    SUM(isSaved) AS saved, 
    SUM(isDisliked) AS disliked, 
    SUM(isLiked) AS liked
FROM Engage AS e
INNER JOIN Video AS v
	ON e.videoID = v.videoID
GROUP BY e.videoID
HAVING liked > disliked
ORDER BY liked DESC;

-- Query 46
SELECT
	v.title,
    v.description,
    v.caption,
    v.duration,
    v.visibility,
    v.license,
    v.madeForKids,
    a.videoAdsViews
FROM Appear_VideoAds AS A
INNER JOIN Video AS V
	ON A.videoID = V.videoID
WHERE videoAdsID IN (
	SELECT videoAdsID 
    FROM VideoAds 
    WHERE googleAdsAcctID = 'm9n0o1p2q3r4s5t'
)
ORDER BY a.videoAdsViews DESC
LIMIT 1;

-- Query 47
SELECT 
	videoAds_keyword,
    AVG(videoAds_keywordTimes) AS average_times
FROM VideoAds_keyword
WHERE videoAdsID in (
	SELECT videoAdsID
	FROM VideoAds
	WHERE targetLocation = 'United States'
)
GROUP BY VideoAds_keyword
ORDER BY average_times DESC;

-- Query 48
SELECT
	authorDisplayName,
    textOriginal,
    textDisplay,
    likeCounts,
    isPinned,
    updatedAt
FROM Comment
WHERE channelID IN (
	SELECT C.ID 
	FROM ChannelCreator AS C
	INNER JOIN Viewer AS V
		ON C.ID = V.ID
	WHERE V.lastLogin > '2023-11-18'
)
ORDER BY updatedAt;

-- Query 49
SELECT 
	C.title,
    C.description,
    C.defaultLanguage,
    C.country,
    C.privacyStatus,
    C.topicDetails,
    highRatedComment.likeCounts
FROM ChannelCreator AS C
INNER JOIN (
	SELECT 
		channelID, 
        likeCounts
	FROM Comment
    WHERE likeCounts > 30
) AS highRatedComment
	ON C.ID = highRatedComment.channelID
ORDER BY highRatedComment.likeCounts DESC;

-- Query 50
SELECT 
	vid.videoID,
    vid.title,
    vid.description,
    v.displayName AS viewer,
    e.usedDevice,
    e.watchAt
FROM Video AS vid
INNER JOIN Engage AS e
	ON vid.videoID = e.videoID
INNER JOIN Viewer AS v
	ON e.viewerID = v.ID
WHERE channelID IN (
	SELECT ID
	FROM ChannelCreator 
	WHERE topicDetails = "Lifestyle"
);