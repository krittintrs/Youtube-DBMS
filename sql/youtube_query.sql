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
    v.suggestions,
    v.localizations,
    SUM(isSaved) AS saved, 
    SUM(isDisliked) AS dislike, 
    SUM(isLiked) AS `like`
FROM Engage AS e
INNER JOIN Video AS v
ON e.videoID = v.videoID
GROUP BY e.videoID
HAVING `like` > dislike
ORDER BY `like` DESC;

-- Query 46
-- Query 47
-- Query 48
-- Query 49
-- Query 50
SELECT * FROM GoogleAccount;
SELECT * FROM Viewer;
SELECT * FROM Channel_Creator;
SELECT * FROM video;
