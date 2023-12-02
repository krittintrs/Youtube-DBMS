USE youtube;

-- Basic Query 1: The list of video ads which has target in United Kingdom and has views more than 8,000 views
SELECT
    VideoAds.videoAdsID,
    VideoAds.videoFormatType,
    VideoAds.targetLocation,
    VideoAds.targetLanguage,
    Appear_VideoAds.videoAdsViews
FROM
    VideoAds
    INNER JOIN Appear_VideoAds ON VideoAds.videoAdsID = Appear_VideoAds.videoAdsID
WHERE
    targetLocation = 'United Kingdom'
    AND videoAdsViews > 8000;

-- Basic Query 2: The list of video ads and their objective that is skippable and using keyword travel
SELECT
    VideoAds.videoAdsID,
    VideoAds_keyword.VideoAds_keyword,
    VideoAds.objective,
    VideoAds.videoFormatType
FROM
    VideoAds
    INNER JOIN VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
WHERE
    VideoAds_keyword.VideoAds_keyword = 'travel'
    AND videoFormatType = 'Skippable video ads';

-- Basic Query 3: The list of video ads which has length more than 15 seconds
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

-- Basic Query 4: The list of video ads which was not used keyword technology    
SELECT
    VideoAds.googleAdsAcctID,
    VideoAds.videoAdsID,
    VideoAds_keyword.VideoAds_keyword,
    VideoAds.budget
FROM
    VideoAds
    INNER JOIN VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
    INNER JOIN GoogleAdsAccount ON VideoAds.googleAdsAcctID = GoogleAdsAccount.googleAdsAcctID
WHERE
    VideoAds_keyword.VideoAds_keyword <> 'technology';

-- Basic Query 5: The table of video ads that is targeted in Germany and has view more than 10,000 views
SELECT
    GoogleAdsAccount.googleAdsAcctID,
    VideoAds.videoAdsID,
    VideoAds.targetLocation,
    Appear_VideoAds.videoAdsViews
FROM
    VideoAds
    INNER JOIN Appear_VideoAds ON VideoAds.videoAdsID = Appear_VideoAds.videoAdsID
    INNER JOIN GoogleAdsAccount ON VideoAds.googleAdsAcctID = GoogleAdsAccount.googleAdsAcctID
WHERE
    VideoAds.targetLocation = 'Germany'
    AND videoAdsViews > 10000;

-- Basic Query 6: The list of relation between budget and a number of views
SELECT
    VideoAds.videoAdsID,
    VideoAds_keyword.videoAds_keyword,
    VideoAds.Length,
    Appear_VideoAds.videoAdsViews
FROM
    VideoAds
    INNER JOIN Appear_VideoAds ON VideoAds.videoAdsID = Appear_VideoAds.videoAdsID
    INNER JOIN VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
WHERE
    length > '00:00:20'
    AND videoAdsViews > 12000
ORDER BY
    Appear_VideoAds.videoAdsViews DESC;

-- Basic Query 7: The list Skippable video ads information
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

-- Basic Query 8: The list of video’s keyword and their placement
SELECT
    VideoAds_placement.videoAdsID,
    VideoAds_placement.videoAds_placement,
    VideoAds_keyword.videoAds_keyword
FROM
    VideoAds
    JOIN VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
    JOIN VideoAds_placement ON VideoAds.videoAdsID = VideoAds_placement.videoAdsID;

-- Basic Query 9: The list of google accounts that have address in ‘Bangkok’
SELECT
    distinct a.googleAcct_addressNumber,
    a.googleAcct_district
FROM
    GoogleAccount g
    JOIN GoogleAcct_address a on g.id = a.googleAcctID
WHERE
    a.googleAcct_province = 'Bangkok';

-- Basic Query 10: The number of google account that doesn’t have address
SELECT
    COUNT(DISTINCT g.googleAccountEmail) AS count_no_address
FROM
    GoogleAccount g
    LEFT JOIN GoogleAcct_address a on g.id = a.googleAcctID
WHERE
    a.googleAcct_province IS NULL;

-- Basic Query 11: The number of budget from each googleAdsAccount
SELECT
    a.googleAdsAcctID,
    SUM(v.budget) AS Total_budget
From
    googleAdsAccount a
    JOIN VideoAds v ON v.googleAdsAcctID = a.googleAdsAcctID
GROUP BY
    a.googleAdsAcctID
ORDER BY
    Total_budget DESC;

-- Basic Query 12: Analysis of Google Billing Information - Card Types Distribution
SELECT
    DISTINCT g.GoogleAcct_cardType AS cardType,
    count(g.GoogleAcct_cardType) AS cardTypeCount
FROM
    GoogleAcct_billingInfo g
GROUP BY
    cardType;

-- Basic Query 13: Inactive Viewer
SELECT
    ID AS viewerID,
    displayName as Name,
    lastLogin as "Last Logged In",
    DATEDIFF(NOW(), COALESCE(lastLogin, createdDate)) AS inactiveDays
FROM
    Viewer
WHERE
    lastLogin < DATE_SUB(NOW(), INTERVAL 15 DAY);

-- Basic Query 14: Like And Watch For Long Period
SELECT
    v.videoID,
    v.title,
    e.watchDuration
FROM
    Video v
    JOIN Engage e ON v.videoID = e.videoID
WHERE
    e.isLiked = true
    AND e.watchDuration > '00:08:00';

-- Basic Query 15: Cooking videos
SELECT
    v.videoID,
    v.title
FROM
    Video v
    JOIN Video_tag vt ON v.videoID = vt.videoID
WHERE
    vt.video_tag = 'cooking';

-- Basic Query 16: Early accepted channel to YPP
SELECT
    cc.ID AS channelID,
    cc.title AS channelName,
    y.acceptedAt
FROM
    ChannelCreator cc
    JOIN YPP y ON cc.ID = y.channelID
WHERE
    y.acceptedAt < '2023-07-01 00:00:00';

-- Basic Query 17: Subscriber count for channels
SELECT
    cc.ID AS channelID,
    cc.title AS channelName,
    COUNT(s.subscriberID) AS numSubscribers
FROM
    ChannelCreator cc
    LEFT JOIN Subscribe s ON cc.ID = s.channelID
GROUP BY
    cc.ID,
    cc.title
ORDER BY
    numSubscribers DESC;

-- Basic Query 18: Video with longest watch time
SELECT
    e.videoID,
    v.title AS videoTitle,
    SUM(e.watchDuration) AS totalWatchDuration
FROM
    Engage e
    JOIN Video v ON e.videoID = v.videoID
GROUP BY
    e.videoID,
    v.title
ORDER BY
    totalWatchDuration DESC
LIMIT
    1;

-- Basic Query 19: Viewer Devices
SELECT
    e.viewerID,
    v.displayName AS viewerName,
    GROUP_CONCAT(
        DISTINCT e.usedDevice
        ORDER BY
            e.usedDevice SEPARATOR ', '
    ) AS nameOfDevices,
    COUNT(DISTINCT e.usedDevice) AS numDevicesUsed
FROM
    Engage e
    JOIN Viewer v ON e.viewerID = v.ID
GROUP BY
    e.viewerID,
    v.displayName;

-- Basic Query 20: List of All Requirements for Each Monetization Feature
SELECT
    featureName,
    GROUP_CONCAT(mntFeature_requirement SEPARATOR ', ') AS all_requirements
FROM
    MntFeature_requirement
GROUP BY
    featureName;

-- Basic Query 21: List of Enabled Monetization Feature for YPP account with YPPID 'YPP3456789012'
SELECT
    featureName,
    description
FROM
    MonetizationFeature
WHERE
    featureName IN (
        SELECT
            mntFeature_featureName
        FROM
            Manage_MntFeature
        WHERE
            YPP_YPPID = 'YPP3456789012'
            AND isEnable = true
    );

-- Basic Query 22: Video Details
SELECT
    v.videoID,
    LEFT(v.title, 30) AS VideoTitle,
    LEFT(v.description, 30) AS VideoDescription,
    v.publishedAt AS VideoPublishedAt,
    LEFT(cc.title, 30) AS ChannelTitle,
    LEFT(cc.country, 30) AS ChannelCountry
FROM
    Video v
    JOIN ChannelCreator cc ON v.channelID = cc.ID;

-- Basic Query 23: Analysis of Channels and Their Violations Summary
SELECT
    cc.ID AS ChannelID,
    cc.title AS ChannelTitle,
    SUM(cc.communityGuidelines) AS TotalCommunityGuidelinesViolations,
    SUM(cc.copyrightStrikes) AS TotalCopyrightStrikes,
    SUM(mv.monetizationStatus) AS TotalMonetizationViolations
FROM
    ChannelCreator cc
    LEFT JOIN MonetizedVideo mv ON cc.ID = mv.YPP_channelID
GROUP BY
    cc.ID,
    cc.title;

-- Basic Query 24: Active Channels with Recent Activity
SELECT
    cc.ID AS ChannelID,
    cc.title AS ChannelTitle,
    MAX(v.publishedAt) AS LatestVideoPublished
FROM
    ChannelCreator cc
    LEFT JOIN Video v ON cc.ID = v.channelID
GROUP BY
    cc.ID,
    cc.title
HAVING
    LatestVideoPublished >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- Basic Query 25: Longest Videos and watched count
SELECT
    c.title AS `Channel Name`,
    v.title AS VideoTitle,
    v.duration,
    COUNT(e.videoID) AS `watch`
FROM
    Video v
    JOIN channelcreator c ON c.ID = v.channelID
    JOIN engage e ON e.videoID = v.videoID
GROUP BY
    `Channel Name`,
    VideoTitle,
    v.duration
ORDER BY
    v.duration DESC;

-- Basic Query 26: Video Licensing and Duration Characteristics for Strategic Insights
SELECT
    v.license,
    COUNT(v.videoID) AS VideoCount,
    AVG(TIME_TO_SEC(v.duration)) AS AvgDurationInSeconds
FROM
    Video v
GROUP BY
    v.license;

-- Advance Query 1: First Three Created Google Accounts Overview
SELECT
    v.ID,
    v.displayName,
    g.googleAccountEmail,
    g.phoneNumber,
    g.recoveryEmail,
    DATEDIFF(NOW(), createdDate) AS create_duration
FROM
    Viewer AS V
    INNER JOIN GoogleAccount AS G ON V.ID = G.ID
ORDER BY
    create_duration DESC
LIMIT
    3;

-- Advance Query 2: List of Videos with Positive Engagement Metrics
SELECT
    v.ID,
    v.displayName,
    g.googleAccountEmail,
    g.phoneNumber,
    g.recoveryEmail,
    DATEDIFF(NOW(), createdDate) AS create_duration
FROM
    Viewer AS V
    INNER JOIN GoogleAccount AS G ON V.ID = G.ID
ORDER BY
    create_duration DESC
LIMIT
    3;

-- Advance Query 3: Video with Highest Ads Views for Ads Created by Google Ads Account ID 'm9n0o1p2q3r4s5t'
SELECT
    v.title AS videoTitle,
    v.duration,
    v.dimension,
    v.description,
    c.title AS creator,
    a.videoAdsViews
FROM
    Appear_VideoAds AS A
    INNER JOIN Video AS V ON A.videoID = V.videoID
    INNER JOIN ChannelCreator AS C ON V.channelID = C.ID
WHERE
    videoAdsID IN (
        SELECT
            videoAdsID
        FROM
            VideoAds
        WHERE
            googleAdsAcctID = 'm9n0o1p2q3r4s5t'
    )
ORDER BY
    a.videoAdsViews DESC
LIMIT
    1;

-- Advance Query 4: Average Appearance Times of Keywords in USTargeted Video Ads
SELECT
    videoAds_keyword,
    AVG(videoAds_keywordTimes) AS average_times
FROM
    VideoAds_keyword
WHERE
    videoAdsID in (
        SELECT
            videoAdsID
        FROM
            VideoAds
        WHERE
            targetLocation = 'United States'
    )
GROUP BY
    VideoAds_keyword
ORDER BY
    average_times DESC;

-- Advance Query 5: Google Account Performance Overview
SELECT
    v.displayName,
    g.gender,
    g.googleAccountEmail,
    COUNT(channelStat.channelTitle) AS totalChannel,
    COALESCE(SUM(channelStat.videoCount), 0) AS totalVideo,
    COALESCE(SUM(channelStat.watchCount), 0) AS totalWatch
FROM
    GoogleAccount AS g
    LEFT OUTER JOIN (
        SELECT
            c.googleAcctID,
            c.title AS channelTitle,
            COUNT(DISTINCT v.videoID) AS videoCount,
            COUNT(e.videoID) AS watchCount
        FROM
            ChannelCreator AS c
            LEFT OUTER JOIN Video AS v ON v.channelID = c.ID
            LEFT OUTER JOIN Engage AS e ON v.videoID = e.videoID
        GROUP BY
            c.ID
    ) AS channelStat ON g.ID = channelStat.googleAcctID
    INNER JOIN Viewer AS v ON g.ID = v.ID
GROUP BY
    g.ID
ORDER BY
    totalChannel DESC,
    totalVideo DESC,
    totalWatch DESC;

-- Advance Query 6: List of High-Engagement Comments and Commenters
SELECT
    C.title AS commenter,
    C.topicDetails AS commenterTopics,
    v.title AS videoTitle,
    (
        SELECT
            GROUP_CONCAT(video_tag SEPARATOR ', ')
        FROM
            Video_tag
        WHERE
            videoID = V.videoID
    ) AS videoTags,
    highRatedComment.textOriginal,
    highRatedComment.likeCounts
FROM
    ChannelCreator AS C
    INNER JOIN (
        SELECT
            channelID,
            videoID,
            textOriginal,
            likeCounts
        FROM
            Comment
        WHERE
            likeCounts > 30
    ) AS highRatedComment ON C.ID = highRatedComment.channelID
    INNER JOIN Video AS V ON highRatedComment.videoID = V.videoID
ORDER BY
    highRatedComment.likeCounts DESC;

-- Advance Query 7: Viewer Engagement Analytics for Lifestyle Channel Videos
SELECT
    vid.videoID,
    vid.title,
    vid.duration,
    v.displayName AS viewer,
    e.usedDevice,
    e.watchAt
FROM
    Video AS vid
    INNER JOIN Engage AS e ON vid.videoID = e.videoID
    INNER JOIN Viewer AS v ON e.viewerID = v.ID
WHERE
    channelID IN (
        SELECT
            ID
        FROM
            ChannelCreator
        WHERE
            topicDetails = "Lifestyle"
    );

-- Advance Query 8: The list of video ads that longer than 20 seconds and views more than 12,000 views
SELECT
    VideoAds.videoAdsID,
    VideoAds_keyword.videoAds_keyword,
    VideoAds.Length,
    Appear_VideoAds.videoAdsViews
FROM
    VideoAds
    INNER JOIN Appear_VideoAds ON VideoAds.videoAdsID = Appear_VideoAds.videoAdsID
    INNER JOIN VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
WHERE
    length > '00:00:20'
    AND videoAdsViews > 12000
ORDER BY
    Appear_VideoAds.videoAdsViews DESC;

-- Advance Query 9: The list of topic and keyword from all video ads
SELECT
    VideoAds.videoAdsID,
    VideoAds_topic.videoAds_topic,
    VideoAds_keyword.videoAds_keyword
FROM
    VideoAds
    INNER JOIN VideoAds_keyword ON VideoAds.videoAdsID = VideoAds_keyword.videoAdsID
    INNER JOIN VideoAds_topic ON VideoAds.videoAdsID = VideoAds_topic.videoAdsID;

-- Advance Query 10: Analysis of Video Ads Budget Allocation Across Provinces
SELECT
    addr.googleAcct_province,
    SUM(DISTINCT v.budget) AS total_budget
FROM
    GoogleAdsaccount ggads
    JOIN VideoAds v ON v.googleAdsAcctID = ggads.googleAdsAcctID
    JOIN GoogleAcct_address addr ON addr.googleAcctID = ggads.googleAcctID
GROUP BY
    addr.googleAcct_province
ORDER BY
    total_budget DESC;

-- Advance Query 11: Analysis of Minimum Budget Allocation for Video Ads in Bangkok
SELECT
    v.videoAdsID,
    v.length,
    v.budget AS min_budget
FROM
    VideoAds v
    JOIN GoogleAdsaccount ggads ON ggads.googleAdsAcctID = v.googleAdsAcctID
    JOIN GoogleAcct_address addr ON addr.googleAcctID = ggads.googleAcctID
WHERE
    addr.googleAcct_province LIKE 'Bangkok'
ORDER BY
    v.budget
LIMIT
    1;

-- Advance Query 12: Analysis of Video Ad Formats Across Provinces
SELECT
    addr.googleAcct_province,
    COUNT(
        DISTINCT CASE
            WHEN v.videoFormatType = 'Skippable video ads' THEN v.videoAdsID
        END
    ) AS skippableAds,
    COUNT(
        DISTINCT CASE
            WHEN v.videoFormatType = 'Non-skippable video ads' THEN v.videoAdsID
        END
    ) AS nonSkippableAds,
    Count(
        DISTINCT CASE
            WHEN v.videoFormatType = 'Bumper ads' THEN v.videoAdsID
        END
    ) AS bumperAds
FROM
    GoogleAcct_address addr
    JOIN GoogleAdsaccount ggads ON ggads.googleAcctID = addr.googleAcctID
    JOIN (
        SELECT
            DISTINCT googleAdsAcctID,
            videoAdsID,
            videoFormatType
        FROM
            VideoAds
    ) v ON v.googleAdsAcctID = ggads.googleAdsAcctID
GROUP BY
    addr.googleAcct_province;

-- Advance Query 13: Analysis of Total View Duration for YouTube Channels
SELECT
    g.googleAccountEmail,
    c.title AS ChannelTitle,
    SUM(s.ViewDuration) AS SumViewDuration
FROM
    GoogleAccount g
    JOIN ChannelCreator c ON g.ID = c.googleAcctID
    JOIN Video v ON v.channelID = c.ID
    JOIN (
        SELECT
            v.videoID,
            COUNT(e.viewerID) AS ViewCount,
            SUM(e.watchDuration) AS ViewDuration
        FROM
            engage e
            JOIN video v ON e.videoID = v.videoID
        GROUP BY
            v.videoID
    ) s ON s.VideoID = v.videoID
GROUP BY
    g.googleAccountEmail,
    c.title
ORDER BY
    SumViewDuration DESC;

-- Advance Query 14: Analysis of Maximum View Duration for YouTube Channels per video
SELECT
    g.googleAccountEmail,
    c.title AS ChannelTitle,
    MAX(s.ViewDuration) AS MaxViewDuration
FROM
    GoogleAccount g
    JOIN ChannelCreator c ON g.ID = c.googleAcctID
    JOIN Video v ON v.channelID = c.ID
    JOIN (
        SELECT
            v.videoID,
            SUM(e.watchDuration) AS ViewDuration
        FROM
            engage e
            JOIN video v ON e.videoID = v.videoID
        GROUP BY
            v.videoID
    ) s ON s.VideoID = v.videoID
GROUP BY
    g.googleAccountEmail,
    c.title
ORDER BY
    MaxViewDuration DESC;

-- Advance Query 15: Analysis of Budget Allocation and Subscriber Counts for YouTube Channels
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
            JOIN Subscribe s ON c.ID = s.subscriberID
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

-- Advance Query 16: Viewers that like Travel
SELECT
    v.viewerID,
    ve.displayName AS viewerName,
    v.videoID,
    vi.title AS videoName,
    vt.video_tag
FROM
    Engage v
    JOIN Viewer ve ON v.viewerID = ve.ID
    JOIN Video vi ON v.videoID = vi.videoID
    JOIN Video_tag vt ON v.videoID = vt.videoID
WHERE
    v.isLiked = true
    AND vt.video_tag = 'Travel';

-- Advance Query 17: Channel sub to channels that are not eligible for YPP
SELECT
    s.subscriberID AS subscriberChannelID,
    cc.title AS subscriberChannelName,
    COUNT(DISTINCT s.channelID) AS numSubscribedChannels
FROM
    Subscribe s
    JOIN ChannelCreator cc ON s.subscriberID = cc.ID
    LEFT OUTER JOIN YPP y ON s.channelID = y.channelID
WHERE
    y.YPPID IS NULL
GROUP BY
    s.subscriberID,
    cc.title;

-- Advance Query 18: Video Engagement
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
    JOIN Engage e ON v.videoID = e.videoID
GROUP BY
    v.videoID,
    v.title
ORDER BY
    numUniqueViewers DESC;

-- Advance Query 19: Viewer Watch Insights
SELECT
    v.displayName,
    CASE
        WHEN (
            c.ID IS NULL
            AND g.ID IS NOT NULL
        ) THEN 'Channel''s Creator'
        WHEN (
            c.ID IS NOT NULL
            AND g.ID IS NULL
        ) THEN 'Google Account'
        ELSE 'Viewer'
    END AS viewerType,
    COUNT(DISTINCT e.videoID) AS totalVideo,
    AVG(e.watchDuration) AS avgWatchDuration,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(watchAt))), '%H:%i') AS averageWatchTime,
    GROUP_CONCAT(DISTINCT vt.video_tag SEPARATOR ', ') AS videoTopics
FROM
    Viewer AS v
    LEFT OUTER JOIN ChannelCreator AS c ON v.ID = c.ID
    LEFT OUTER JOIN GoogleAccount AS g ON v.ID = g.ID
    JOIN Engage AS e ON v.ID = e.viewerID
    JOIN (
        SELECT
            vt.videoID,
            vt.video_tag
        FROM
            Video_tag vt
    ) AS vt ON e.videoID = vt.videoID
GROUP BY
    v.ID
HAVING
    totalVideo > 1
ORDER BY
    totalVideo DESC;

-- Advance Query 20: List of Enabled Monetization Feature for YPP account with YPPID 'YPP3456789012'
SELECT
    featureName,
    description
FROM
    MonetizationFeature
WHERE
    featureName IN (
        SELECT
            mntFeature_featureName
        FROM
            Manage_MntFeature
        WHERE
            YPP_YPPID = 'YPP3456789012'
            AND isEnable = true
    );

-- Advance Query 21: In-Depth Analysis of Country-wise Monetization Statistics and Channels and Their Violations Summary
SELECT
    cc.country,
    COUNT(DISTINCT mv.videoID) AS MonetizedVideoCount,
    AVG(mv.monetizationStatus) AS AvgMonetizationStatus
FROM
    ChannelCreator cc
    LEFT JOIN Video v ON cc.ID = v.channelID
    LEFT JOIN MonetizedVideo mv ON v.videoID = mv.videoID
GROUP BY
    cc.country;

-- Advance Query 22: Analysis of average comments per video for actionable insights
SELECT
    cc.country,
    AVG(CommentsPerVideo) AS AvgCommentsPerVideo
FROM
    ChannelCreator cc
    LEFT JOIN Video v ON cc.ID = v.channelID
    LEFT JOIN (
        SELECT
            v.videoID,
            COUNT(DISTINCT c.commentID) AS CommentsPerVideo
        FROM
            Video v
            LEFT JOIN Comment c ON v.videoID = c.videoID
        GROUP BY
            v.videoID
    ) c_per_video ON v.videoID = c_per_video.videoID
GROUP BY
    cc.country;

-- Advance Query 23: Longest Videos and watched count
SELECT
    c.title AS `Channel Name`,
    v.title AS VideoTitle,
    v.duration,
    COUNT(e.videoID) AS `watch`
FROM
    Video v
    JOIN channelcreator c ON c.ID = v.channelID
    JOIN engage e ON e.videoID = v.videoID
GROUP BY
    `Channel Name`,
    VideoTitle,
    v.duration
ORDER BY
    v.duration DESC;

-- Advance Query 24: Tags Average Watch Time
SELECT
    vt.video_tag AS VideoTag,
    CONCAT(
        FLOOR(AVG(TIME_TO_SEC(e.watchDuration)) / 3600),
        'h ',
        FLOOR(
            MOD(AVG(TIME_TO_SEC(e.watchDuration)), 3600) / 60
        ),
        'm ',
        MOD(AVG(TIME_TO_SEC(e.watchDuration)), 60),
        's'
    ) AS AvgWatchTime
FROM
    Engage e
    JOIN Video v ON e.videoID = v.videoID
    JOIN Video_tag vt ON v.videoID = vt.videoID
GROUP BY
    vt.video_tag
ORDER BY
    AVG(TIME_TO_SEC(e.watchDuration)) DESC;

-- Advance Query 25: Overall Channel StatsView
SELECT
    cc.title AS ChannelName,
    COUNT(DISTINCT v.videoID) AS TotalVideos,
    COUNT(DISTINCT c.commentID) AS TotalComments,
    COUNT(DISTINCT mov.videoID) AS TotalMembersOnlyVideos
FROM
    ChannelCreator cc
    LEFT JOIN Video v ON cc.ID = v.channelID
    LEFT JOIN Comment c ON v.videoID = c.videoID
    LEFT JOIN MembersOnlyVideo mov ON v.videoID = mov.videoID
GROUP BY
    ChannelName;