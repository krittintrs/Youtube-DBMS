-- Select database
USE youtube;

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

-- Query 21
SELECT
    ID AS viewerID,
    displayName as Name,
    lastLogin as "Last Logged In",
    DATEDIFF(NOW(), COALESCE(lastLogin, createdDate)) AS inactiveDays
FROM
    Viewer
WHERE
    lastLogin < DATE_SUB(NOW(), INTERVAL 15 DAY);

-- Query 22
SELECT
    v.videoID,
    v.title,
    e.watchDuration
FROM
    Video v
JOIN
    Engage e ON v.videoID = e.videoID
WHERE
    e.isLiked = true
    AND e.watchDuration > '00:08:00';

-- Query 23
SELECT
    v.videoID,
    v.title
FROM
    Video v
JOIN
    Video_tag vt ON v.videoID = vt.videoID
WHERE
    vt.video_tag = 'cooking';

-- Query 24
SELECT
    cc.ID AS channelID,
    cc.title AS channelName,
    y.acceptedAt
FROM
    ChannelCreator cc
JOIN
    YPP y ON cc.ID = y.channelID
WHERE
	y.acceptedAt < '2023-07-01 00:00:00';

-- Query 25
SELECT
    cc.ID AS channelID,
    cc.title AS channelName,
    COUNT(s.subscriberID) AS numSubscribers
FROM
    ChannelCreator cc
LEFT JOIN
    Subscribe s ON cc.ID = s.channelID
GROUP BY
    cc.ID, cc.title
ORDER BY
    numSubscribers DESC;

-- Query 26
SELECT
    v.viewerID,
    ve.displayName AS viewerName,
    v.videoID,
    vi.title AS videoName,
    vt.video_tag
FROM
    Engage v
JOIN
    Viewer ve ON v.viewerID = ve.ID
JOIN
    Video vi ON v.videoID = vi.videoID
JOIN
    Video_tag vt ON v.videoID = vt.videoID
WHERE
    v.isLiked = true
    AND vt.video_tag = 'Travel';

-- Query 27
SELECT
    s.subscriberID AS subscriberChannelID,
    cc.title AS subscriberChannelName,
    COUNT(DISTINCT s.channelID) AS numSubscribedChannels
FROM
    Subscribe s
JOIN
    ChannelCreator cc ON s.subscriberID = cc.ID
LEFT OUTER JOIN
    YPP y ON s.channelID = y.channelID
WHERE
    y.YPPID IS NULL
GROUP BY
    s.subscriberID, cc.title;

-- Query 28
SELECT
    e.videoID,
    v.title AS videoTitle,
    SUM(e.watchDuration) AS totalWatchDuration
FROM
    Engage e
JOIN
    Video v ON e.videoID = v.videoID
GROUP BY
    e.videoID, v.title
ORDER BY
    totalWatchDuration DESC
LIMIT 1;

-- Query 29
SELECT
    e.viewerID,
    v.displayName AS viewerName,
    GROUP_CONCAT(DISTINCT e.usedDevice ORDER BY e.usedDevice SEPARATOR ', ')  AS nameOfDevices,
    COUNT(DISTINCT e.usedDevice) AS numDevicesUsed
FROM
    Engage e
JOIN
    Viewer v ON e.viewerID = v.ID
GROUP BY
    e.viewerID, v.displayName;

-- Query 30
SELECT
    v.videoID,
    v.title AS videoTitle,
    COUNT(DISTINCT e.viewerID) AS numUniqueViewers,
    CASE
        WHEN COUNT(DISTINCT e.viewerID) >= 100 THEN 'High Engagement'
        WHEN COUNT(DISTINCT e.viewerID) >= 50 THEN 'Moderate Engagement'
        ELSE 'Low Engagement'
    END AS engagementLevel
FROM
    Video v
JOIN
    Engage e ON v.videoID = e.videoID
GROUP BY
    v.videoID, v.title
ORDER BY
    numUniqueViewers DESC;

-- Query 40
SELECT 
	v.displayName,
    CASE 
		WHEN (c.ID IS NULL AND g.ID IS NOT NULL) THEN 'Channel''s Creator'
		WHEN (c.ID IS NOT NULL AND g.ID IS NULL) THEN 'Google Account'
        ELSE 'Viewer'
	END AS viewerType,
    COUNT(DISTINCT e.videoID) AS totalVideo,
    AVG(e.watchDuration) AS avgWatchDuration,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(watchAt))), '%H:%i') AS averageWatchTime,
    GROUP_CONCAT(DISTINCT vt.video_tag SEPARATOR ', ') AS videoTopics
FROM Viewer AS v
LEFT OUTER JOIN ChannelCreator AS c
	ON v.ID = c.ID
LEFT OUTER JOIN GoogleAccount AS g
	ON v.ID = g.ID
JOIN Engage AS e
	ON v.ID = e.viewerID
JOIN (
    SELECT
        vt.videoID,
        vt.video_tag
    FROM Video_tag vt
) AS vt ON e.videoID = vt.videoID
GROUP BY v.ID
HAVING totalVideo > 1
ORDER BY totalVideo DESC;

-- Query 41
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
    v.duration,
	v.dimension,
    v.visibility,
    v.license,
    v.madeForKids AS kids,
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
	v.title AS videoTitle,
    v.duration,
    v.dimension,
    v.description,
    c.title AS creator,
    a.videoAdsViews
FROM Appear_VideoAds AS A
INNER JOIN Video AS V
	ON A.videoID = V.videoID
INNER JOIN ChannelCreator AS C
	ON V.channelID = C.ID
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
	v.displayName,
    g.gender,
    g.googleAccountEmail,
    COUNT(channelStat.channelTitle) AS totalChannel,
    COALESCE(SUM(channelStat.videoCount), 0) AS totalVideo,
    COALESCE(SUM(channelStat.watchCount), 0) AS totalWatch
FROM GoogleAccount AS g
LEFT OUTER JOIN (
	SELECT 
		c.googleAcctID,
		c.title AS channelTitle,
		COUNT(DISTINCT v.videoID) AS videoCount,
		COUNT(e.videoID) AS watchCount
	FROM ChannelCreator AS c
	LEFT OUTER JOIN Video AS v
		ON v.channelID = c.ID
	LEFT OUTER JOIN Engage AS e
		ON v.videoID = e.videoID
	GROUP BY c.ID
) AS channelStat
	ON g.ID = channelStat.googleAcctID
INNER JOIN Viewer AS v
	ON g.ID = v.ID
GROUP BY g.ID
ORDER BY
	totalChannel DESC,
    totalVideo DESC,
    totalWatch DESC;

-- Query 49
SELECT 
	C.title AS commenter,
    C.topicDetails AS commenterTopics,
    v.title AS videoTitle,
    (SELECT GROUP_CONCAT(video_tag SEPARATOR ', ') FROM Video_tag WHERE videoID = V.videoID) AS videoTags,
    highRatedComment.textOriginal,
    highRatedComment.likeCounts
FROM ChannelCreator AS C
INNER JOIN (
	SELECT 
		channelID, 
        videoID,
        textOriginal,
        likeCounts
	FROM Comment
    WHERE likeCounts > 30
) AS highRatedComment
	ON C.ID = highRatedComment.channelID
INNER JOIN Video AS V
	ON highRatedComment.videoID = V.videoID
ORDER BY highRatedComment.likeCounts DESC;

-- Query 50
SELECT 
	vid.videoID,
    vid.title,
    vid.duration,
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
