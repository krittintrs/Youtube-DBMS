INSERT INTO Viewer (ID, profilePhotoUrl, displayName, lastLogin, createdDate)
VALUES
    ('asdf484f2s23d87g', '/images/profile001.jpg', 'John Doe', '2023-11-30 08:15:45', '2023-01-01 12:30:00'),
    ('b2g76df3s9d2k1', '/images/profile002.jpg', 'Jane Smith', '2023-11-29 10:45:30', '2023-01-02 14:20:00'),
    ('c4o7e3y5j9o2h3n', '/images/profile003.jpg', 'Spike', '2023-11-28 15:30:20', '2023-01-03 16:45:00'),
    ('e1m3i9l2y4w5i0l', '/images/profile004.jpg', 'Emily Davis', '2023-11-27 12:20:10', '2023-01-04 09:10:00'),
    ('m8i7c6h9a5e4l0b', '/images/profile005.jpg', 'Chris123', '2023-11-26 14:40:55', '2023-01-05 18:25:00'),
    ('s5u3s6a9n2d0a2v', '/images/profile006.jpg', 'SpaceXYZ', '2023-11-25 09:35:30', '2023-01-06 11:50:00'),
    ('d4a2v1d6m9i1l', '/images/profile007.jpg', 'Alex Chen', '2023-11-24 11:20:45', '2023-01-07 22:15:00'),
    ('l1a0u9r7a6a5n2d', '/images/profile008.jpg', 'Laura Kim', '2023-11-23 17:55:30', '2023-01-08 08:40:00'),
    ('w9i0l8l3i2a4m5w', '/images/profile009.jpg', 'Daniel MW', '2023-11-22 13:10:25', '2023-01-09 14:30:00'),
    ('j1e0n7n6i8f9e1r', '/images/profile010.jpg', 'Mystique Nguyen', '2023-11-21 16:45:50', '2023-01-10 17:20:00'),
    ('v1a2d3e4r5i6d7', '/images/profile011.jpg', 'Alice Wonderland', '2023-11-20 08:30:45', '2023-02-01 12:45:00'),
    ('v9i0e1w2e3r4v5i6e', '/images/profile012.jpg', 'Bob Marley', '2023-11-19 11:15:30', '2023-02-02 14:30:00'),
    ('v3i4e5w6e9r2v3i4e', '/images/profile013.jpg', 'Eva Green', '2023-11-18 16:40:20', '2023-02-03 17:55:00'),
    ('v1m3i9l2y4d5a0v', '/images/profile014.jpg', 'David Bowie', '2023-11-17 13:25:10', '2023-02-04 10:10:00'),
    ('v8i7c6h9r5i4s0l', '/images/profile015.jpg', 'Lily Rose', '2023-11-16 15:45:55', '2023-02-05 18:25:00'),
    ('v5u3s6a9n2d0a2v', '/images/profile016.jpg', 'Samuel Jackson', '2023-11-15 10:40:30', '2023-02-06 11:50:00'),
    ('v4a2l1e9x6c9h8e', '/images/profile017.jpg', 'Alex Turner', '2023-11-14 12:20:45', '2023-02-07 22:15:00'),
    ('v1a0u9r7a6a5n2d', '/images/profile018.jpg', 'Laura Palmer', '2023-11-13 17:55:30', '2023-02-08 08:40:00'),
    ('v9i0l8l3i2a4m5w', '/images/profile019.jpg', 'Daniel Radcliffe', '2023-11-12 13:10:25', '2023-02-09 14:30:00'),
    ('v1e0n7n6i8f9e1r', '/images/profile020.jpg', 'Olivia Newton', '2023-11-11 16:45:50', '2023-02-10 17:20:00');


INSERT INTO GoogleAccount (ID, googleAccountEmail, phoneNumber, recoveryEmail, gender)
VALUES
    ('asdf484f2s23d87g', 'john.doe@gmail.com', '0771234567', 'john.alt.recovery@gmail.com', 'M'),
    ('b2g76df3s9d2k1', 'jane.smith@gmail.com', '0869876543', 'jane.secondary_recovery@yahoo.com', 'F'),
    ('c4o7e3y5j9o2h3n', 'robert.johnson@gmail.com', '0985789012', 'robert.backup.recovery@hotmail.com', 'M'),
    ('e1m3i9l2y4w5i0l', 'emily.wilson@gmail.com', '0755456789', 'emily.recovery1@gmail.com', 'F'),
    ('m8i7c6h9a5e4l0b', 'michael.brown@gmail.com', '0725234567', 'michael.backup_recovery@outlook.com', 'M'),
    ('s5u3s6a9n2d0a2v', 'susan.davis@gmail.com', '0715876354', 'susan.secondary_recovery@gmail.com', 'F'),
    ('d4a2v1d6m9i1l', 'david.miller@gmail.com', '0795321098', 'david.bakuprecovery@gmail.com', 'M'),
    ('l1a0u9r7a6a5n2d', 'laura.anderson@gmail.com', '0785765432', 'laura.personal_recovery@gmail.com', 'F'),
    ('w9i0l8l3i2a4m5w', 'william.white@gmail.com', '0865890124', 'william.secure_recover@protonmail.com', 'M'),
    ('j1e0n7n6i8f9e1r', 'jennifer.harris@gmail.com', '0705678902', 'jennifer.alternate_recovery@gmail.com', 'F');

-- GoogleAcct_billingInfo
INSERT INTO GoogleAcct_billingInfo (googleAcctID, googleAcct_cardType, googleAcct_cardNumber)
VALUES
    ('asdf484f2s23d87g', 'Visa', '4111111111111111'),
    ('asdf484f2s23d87g', 'Mastercard', '5555555555554444'),
    ('asdf484f2s23d87g', 'American Express', '378282246310005'),
    ('asdf484f2s23d87g', 'Visa Electron', '4917300800000000'),
    ('b2g76df3s9d2k1', 'Visa', '4112345678901234'),
    ('b2g76df3s9d2k1', 'Union Pay', '6200000000000005'),
    ('b2g76df3s9d2k1', 'Mastercard', '5105105105105100'),
    ('c4o7e3y5j9o2h3n', 'American Express', '378734493671000'),
    ('c4o7e3y5j9o2h3n', 'Visa', '4111111111111111'),
    ('c4o7e3y5j9o2h3n', 'Mastercard', '5555555555554444'),
    ('e1m3i9l2y4w5i0l', 'Union Pay', '6200000000000005'),
    ('e1m3i9l2y4w5i0l', 'American Express', '378282246310005'),
    ('m8i7c6h9a5e4l0b', 'Visa', '4112345678901234'),
    ('m8i7c6h9a5e4l0b', 'Union Pay', '6200000000000005'),
    ('s5u3s6a9n2d0a2v', 'Mastercard', '5555555555554444'),
    ('s5u3s6a9n2d0a2v', 'Visa Electron', '4917300800000000'),
    ('d4a2v1d6m9i1l', 'American Express', '378734493671000'),
    ('d4a2v1d6m9i1l', 'Visa', '4111111111111111'),
    ('w9i0l8l3i2a4m5w', 'Mastercard', '5555555555554444'),
    ('j1e0n7n6i8f9e1r', 'Visa', '4112345678901234');

INSERT INTO GoogleAcct_address (googleAcctID, googleAcct_addressNumber, googleAcct_road, googleAcct_district, googleAcct_province, googleAcct_country, googleAcct_postalCode)
VALUES
    ('asdf484f2s23d87g', '123', 'Sukhumvit Road', 'Sukhumvit', 'Bangkok', 'Thailand', '10230'),
    ('asdf484f2s23d87g', '456', 'Sathorn Road', 'Sathorn', 'Bangkok', 'Thailand', '10150'),
    ('asdf484f2s23d87g', '789', 'Phahon Yothin Road', 'Chatuchak', 'Bangkok', 'Thailand', '10310'),
    ('asdf484f2s23d87g', '101', 'Lat Phrao Road', 'Lat Phrao', 'Bangkok', 'Thailand', '10520'),
    ('b2g76df3s9d2k1', '303', 'Sukhumvit Road', 'Sukhumvit', 'Bangkok', 'Thailand', '10230'),
    ('b2g76df3s9d2k1', '404/2', 'Sathorn Road', 'Sathorn', 'Bangkok', 'Thailand', '10150'),
    ('b2g76df3s9d2k1', '203', 'Phahon Yothin Road', 'Chatuchak', 'Bangkok', 'Thailand', '10310'),
    ('c4o7e3y5j9o2h3n', '111/8', 'Moon Muang Road', 'Phra Singh', 'Chiang Mai', 'Thailand', '70000'),
    ('c4o7e3y5j9o2h3n', '222', 'Nimmanhaemin Road', 'Nimmanhaemin', 'Chiang Mai', 'Thailand', '50200'),
    ('d4a2v1d6m9i1l', '777', 'Dusit Zoo Road', 'Dusit', 'Bangkok', 'Thailand', '10100'),
    ('d4a2v1d6m9i1l', '888/12', 'Bang Khun Thian Road', 'Bang Khun Thian', 'Bangkok', 'Thailand', '10200'),
    ('l1a0u9r7a6a5n2d', '999', 'Maharaj Road', 'Mueang Krabi', 'Krabi', 'Thailand', '80000'),
    ('l1a0u9r7a6a5n2d', '1010/5', 'Ao Nang Road', 'Ao Nang', 'Krabi', 'Thailand', '81180'),
    ('s5u3s6a9n2d0a2v', '789', 'District 1 Road', 'District 1', 'Hochiminh City', 'Vietnam', '70000'),
    ('s5u3s6a9n2d0a2v', '101', 'Street 123', 'District 2', 'Hochiminh City', 'Vietnam', '80000'),
    ('w9i0l8l3i2a4m5w', '456', 'Gangnam Road', 'Gangnam', 'Seoul', 'South Korea', '10230'),
    ('w9i0l8l3i2a4m5w', '789', 'Myeongdong Street', 'Myeongdong', 'Seoul', 'South Korea', '10150');

INSERT INTO GoogleAdsAccount (googleAdsAcctID, googleAcctID)
VALUES
    ('a1b2c3d4e5f6g7h8', 'asdf484f2s23d87g'),
    ('i9j0k1l2m3n4o5p', 'asdf484f2s23d87g'),
    ('q6r7s8t9u0v1w2x', 'asdf484f2s23d87g'),
    ('y3z4a5b6c7d8e9f', 'b2g76df3s9d2k1'),
    ('g0h1i2j3k4l5m6n', 'b2g76df3s9d2k1'),
    ('o7p8q9r0s1t2u3v', 'c4o7e3y5j9o2h3n'),
    ('w4x5y6z7a8b9c0d', 'd4a2v1d6m9i1l'),
    ('e2f3g4h5i6j7k8l', 'l1a0u9r7a6a5n2d'),
    ('m9n0o1p2q3r4s5t', 'w9i0l8l3i2a4m5w'),
    ('u6v7w8x9y0z1a2b', 'j1e0n7n6i8f9e1r');

INSERT INTO GoogleAdsAcct_linkedAccount (googleAdsAcctID, googleAdsAcct_linkedAcctUrl)
VALUES
    ('a1b2c3d4e5f6g7h8', 'https://fashion-mania.com/dress1'),
    ('a1b2c3d4e5f6g7h8', 'https://travel-explorer.com/destination1'),
    ('a1b2c3d4e5f6g7h8', 'https://socialhub.com/user1'),
    ('a1b2c3d4e5f6g7h8', 'https://merch-paradise.com/product1'),
    ('i9j0k1l2m3n4o5p', 'https://merch-paradise.com/product2'),
    ('i9j0k1l2m3n4o5p', 'https://instagram.com/user2'),
    ('i9j0k1l2m3n4o5p', 'https://travel-explorer.com/destination2'),
    ('q6r7s8t9u0v1w2x', 'https://tiktok.com/@user3'),
    ('q6r7s8t9u0v1w2x', 'https://alibaba.com/shop3'),
    ('q6r7s8t9u0v1w2x', 'https://marketplace-world.com/shop3'),
    ('y3z4a5b6c7d8e9f', 'https://merch-paradise.com/product4'),
    ('y3z4a5b6c7d8e9f', 'https://instagram.com/user4'),
	('y3z4a5b6c7d8e9f', 'https://fashion-mania.com/dress4'),
    ('g0h1i2j3k4l5m6n', 'https://marketplace-world.com/shop5'),
    ('g0h1i2j3k4l5m6n', 'https://tiktok.com/@user5'),
    ('o7p8q9r0s1t2u3v', 'https://alibaba.com/shop6'),
    ('o7p8q9r0s1t2u3v', 'https://merch-paradise.com/product6'),
    ('w4x5y6z7a8b9c0d', 'https://instagram.com/user7'),
    ('w4x5y6z7a8b9c0d', 'https://marketplace-world.com/shop7'),
    ('e2f3g4h5i6j7k8l', 'https://tiktok.com/@user8'),
    ('m9n0o1p2q3r4s5t', 'https://merch-paradise.com/product9'),
    ('u6v7w8x9y0z1a2b', 'https://amazon.com/product10'),
    ('u6v7w8x9y0z1a2b', 'https://walmart.com/item10');

-- Inserting 10 new records into ChannelCreator with privacy variations
INSERT INTO ChannelCreator (
    ID,
    title,
    description,
    publishedAt,
    customUrl,
    thumbnailUrl,
    defaultLanguage,
    country,
    overallGoodStanding,
    communityGuidelines,
    copyrightStrikes,
    contentIdClaims,
    privacyStatus,
    topicDetails,
    googleAcctID
)
VALUES
    ('v1a2d3e4r5i6d7', 'Wonderland Adventures', 'Exploring the wonders of the world!', '2023-02-01 12:45:00', 'wonderland', '/images/channel001.jpg', 'English', 'US', true, true, false, false, 'private', 'Travel', 'asdf484f2s23d87g'),
    ('v9i0e1w2e3r4v5i6e', 'Reggae Vibes', 'Feel the rhythm and positive vibes of reggae music!', '2023-02-02 14:30:00', 'reggaevibes', '/images/channel002.jpg', 'English', 'Jamaica', true, true, false, false, 'public', 'Music', 'asdf484f2s23d87g'),
    ('v3i4e5w6e9r2v3i4e', 'Food Paradise', 'Exploring culinary delights and mouth-watering recipes.', '2023-02-03 17:55:00', 'foodparadise', '/images/channel003.jpg', 'English', 'UK', true, true, false, false, 'unlisted', 'Food', 'c4o7e3y5j9o2h3n'),
    ('v1m3i9l2y4d5a0v', 'Stardust Dreams', 'Immerse yourself in the world of dreams and stardust.', '2023-02-04 10:10:00', 'stardustdreams', '/images/channel004.jpg', 'English', 'US', true, true, false, false, 'private', 'Entertainment', 'e1m3i9l2y4w5i0l'),
    ('v8i7c6h9r5i4s0l', 'Artistic Expressions', 'A journey through various forms of artistic expressions.', '2023-02-05 18:25:00', 'artisticexpressions', '/images/channel005.jpg', 'English', 'US', true, true, false, false, 'private', 'Art', 'm8i7c6h9a5e4l0b'),
    ('v5u3s6a9n2d0a2v', 'Space Odyssey', 'Exploring the wonders of outer space and beyond!', '2023-02-06 11:50:00', 'spaceodyssey', '/images/channel006.jpg', 'English', 'US', true, true, false, false, 'public', 'Science', 's5u3s6a9n2d0a2v'),
    ('v4a2l1e9x6c9h8e', 'Arctic Explorations', 'Journeying through the icy landscapes of the Arctic.', '2023-02-07 22:15:00', 'arcticexplorations', '/images/channel007.jpg', 'English', 'Canada', true, true, false, false, 'public', 'History', 'd4a2v1d6m9i1l'),
    ('v1a0u9r7a6a5n2d', 'Mysterious Twin Peaks', 'Unraveling the mysteries of Twin Peaks.', '2023-02-08 08:40:00', 'twinpeaks', '/images/channel008.jpg', 'English', 'US', true, true, false, false, 'public', 'Mystery', 'l1a0u9r7a6a5n2d'),
    ('v9i0l8l3i2a4m5w', 'Wizarding World Wonders', 'Discovering the magical wonders of the wizarding world.', '2023-02-09 14:30:00', 'wizardingwonders', '/images/channel009.jpg', 'English', 'UK', true, true, false, false, 'private', 'Fantasy', 'w9i0l8l3i2a4m5w'),
    ('v1e0n7n6i8f9e1r', 'Melodies of Nature', 'Harmony of nature''s melodies and soothing sounds.', '2023-02-10 17:20:00', 'naturemelodies', '/images/channel010.jpg', 'English', 'US', true, true, false, false, 'private', 'Nature', 'j1e0n7n6i8f9e1r');

INSERT INTO Subscribe (channelID, subscriberID, subscriptionDate)
VALUES
    ('v1a2d3e4r5i6d7', 'v9i0e1w2e3r4v5i6e', '2023-03-05 08:30:00'),
    ('v1a2d3e4r5i6d7', 'v3i4e5w6e9r2v3i4e', '2023-03-18 10:20:00'),
    ('v1a2d3e4r5i6d7', 'v1m3i9l2y4d5a0v', '2023-03-30 12:30:00'),
    ('v1a2d3e4r5i6d7', 'v1a0u9r7a6a5n2d', '2023-04-11 14:20:00'),
    ('v1a2d3e4r5i6d7', 'v5u3s6a9n2d0a2v', '2023-04-23 16:10:00'),
    ('v1a2d3e4r5i6d7', 'v1e0n7n6i8f9e1r', '2023-05-05 18:40:00'),
    ('v1a2d3e4r5i6d7', 'v4a2l1e9x6c9h8e', '2023-05-17 20:30:00'),
    ('v1a2d3e4r5i6d7', 'v9i0l8l3i2a4m5w', '2023-06-04 23:45:00'),
    ('v9i0e1w2e3r4v5i6e', 'v1m3i9l2y4d5a0v', '2023-03-30 12:30:00'),
    ('v9i0e1w2e3r4v5i6e', 'v8i7c6h9r5i4s0l', '2023-03-30 12:30:00'),
    ('v9i0e1w2e3r4v5i6e', 'v5u3s6a9n2d0a2v', '2023-04-11 14:20:00'),
    ('v9i0e1w2e3r4v5i6e', 'v9i0l8l3i2a4m5w', '2023-04-23 16:10:00'),
    ('v9i0e1w2e3r4v5i6e', 'v1e0n7n6i8f9e1r', '2023-05-05 18:40:00'),
    ('v9i0e1w2e3r4v5i6e', 'v4a2l1e9x6c9h8e', '2023-05-11 19:55:00'),
    ('v3i4e5w6e9r2v3i4e', 'v1m3i9l2y4d5a0v', '2023-03-30 12:30:00'),
    ('v3i4e5w6e9r2v3i4e', 'v8i7c6h9r5i4s0l', '2023-03-30 12:30:00'),
    ('v3i4e5w6e9r2v3i4e', 'v5u3s6a9n2d0a2v', '2023-04-11 14:20:00'),
    ('v3i4e5w6e9r2v3i4e', 'v9i0l8l3i2a4m5w', '2023-05-17 20:30:00'),
    ('v3i4e5w6e9r2v3i4e', 'v1a0u9r7a6a5n2d', '2023-06-04 23:45:00'),
    ('v4a2l1e9x6c9h8e', 'v8i7c6h9r5i4s0l', '2023-03-30 12:30:00'),
    ('v4a2l1e9x6c9h8e', 'v5u3s6a9n2d0a2v', '2023-04-11 14:20:00'),
    ('v4a2l1e9x6c9h8e', 'v1e0n7n6i8f9e1r', '2023-05-05 18:40:00'),
    ('v4a2l1e9x6c9h8e', 'v1a0u9r7a6a5n2d', '2023-06-04 23:45:00'),
    ('v4a2l1e9x6c9h8e', 'v9i0l8l3i2a4m5w', '2023-06-20 14:10:00'),
    ('v1m3i9l2y4d5a0v', 'v1e0n7n6i8f9e1r', '2023-05-05 18:40:00'),
    ('v1m3i9l2y4d5a0v', 'v5u3s6a9n2d0a2v', '2023-05-11 19:55:00'),
    ('v1m3i9l2y4d5a0v', 'v9i0l8l3i2a4m5w', '2023-06-04 23:45:00'),
    ('v1e0n7n6i8f9e1r', 'v5u3s6a9n2d0a2v', '2023-05-11 19:55:00'),
    ('v1e0n7n6i8f9e1r', 'v9i0l8l3i2a4m5w', '2023-06-04 23:45:00'),
    ('v1e0n7n6i8f9e1r', 'v8i7c6h9r5i4s0l', '2023-06-20 14:10:00'),
    ('v1a0u9r7a6a5n2d', 'v9i0l8l3i2a4m5w', '2023-06-04 23:45:00'),
    ('v1a0u9r7a6a5n2d', 'v1e0n7n6i8f9e1r', '2023-06-20 14:10:00'),
    ('v1a0u9r7a6a5n2d', 'v8i7c6h9r5i4s0l', '2023-07-02 16:30:00'),
    ('v8i7c6h9r5i4s0l', 'v5u3s6a9n2d0a2v', '2023-06-20 14:10:00'),
    ('v8i7c6h9r5i4s0l', 'v9i0l8l3i2a4m5w', '2023-07-02 16:30:00'),
    ('v5u3s6a9n2d0a2v', 'v9i0l8l3i2a4m5w', '2023-07-02 16:30:00'),
    ('v5u3s6a9n2d0a2v', 'v1e0n7n6i8f9e1r', '2023-07-15 18:50:00'),
    ('v9i0l8l3i2a4m5w', 'v8i7c6h9r5i4s0l', '2023-07-15 18:50:00');

INSERT INTO Video (
    videoID,
    publishedAt,
    title,
    description,
    thumbnails,
    caption,
    duration,
    dimension,
    status,
    visibility,
    fileDetails,
    suggestions,
    localizations,
    channelID
) VALUES
('video125', '2023-11-10 08:30:00', 'Enchanted Forest Waterfalls', 'Explore hidden waterfalls in a magical forest adventure.', 'thumbnail123.jpg', 'Savor the flavor in no time!  #QuickRecipes #Foodie', '00:05:30', '1080p', true, true, 'File123.mp4', 'Suggestions123', 'English', '987654321'),

('video126', '2023-11-09 13:15:00', 'Epic Space Journey', 'Voyage through cosmic wonders beyond our solar system.', 'thumbnail456.jpg', 'Rise, shine, and stretch! #MorningYoga #WellnessWednesday', '00:03:45', '720p', true, true, 'File456.mp4', 'Suggestions456', 'Spanish', '987654322'),

('video127', '2023-11-08 16:55:00', 'Gourmet Desserts Delight', 'Indulge in the art of creating and savoring gourmet desserts.', 'thumbnail789.jpg', 'Upgrade your space on a budget! #DIYHomeDecor #HomeMakeover', '00:07:10', '1080p', true, false, 'File789.mp4', 'Suggestions789', 'French', '987654323'),

('video128', '2023-11-07 11:45:00', 'Urban Jungle: Street Art', 'Dive into vibrant street art transforming urban spaces.', 'thumbnailABC.jpg', 'Kickstart your mornings with a rejuvenating yoga routine. Boost energy, improve flexibility, and set a positive tone for the day ahead.', '00:02:30', '720p', true, true, 'FileABC.mp4', 'SuggestionsABC', 'German', '987654324'),

('video129', '2023-11-06 19:40:00', 'Yoga HIIT Fusion', 'Experience a unique fitness fusion of yoga and high-intensity training.', 'thumbnailXYZ.jpg', 'Snap, edit, share! #PhotographyTips #MobilePhotography', '00:04:20', '1080p', true, false, 'FileXYZ.mp4', 'SuggestionsXYZ', 'Italian', '987654325'),

('video130', '2023-11-05 09:30:00', 'Tech Unboxing Extravaganza', 'Unbox the latest gadgets and witness cutting-edge technology.', 'thumbnail678.jpg', 'Sweat it out in 10 minutes! #HomeWorkout #FitnessMotivation', '00:06:15', '720p', true, true, 'File678.mp4', 'Suggestions678', 'German', '987654321'),

('video131', '2023-11-04 14:15:00', 'Thrilling Ziplining Adventure', 'Soar across mountain peaks on an exhilarating ziplining ride.', 'thumbnail910.jpg', 'Geek out with the latest tech! #TechTalk #GadgetLover', '00:08:20', '1080p', true, true, 'File910.mp4', 'Suggestions910', 'French', '987654322'),

('video132', '2023-11-03 17:45:00', 'DIY Home Decor Magic', 'Transform spaces with creative and budget-friendly DIY home decor.', 'thumbnail1112.jpg', 'Find peace in nature’’s symphony. #Meditation #NatureSounds', '00:04:50', '720p', true, false, 'File1112.mp4', 'Suggestions1112', 'Italian', '987654323'),

('video133', '2023-11-02 11:30:00', 'Game Night Fun', 'Explore a variety of board games for a night of laughter and joy.', 'thumbnail1314.jpg', 'Bookworms, unite! #BookReview #ReadingList', '00:03:30', '1080p', true, true, 'File1314.mp4', 'Suggestions1314', 'Spanish', '987654324'),

('video134', '2023-11-01 17:25:00', 'Mind-Blowing Magic Illusions', 'Witness jaw-dropping magic tricks and mind-bending illusions.', 'thumbnail1516.jpg', 'Embrace tranquility within. #Mindfulness #MeditationMagic', '00:07:05', '720p', true, false, 'File1516.mp4', 'Suggestions1516', 'English', '987654325');


INSERT INTO YPP (channelID, YPPID, eligibilityStatus)
VALUES
    ('987654321', 'YPPID001', true),
    ('987654322', 'YPPID002', false),
    ('987654323', 'YPPID003', true),
    ('987654324', 'YPPID004', false),
    ('987654325', 'YPPID005', true),
    ('987654326', 'YPPID006', false),
    ('987654327', 'YPPID007', true),
    ('987654328', 'YPPID008', false),
    ('987654329', 'YPPID009', true),
    ('987654320', 'YPPID010', false);

INSERT INTO Members_only_Video (
    videoID,
    memberLevel,
    channelID,
    YPPID
) VALUES
('video125', 'Gold', '987654321', 'YPPID001'),
('video126', 'Silver', '987654322', 'YPPID002'),
('video127', 'Platinum', '987654323', 'YPPID003'),
('video128', 'Gold', '987654324', 'YPPID004'),
('video129', 'Silver', '987654325', 'YPPID005'),
('video130', 'Platinum', '987654326', 'YPPID006'),
('video131', 'Gold', '987654327', 'YPPID007'),
('video132', 'Silver', '987654328', 'YPPID008'),
('video133', 'Platinum', '987654329', 'YPPID009'),
('video134', 'Gold', '987654320', 'YPPID010');


INSERT INTO Monetized_Video (videoID, adsType, location, monetizationStatus, channelID, YPPID)
VALUES
('video125', 'Skippable', 'United Kingdom', true, '987654323', 'YPPID003'),
('video126', 'Non-skippable', 'Australia', false, '987654324', 'YPPID004'),
('video127', 'Display', 'Germany', true, '987654325', 'YPPID005'),
('video128', 'Bumper', 'France', false, '987654326', 'YPPID006'),
('video129', 'In-stream', 'Spain', true, '987654327', 'YPPID007'),
('video130', 'Discovery', 'Italy', false, '987654328', 'YPPID008'),
('video131', 'Sponsored card', 'Brazil', true, '987654329', 'YPPID009'),
('video132', 'TrueView', 'India', false, '987654320', 'YPPID010'),
('video133', 'Standard', 'United States', true, '987654321', 'YPPID001'),
('video134', 'Overlay', 'Canada', true, '987654322', 'YPPID002');

INSERT INTO Comments (
    commentID,
    updateTime,
    publishedTime,
    moderationStatus,
    likeCounts,
    viewerRating,
    rateStatus,
    textOriginal,
    textDisplay,
    authorChannelUrl,
    authorProfileImageUrl,
    authorDisplayName,
    channelID,
    videoID
) VALUES
('comment1', '12:30:00', '12:00:00', 'Approved', '15', '5 stars', true, 'This is a great video!', 'Great video!', 'http://channel1.com', 'http://profile1.jpg', 'User1', '987654321', 'video125'),

('comment2', '13:45:00', '13:30:00', 'Pending', '8', '4 stars', false, 'I have a question about the content.', 'Question about the content.', 'http://channel2.com', 'http://profile2.jpg', 'User2', '987654322', 'video126'),

('comment3', '14:20:00', '14:15:00', 'Approved', '20', '5 stars', true, 'Amazing video! I learned a lot.', 'Learned a lot!', 'http://channel3.com', 'http://profile3.jpg', 'User3', '987654323', 'video127'),

('comment4', '15:10:00', '15:05:00', 'Approved', '10', '3 stars', true, 'Nice content, keep it up!', 'Keep it up!', 'http://channel4.com', 'http://profile4.jpg', 'User4', '987654324', 'video128'),

('comment5', '16:00:00', '15:55:00', 'Approved', '18', '4 stars', true, 'I enjoyed watching this video.', 'Enjoyed the video!', 'http://channel5.com', 'http://profile5.jpg', 'User5', '987654325', 'video129'),

('comment6', '16:50:00', '16:45:00', 'Pending', '12', '4 stars', false, 'Looking forward to more videos!', 'Excited for more!', 'http://channel6.com', 'http://profile6.jpg', 'User6', '987654326', 'video130'),

('comment7', '17:40:00', '17:35:00', 'Approved', '25', '5 stars', true, 'This content is so informative.', 'Informative content!', 'http://channel7.com', 'http://profile7.jpg', 'User7', '987654327', 'video131'),

('comment8', '18:30:00', '18:25:00', 'Pending', '8', '3 stars', false, 'Can you make a video about cooking?', 'Request for cooking video.', 'http://channel8.com', 'http://profile8.jpg', 'User8', '987654328', 'video132'),

('comment9', '19:20:00', '19:15:00', 'Approved', '19', '4 stars', true, 'Great job on the video editing!', 'Impressed with the editing!', 'http://channel9.com', 'http://profile9.jpg', 'User9', '987654329', 'video133'),

('comment10', '20:10:00', '20:05:00', 'Approved', '14', '4 stars', true, 'I love the background music!', 'Great choice of music!', 'http://channel10.com', 'http://profile10.jpg', 'User10', '987654320', 'video134'),

('comment11', '21:00:00', '20:55:00', 'Pending', '10', '3 stars', false, 'Can you provide more details on the topic?', 'Request for more details.', 'http://channel11.com', 'http://profile11.jpg', 'User11', '987654321', 'video125'),

('comment12', '21:50:00', '21:45:00', 'Approved', '16', '4 stars', true, 'I appreciate the effort in making this video.', 'Appreciate the effort!', 'http://channel12.com', 'http://profile12.jpg', 'User12', '987654322', 'video126'),

('comment13', '22:40:00', '22:35:00', 'Approved', '22', '5 stars', true, 'This video deserves more views!', 'Deserves more views!', 'http://channel13.com', 'http://profile13.jpg', 'User13', '987654323', 'video127'),

('comment14', '23:30:00', '23:25:00', 'Pending', '13', '3 stars', false, 'Can you share the sources used in this video?', 'Request for sources.', 'http://channel14.com', 'http://profile14.jpg', 'User14', '987654324', 'video128'),

('comment15', '00:20:00', '00:15:00', 'Approved', '17', '4 stars', true, 'I found this video very helpful.', 'Very helpful video!', 'http://channel15.com', 'http://profile15.jpg', 'User15', '987654325', 'video129'),

('comment16', '01:10:00', '01:05:00', 'Approved', '14', '4 stars', true, 'The information provided is top-notch!', 'Top-notch information!', 'http://channel16.com', 'http://profile16.jpg', 'User16', '987654326', 'video130'),

('comment17', '02:00:00', '01:55:00', 'Pending', '9', '3 stars', false, 'Could you make a video on advanced topics?', 'Request for advanced topics video.', 'http://channel17.com', 'http://profile17.jpg', 'User17', '987654327', 'video131'),

('comment18', '02:50:00', '02:45:00', 'Approved', '21', '5 stars', true, 'I have learned so much from your videos!', 'Learned a lot from your videos!', 'http://channel18.com', 'http://profile18.jpg', 'User18', '987654328', 'video132'),

('comment19', '03:40:00', '03:35:00', 'Approved', '18', '4 stars', true, 'This video made my day!', 'Made my day!', 'http://channel19.com', 'http://profile19.jpg', 'User19', '987654329', 'video133'),

('comment20', '04:30:00', '04:25:00', 'Pending', '11', '3 stars', false, 'Could you provide more examples?', 'Request for more examples.', 'http://channel20.com', 'http://profile20.jpg', 'User20', '987654320', 'video134'),

('comment21', '05:20:00', '05:15:00', 'Approved', '15', '4 stars', true, 'I appreciate the clear explanations!', 'Clear explanations appreciated!', 'http://channel21.com', 'http://profile21.jpg', 'User21', '987654321', 'video125'),

('comment22', '06:10:00', '06:05:00', 'Approved', '23', '5 stars', true, 'The visuals in your videos are stunning!', 'Stunning visuals!', 'http://channel22.com', 'http://profile22.jpg', 'User22', '987654322', 'video126'),

('comment23', '07:00:00', '06:55:00', 'Pending', '16', '4 stars', false, 'Can you make a video on recent developments?', 'Request for recent developments video.', 'http://channel23.com', 'http://profile23.jpg', 'User23', '987654323', 'video127'),

('comment24', '07:50:00', '07:45:00', 'Approved', '19', '4 stars', true, 'Your videos always inspire me!', 'Always inspiring!', 'http://channel24.com', 'http://profile24.jpg', 'User24', '987654324', 'video128'),

('comment25', '08:40:00', '08:35:00', 'Approved', '20', '5 stars', true, 'I have recommended your channel to my friends!', 'Recommended to friends!', 'http://channel25.com', 'http://profile25.jpg', 'User25', '987654325', 'video129'),

('comment26', '09:30:00', '09:25:00', 'Pending', '12', '3 stars', false, 'Could you make a video on this specific topic?', 'Request for specific topic video.', 'http://channel26.com', 'http://profile26.jpg', 'User26', '987654326', 'video130'),

('comment27', '10:20:00', '10:15:00', 'Approved', '17', '4 stars', true, 'I have learned a lot from your tutorials!', 'Learned a lot from tutorials!', 'http://channel27.com', 'http://profile27.jpg', 'User27', '987654327', 'video131'),

('comment28', '11:10:00', '11:05:00', 'Approved', '22', '5 stars', true, 'Your content is always so engaging!', 'Engaging content!', 'http://channel28.com', 'http://profile28.jpg', 'User28', '987654328', 'video132'),

('comment29', '12:00:00', '11:55:00', 'Pending', '14', '4 stars', false, 'Can you provide more details on the techniques used?', 'Request for technique details.', 'http://channel29.com', 'http://profile29.jpg', 'User29', '987654329', 'video133'),

('comment30', '12:50:00', '12:45:00', 'Approved', '16', '4 stars', true, 'Your videos are a valuable resource!', 'Valuable resource!', 'http://channel30.com', 'http://profile30.jpg', 'User30', '987654320', 'video134');


INSERT INTO Engage (viewerID, videoID, usedDevice, watchDuration, isSaved, isDisliked, isLiked)
VALUES
    ('viewer001', 'video125', 'Desktop', '01:30:00', true, false, true),
    ('viewer001', 'video126', 'Mobile', '00:45:00', true, false, false),
    ('viewer001', 'video127', 'Tablet', '02:15:00', false, false, true),
    ('viewer001', 'video128', 'Desktop', '01:00:00', false, true, false),
    ('viewer001', 'video129', 'Mobile', '00:35:00', true, false, false),
    ('viewer001', 'video130', 'Tablet', '01:20:00', true, true, false),
    ('viewer001', 'video131', 'Desktop', '02:30:00', true, false, true),
    ('viewer001', 'video132', 'Mobile', '00:55:00', false, true, false),
    ('viewer001', 'video133', 'Tablet', '01:10:00', false, false, true),
    ('viewer001', 'video134', 'Desktop', '01:45:00', true, false, true),
    ('viewer002', 'video125', 'Desktop', '01:15:00', true, false, true),
    ('viewer002', 'video126', 'Mobile', '00:40:00', true, false, false),
    ('viewer002', 'video127', 'Tablet', '02:00:00', false, false, true),
    ('viewer002', 'video128', 'Desktop', '01:10:00', false, true, false),
    ('viewer002', 'video129', 'Mobile', '00:30:00', true, false, false),
    ('viewer002', 'video130', 'Tablet', '01:40:00', true, true, false),
    ('viewer002', 'video131', 'Desktop', '02:15:00', true, false, true),
    ('viewer002', 'video132', 'Mobile', '00:50:00', false, true, false),
    ('viewer002', 'video133', 'Tablet', '01:05:00', false, false, true),
    ('viewer002', 'video134', 'Desktop', '01:30:00', true, false, true),
    ('viewer003', 'video125', 'Desktop', '01:00:00', true, true, false),
    ('viewer003', 'video126', 'Mobile', '00:55:00', false, true, true),
    ('viewer003', 'video127', 'Tablet', '01:20:00', false, false, true),
    ('viewer003', 'video128', 'Desktop', '02:30:00', true, false, false),
    ('viewer003', 'video129', 'Mobile', '00:35:00', true, false, true),
    ('viewer003', 'video130', 'Tablet', '01:15:00', false, true, false),
    ('viewer003', 'video131', 'Desktop', '01:45:00', true, false, false),
    ('viewer003', 'video132', 'Mobile', '00:40:00', false, true, false),
    ('viewer003', 'video133', 'Tablet', '01:10:00', false, false, true),
    ('viewer003', 'video134', 'Desktop', '02:00:00', true, true, false);

INSERT INTO Video_Tags (videoID, videoTags)
VALUES
    ('video125', 'Horror'),
    ('video126', 'Game'),
    ('video127', 'Sport'),
    ('video128', 'TaylorSwift'),
    ('video129', 'Swimming'),
    ('video130', 'Study'),
    ('video131', 'Law'),
    ('video132', 'Database'),
    ('video133', 'AI'),
    ('video134', 'SIIT');
INSERT INTO Monetization_Feature (featureName, description)
VALUES
    ('AdRevenue', 'Earn revenue from Watch Page ads and Shorts Feed ads.'),
    ('Shopping', 'Your fans can browse and buy products from your store, or products you tag from other brands through the YouTube Shopping affiliate program.'),
    ('YouTubePremium', 'Get part of a YouTube Premium subscriber’s subscription fee when they watch your content.'),
    ('ChannelMemberships', 'Your members make recurring monthly payments in exchange for access to special perks.'),
    ('SuperChatSuperStickers', 'Your fans pay to get their messages or animated images highlighted in live chat streams.'),
    ('SuperThanks', 'Your fans pay to view a fun animation and get their message highlighted in your video or Short’s comments section.'),
    ('AdRevenueShorts', 'Earn revenue from Shorts Feed ads.'),
    ('ShoppingAffiliate', 'Earn commission when viewers purchase third-party products featured in your content through the YouTube Shopping affiliate program.'),
    ('PremiumContentAccess', 'Charge viewers for access to premium content.'),
    ('PremiumMusic', 'Monetize your music content through premium features.');

INSERT INTO MF_requirement (featureName, MFrequirement)
VALUES
    ('AdRevenue', '1,000 subscribers'),
    ('AdRevenue', '4,000 public watch hours on long-form videos in the last 365 days'),
    ('AdRevenue', 'be at least 18 years old'),
    ('AdRevenue', 'live in a country/region where YPP is available'),
    ('AdRevenue', 'accept the relevant contract modules'),
    ('AdRevenue', 'create content that meets our advertiser-friendly content guidelines'),
    ('Shopping', 'Meet subscriber threshold or be an Official Artist Channel'),
    ('Shopping', 'channel isn’t set as Made for Kids'),
    ('Shopping', 'doesn’t have a significant number of videos set as made for kids'),
    ('Shopping', 'channel doesn’t have a significant number of videos that violate our Channel Monetization Policies'),
    ('Shopping', 'your channel hasn’t received any Hate Speech Community Guideline Strikes'),
    ('YouTubePremium', 'Accept the relevant contract modules'),
    ('YouTubePremium', 'Create content watched by a viewer who is a YouTube Premium subscriber'),
    ('ChannelMemberships', '500 subscribers'),
    ('ChannelMemberships', '3 public uploads in the last 90 days'),
    ('ChannelMemberships', 'either: 3,000 public watch hours on long-form videos in the last 365 days or 3 million public Shorts views in the last 90 days'),
    ('ChannelMemberships', 'be at least 18 years old'),
    ('ChannelMemberships', 'live in a country where channel memberships are available'),
    ('ChannelMemberships', 'have accepted the Commerce Product Module or formerly available Commerce Product Addendum'),
    ('ChannelMemberships', 'channel isn’t set as Made for Kids and doesn’t have a significant number of videos set as made for kids or ineligible'),
    ('ChannelMemberships', 'not a music channel under SRAV'),
    ('SuperChatSuperStickers', 'Be at least 18 years old'),
    ('SuperChatSuperStickers', 'Live in a country/region where Super Chat and Super Stickers are available'),
    ('SuperChatSuperStickers', 'Have accepted the Commerce Product Module or formerly available Commerce Product Addendum'),  
    ('SuperThanks', 'Be at least 18 years old'),
    ('SuperThanks', 'Live in a country/region where Super Thanks is available'),
    ('SuperThanks', 'Have accepted the Commerce Product Module or formerly available Commerce Product Addendum'),
    ('SuperThanks', 'Channel is not a music channel under SRAV'),
    ('AdRevenueShorts', 'Earn revenue from Shorts Feed ads'),
    ('ShoppingAffiliate', 'Meet subscriber threshold or be an Official Artist Channel'),
    ('ShoppingAffiliate', 'Channel isn’t set as Made for Kids and doesn’t have a significant number of videos set as made for kids'),
    ('ShoppingAffiliate', 'Channel doesn’t have a significant number of videos that violate our Channel Monetization Policies'),
    ('ShoppingAffiliate', 'Your channel hasn’t received any Hate Speech Community Guideline Strikes'),
    ('PremiumContentAccess', 'Accept the relevant contract modules'),
    ('PremiumContentAccess', 'Create content that meets our advertiser-friendly content guidelines'),
    ('PremiumMusic', 'Monetize your music content through premium features');
  
INSERT INTO Manage_MF (channelID, YPPID, MFFeatureName, isEnable)
VALUES
    ('987654321', 'YPPID001', 'SuperThanks', 1),
    ('987654321', 'YPPID001', 'Shopping', 0),
    ('987654321', 'YPPID001', 'YouTubePremium', 1),
    ('987654322', 'YPPID002', 'AdRevenue', 0),
    ('987654322', 'YPPID002', 'SuperChatSuperStickers', 1),
    ('987654322', 'YPPID002', 'AdRevenueShorts', 0),
    ('987654323', 'YPPID003', 'ShoppingAffiliate', 1),
    ('987654323', 'YPPID003', 'ChannelMemberships', 0),
    ('987654323', 'YPPID003', 'PremiumContentAccess', 1),
    ('987654324', 'YPPID004', 'PremiumMusic', 0),
    ('987654324', 'YPPID004', 'SuperThanks', 1),
    ('987654324', 'YPPID004', 'Shopping', 0),
    ('987654325', 'YPPID005', 'SuperChatSuperStickers', 1),
    ('987654325', 'YPPID005', 'AdRevenueShorts', 0),
    ('987654325', 'YPPID005', 'ShoppingAffiliate', 1),
    ('987654326', 'YPPID006', 'YouTubePremium', 0),
    ('987654326', 'YPPID006', 'AdRevenue', 1),
    ('987654326', 'YPPID006', 'SuperThanks', 0),
    ('987654327', 'YPPID007', 'AdRevenueShorts', 1),
    ('987654327', 'YPPID007', 'PremiumContentAccess', 0),
    ('987654327', 'YPPID007', 'Shopping', 1),
    ('987654328', 'YPPID008', 'PremiumMusic', 0),
    ('987654328', 'YPPID008', 'SuperChatSuperStickers', 1),
    ('987654328', 'YPPID008', 'AdRevenueShorts', 0),
    ('987654329', 'YPPID009', 'ShoppingAffiliate', 1),
    ('987654329', 'YPPID009', 'YouTubePremium', 0),
    ('987654329', 'YPPID009', 'AdRevenue', 1),
    ('987654320', 'YPPID010', 'ChannelMemberships', 0),
    ('987654320', 'YPPID010', 'PremiumContentAccess', 1),
    ('987654320', 'YPPID010', 'SuperChatSuperStickers', 0);

INSERT INTO Revenue_Receiving_Method (methodName, isThirdParty)
VALUES
    ('AdSense', false),
    ('MCN_Payments', true),
    ('Shopping_Payments', true),
    ('AdMob', false),
    ('Sponsorships', true),
    ('Direct_Sales', true),
    ('Affiliate_Marketing', true),
    ('Crypto_Payments', true),
    ('Donations', true),
    ('Product_Placements', true);
    
INSERT INTO RRM_paymentOption (methodName, RRMpaymentOption)
VALUES
    ('AdSense', 'Cheque'),
    ('AdSense', 'Bank Transfer'),
    ('AdSense', 'SEPA'),
    ('MCN_Payments', 'Bank Transfer'),
    ('MCN_Payments', 'PayPal'),
    ('Shopping_Payments', 'Cheque'),
    ('Shopping_Payments', 'Bank Transfer'),
    ('Shopping_Payments', 'SEPA'),
    ('AdMob', 'Wire Transfer'),
    ('Sponsorships', 'PayPal'),
    ('Sponsorships', 'Direct Bank Transfer'),
    ('Direct_Sales', 'Bank Transfer'),
    ('Direct_Sales', 'Credit Card Payment'),
    ('Affiliate_Marketing', 'Direct Bank Deposit'),
    ('Affiliate_Marketing', 'PayPal'),
    ('Crypto_Payments', 'Cryptocurrency Wallet'),
    ('Crypto_Payments', 'Bitcoin Transfer'),
    ('Donations', 'Online Donation Platform'),
    ('Donations', 'Credit Card Donation'),
    ('Product_Placements', 'Direct Bank Transfer'),
    ('Product_Placements', 'Wire Transfer'),
    ('Product_Placements', 'Check Payment');

-- Insert data into Choose_RRM table with more realistic-looking fictional addresses
INSERT INTO Choose_RRM (channelID, YPPID, RRMMethodName, addressNumber, road, district, province, postalCode)
VALUES
    ('987654321', 'YPPID001', 'AdSense', '123', 'Main Street', 'Downtown', 'Metropolis', '12345'),
    ('987654322', 'YPPID002', 'MCN_Payments', '456', 'Broadway', 'Uptown', 'Cityville', '56789'),
    ('987654323', 'YPPID003', 'Shopping_Payments', '789', 'Market St', 'Midtown', 'Villagetown', '98765'),
    ('987654324', 'YPPID004', 'AdSense', '101', 'Oak Avenue', 'Suburbia', 'Townsville', '54321'),
    ('987654325', 'YPPID005', 'Sponsorships', '202', 'Pine Street', 'Greenfield', 'Meadowland', '67890'),
    ('987654326', 'YPPID006', 'Direct_Sales', '303', 'Cedar Road', 'Hillsborough', 'Hilltopia', '45678'),
    ('987654327', 'YPPID007', 'Affiliate_Marketing', '404', 'Elm Street', 'Riverside', 'Riverdale', '23456'),
    ('987654328', 'YPPID008', 'Crypto_Payments', '505', 'Maple Avenue', 'Lakeview', 'Lakeland', '78901'),
    ('987654329', 'YPPID009', 'Donations', '606', 'Walnut Street', 'Harborside', 'Harbor City', '01234'),
    ('987654320', 'YPPID010', 'Product_Placements', '707', 'Birch Road', 'Sunnyside', 'Sunnyville', '56789'),
    ('987654321', 'YPPID001', 'Shopping_Payments', '808', 'Cherry Street', 'Hometown', 'Homeville', '34567'),
    ('987654322', 'YPPID002', 'AdMob', '909', 'Peach Avenue', 'Heights', 'Heightstown', '89012'),
    ('987654323', 'YPPID003', 'Sponsorships', '111', 'Plum Road', 'Meadowside', 'Meadowsville', '23456'),
    ('987654324', 'YPPID004', 'Direct_Sales', '222', 'Orange Street', 'Valley', 'Valleyview', '78901'),
    ('987654325', 'YPPID005', 'Affiliate_Marketing', '333', 'Lemon Avenue', 'Countryside', 'Countrytown', '34567'),
    ('987654326', 'YPPID006', 'Crypto_Payments', '444', 'Banana Road', 'Forestville', 'Forest City', '89012'),
    ('987654327', 'YPPID007', 'Donations', '555', 'Grape Street', 'Seaside', 'Seaville', '23456'),
    ('987654328', 'YPPID008', 'Product_Placements', '666', 'Watermelon Avenue', 'Mountainside', 'Mountainview', '78901'),
    ('987654329', 'YPPID009', 'AdSense', '777', 'Kiwi Road', 'Rural', 'Ruraltown', '34567'),
    ('987654320', 'YPPID010', 'MCN_Payments', '888', 'Blueberry Street', 'Suburban', 'Suburbantown', '89012');

INSERT INTO `Video Ads` (videoAdsID, length, objective, videoFormatType, targetLocation, targetLanguage, budget, googleAdsID) VALUES
('video135', '00:20:25', 'Increase views and engagement on YouTube', 'Skippable video ads', 'All countries and territories', 'All Languages', 10000.00, 'ads_acc_1'),
('video136', '00:10:24', 'Get more calls', 'Skippable video ads', 'Thailand', 'Thai', 10000.00, 'ads_acc_1'),
('video137', '00:05:05', 'Get more customers to visit your location', 'Skippable video ads', 'Thailand', 'Thai', 50000.00, 'ads_acc_2'),
('video138', '00:00:12', 'Increase views and engagement on YouTube', 'Non-skippable video ads', 'Thailand', 'Thai', 10000.00, 'ads_acc_3'),
('video139', '00:14:25', 'Get more calls', 'Skippable video ads', 'Thailand', 'Thai', 10000.00, 'ads_acc_4'),
('video140', '00:08:20', 'Get more customers to visit your location', 'Skippable video ads', 'Thailand', 'Thai', 1000000.00, 'ads_acc_4'),
('video141', '00:00:05', 'Get more calls', 'Bumper ads', 'All countries and territories', 'All Languages', 90000.00, 'ads_acc_5'),
('video142', '00:02:58', 'Increase views and engagement on YouTube', 'Skippable video ads', 'All countries and territories', 'All Languages', 10000.00, 'ads_acc_6'),
('video143', '00:34:09', 'Increase views and engagement on YouTube', 'Skippable video ads', 'Thailand', 'Thai', 10000.00, 'ads_acc_6'),
('video144', '00:18:03', 'Increase sales or leads on your website', 'Skippable video ads', 'All countries and territories', 'All Languages', 10000000.00, 'ads_acc_6');


INSERT INTO `Appear_Ads` (videoID, videoAdsID, videoAdsViews) VALUES
('video126', 'video135', 10235),
('video128', 'video136', 11238),
('video128', 'video137', 5608),
('video129', 'video138', 9099),
('video132', 'video139', 22300),
('video125', 'video140', 345557),
('video130', 'video141', 12965),
('video133', 'video142', 77832),
('video127', 'video143', 29045),
('video134', 'video144', 992375);

INSERT INTO `VideoAds_topics` (videoAdsID, VIDEOADStopics,URLlinkofVideoAds) VALUES
('video135', 'Recruiting new students', 'www.siit.tu.ac.th'),
('video136', 'Big discount promotion', 'www.pizzahz.co.th'),
('video137', 'Fresh and clean every time', 'www.inwthai.com'),
('video138', 'love the person who loves u', 'www.rukchevit.com'),
('video139', 'Honestly fried chicken', 'www.kaitodhadyai.co.th'),
('video140', 'The greatest chicken', 'www.bigkai.com'),
('video141', 'YUM YUM!', 'www.thaitum.com'),
('video142', 'Discount 20%', 'www.yum2u.com'),
('video143', 'Used cars near you', 'www.thaicar.com'),
('video144', 'Roast beef every day', 'www.yarichi.com');

INSERT INTO `VideoAds_placements` (videoAdsID, VIDEOADSplacements) VALUES
('video135', '00:05:12'),
('video136', '00:12:02'),
('video137', '00:00:01'),
('video138', '00:00:02'),
('video139', '00:01:44'),
('video140', '00:09:23'),
('video141', '00:05:02'),
('video142', '00:03:06'),
('video143', '00:02:45'),
('video144', '00:10:00');

INSERT INTO `VideoAds_keywords` (videoAdsID, VIDEOADSkeywords, times) VALUES
('video135', 'education', 203351),
('video136', 'pizza', 10275),
('video137', 'toothpaste', 8274),
('video138', 'life insurance', 2935),
('video139', 'eating', 308533),
('video140', 'eating', 308534),
('video141', 'eating', 308535),
('video142', 'eating', 308536),
('video143', 'car', 10228),
('video144', 'shubu', 7782);


