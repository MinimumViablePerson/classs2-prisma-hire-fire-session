/*
  Warnings:

  - You are about to drop the column `intevieweeId` on the `Interviews` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Interviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "intervieweeId" INTEGER NOT NULL DEFAULT 1,
    "employeeId" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    CONSTRAINT "Interviews_intervieweeId_fkey" FOREIGN KEY ("intervieweeId") REFERENCES "Inteviewee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Interviews_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Interviews" ("date", "employeeId", "id") SELECT "date", "employeeId", "id" FROM "Interviews";
DROP TABLE "Interviews";
ALTER TABLE "new_Interviews" RENAME TO "Interviews";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
