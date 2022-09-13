-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Employee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    CONSTRAINT "Employee_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Employee" ("companyId", "email", "id", "name", "role") SELECT "companyId", "email", "id", "name", "role" FROM "Employee";
DROP TABLE "Employee";
ALTER TABLE "new_Employee" RENAME TO "Employee";
CREATE UNIQUE INDEX "Employee_email_key" ON "Employee"("email");
CREATE TABLE "new_Interviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "intervieweeId" INTEGER NOT NULL DEFAULT 1,
    "interviewerId" INTEGER NOT NULL DEFAULT 1,
    "date" DATETIME NOT NULL,
    CONSTRAINT "Interviews_intervieweeId_fkey" FOREIGN KEY ("intervieweeId") REFERENCES "Interviewee" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Interviews_interviewerId_fkey" FOREIGN KEY ("interviewerId") REFERENCES "Employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Interviews" ("date", "id", "intervieweeId", "interviewerId") SELECT "date", "id", "intervieweeId", "interviewerId" FROM "Interviews";
DROP TABLE "Interviews";
ALTER TABLE "new_Interviews" RENAME TO "Interviews";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
