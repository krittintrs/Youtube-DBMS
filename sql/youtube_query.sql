-- Query 41
USE youtube;
SELECT
	featureName,
    description
FROM Monetization_Feature
WHERE featureName IN (
	SELECT MFFeatureName
	FROM Manage_MF
	WHERE YPPID = 'YPPID001' AND isEnable = true
);

-- Query 42
SELECT
	featureName,
    GROUP_CONCAT(MFrequirement SEPARATOR ', ') AS all_requirements
FROM MF_requirement
GROUP BY featureName;

-- Query 43
SELECT
	c.RRMMethodName,
    CONCAT(c.addressNumber, ' ', c.road, ', ', c.district, ', ', c.province, ', ', c.postalCode) AS full_address
FROM Choose_RRM AS c
INNER JOIN Revenue_Receiving_Method AS r
	ON c.RRMMethodName = r.methodName
WHERE c.YPPID = 'YPPID010' AND r.isThirdParty = true;

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
    v.dimension,
    v.visibility,
    v.localizations,
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
    v.dimension,
    v.visibility,
    v.localizations,
    a.videoAdsViews
FROM Appear_Ads AS A
INNER JOIN Video AS V
	ON A.videoID = V.videoID
WHERE videoAdsID IN (
	SELECT videoAdsID 
    FROM `Video Ads` 
    WHERE googleAdsID = 'ads_acc_4'
)
ORDER BY a.videoAdsViews DESC
LIMIT 1;

-- Query 47
SELECT 
	VIDEOADSkeywords,
    AVG(times) AS average_times
FROM VideoAds_keywords 
WHERE videoAdsID in (
	SELECT videoAdsID
	FROM `Video Ads`
	WHERE targetLocation = 'Thailand'
)
GROUP BY VIDEOADSkeywords
ORDER BY average_times DESC;

-- Query 48
SELECT
	authorDisplayName,
    textOriginal,
    textDisplay,
    likeCounts,
    viewerRating,
    updateTime
FROM Comments
WHERE channelID IN (
	SELECT C.ID 
	FROM Channel_Creator AS C
	INNER JOIN Viewer AS V
		ON C.ID = V.ID
	WHERE V.lastLogin > '2022-10-10'
) AND moderationStatus = 'Pending'
ORDER BY updateTime;

-- Query 49
SELECT 
	C.title,
    C.description,
    C.brandingSettings,
    C.contentOwnerDetails,
    C.localizations,
    C.topicDetails,
    highRatedComment.number_of_comments
FROM Channel_Creator AS C
INNER JOIN (
	SELECT 
		channelID, 
        COUNT(channelID) AS number_of_comments
	FROM Comments 
    WHERE viewerRating LIKE '4%' OR viewerRating LIKE '5%' 
    GROUP BY channelID
) AS highRatedComment
	ON C.ID = highRatedComment.channelID
ORDER BY highRatedComment.number_of_comments DESC;

-- Query 50


