/*
  Warnings:

  - You are about to drop the column `employeeId` on the `Interviews` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Interviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "intervieweeId" INTEGER NOT NULL DEFAULT 1,
    "interviewerId" INTEGER NOT NULL DEFAULT 1,
    "date" DATETIME NOT NULL,
    CONSTRAINT "Interviews_intervieweeId_fkey" FOREIGN KEY ("intervieweeId") REFERENCES "Interviewee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Interviews_interviewerId_fkey" FOREIGN KEY ("interviewerId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Interviews" ("date", "id", "intervieweeId") SELECT "date", "id", "intervieweeId" FROM "Interviews";
DROP TABLE "Interviews";
ALTER TABLE "new_Interviews" RENAME TO "Interviews";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
