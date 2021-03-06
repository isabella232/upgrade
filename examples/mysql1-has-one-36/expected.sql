ALTER TABLE `UserRoleCompanie` ADD COLUMN `companieId` char(30) CHARACTER SET utf8;
UPDATE `UserRoleCompanie`, `_UserRoleCompaniesRelation` SET `UserRoleCompanie`.`companieId` = `_UserRoleCompaniesRelation`.A where `_UserRoleCompaniesRelation`.B = `UserRoleCompanie`.`id`;
ALTER TABLE `UserRoleCompanie` CHANGE `companieId` `companieId` char(30) CHARACTER SET utf8 NOT NULL;
ALTER TABLE `UserRoleCompanie` ADD FOREIGN KEY (`companieId`) REFERENCES `Companie`(`id`);
DROP TABLE `_UserRoleCompaniesRelation`;
ALTER TABLE `IssuedCard` ADD COLUMN `userId` char(30) CHARACTER SET utf8;
UPDATE `IssuedCard`, `_UserIssuedCardRelation` SET `IssuedCard`.`userId` = `_UserIssuedCardRelation`.B where `_UserIssuedCardRelation`.A = `IssuedCard`.`id`;
ALTER TABLE `IssuedCard` CHANGE `userId` `userId` char(30) CHARACTER SET utf8 NOT NULL;
ALTER TABLE `IssuedCard` ADD FOREIGN KEY (`userId`) REFERENCES `User`(`id`);
DROP TABLE `_UserIssuedCardRelation`;