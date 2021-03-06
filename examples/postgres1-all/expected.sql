ALTER TABLE "postgres1-all$dev"."User" ALTER COLUMN "role" SET DEFAULT 'CUSTOMER';
ALTER TABLE "postgres1-all$dev"."Post" ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "postgres1-all$dev"."Post" ALTER COLUMN "published" SET DEFAULT false;
CREATE TYPE "postgres1-all$dev"."Role" AS ENUM ('ADMIN', 'CUSTOMER');
ALTER TABLE "postgres1-all$dev"."User" ALTER COLUMN "role" SET DATA TYPE "postgres1-all$dev"."Role" using "role"::"postgres1-all$dev"."Role";
ALTER TABLE "postgres1-all$dev"."User" ALTER COLUMN "jsonData" SET DATA TYPE JSONB USING "jsonData"::TEXT::JSONB;
ALTER TABLE "postgres1-all$dev"."Post" ADD COLUMN "authorId" CHARACTER VARYING(25);
UPDATE "postgres1-all$dev"."Post" SET "authorId" = "postgres1-all$dev"."_UserPost"."B" FROM "postgres1-all$dev"."_UserPost" WHERE "postgres1-all$dev"."_UserPost"."A" = "postgres1-all$dev"."Post"."id";
ALTER TABLE "postgres1-all$dev"."Post" ADD FOREIGN KEY ("authorId") REFERENCES "postgres1-all$dev"."User"("id");
DROP TABLE "postgres1-all$dev"."_UserPost";
ALTER TABLE "postgres1-all$dev"."User" ADD COLUMN "profileId" CHARACTER VARYING(25) unique;
UPDATE "postgres1-all$dev"."User" SET "profileId" = "postgres1-all$dev"."_UserProfile"."A" FROM "postgres1-all$dev"."_UserProfile" WHERE "postgres1-all$dev"."_UserProfile"."B" = "postgres1-all$dev"."User"."id";
ALTER TABLE "postgres1-all$dev"."User" ADD FOREIGN KEY ("profileId") REFERENCES "postgres1-all$dev"."Profile"("id");
DROP TABLE "postgres1-all$dev"."_UserProfile";