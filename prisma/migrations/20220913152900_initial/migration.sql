-- CreateTable
CREATE TABLE "Inteviewee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Interviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "intevieweeId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    CONSTRAINT "Interviews_intevieweeId_fkey" FOREIGN KEY ("intevieweeId") REFERENCES "Inteviewee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Interviews_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Company" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    CONSTRAINT "Employee_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
