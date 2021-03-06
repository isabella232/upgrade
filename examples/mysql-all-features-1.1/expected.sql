ALTER TABLE `User` CHANGE `createdAt` `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `User` CHANGE `type` `type` ENUM('NORMAL', 'AWESOME') NOT NULL;
ALTER TABLE `User` CHANGE `isActive` `isActive` TINYINT(1) NOT NULL DEFAULT 0;
ALTER TABLE `User` CHANGE `meta` `meta` JSON ;
ALTER TABLE `Work` CHANGE `createdAt` `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `Home` CHANGE `createdAt` `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `Thought` CHANGE `createdAt` `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `Tagline` CHANGE `createdAt` `createdAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `User` ADD UNIQUE (`identificationDocument`);
ALTER TABLE `User` ADD UNIQUE (`taxDocument`);