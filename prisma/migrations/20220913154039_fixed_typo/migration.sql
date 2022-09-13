/*
  Warnings:

  - You are about to drop the `Inteviewee` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Inteviewee";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Interviewee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Interviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "intervieweeId" INTEGER NOT NULL DEFAULT 1,
    "employeeId" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    CONSTRAINT "Interviews_intervieweeId_fkey" FOREIGN KEY ("intervieweeId") REFERENCES "Interviewee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Interviews_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Interviews" ("date", "employeeId", "id", "intervieweeId") SELECT "date", "employeeId", "id", "intervieweeId" FROM "Interviews";
DROP TABLE "Interviews";
ALTER TABLE "new_Interviews" RENAME TO "Interviews";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
