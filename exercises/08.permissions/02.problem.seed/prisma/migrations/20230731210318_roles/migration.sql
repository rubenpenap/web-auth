-- CreateTable
CREATE TABLE "Permission" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "access" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "_PermissionToRole" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_PermissionToRole_A_fkey" FOREIGN KEY ("A") REFERENCES "Permission" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_PermissionToRole_B_fkey" FOREIGN KEY ("B") REFERENCES "Role" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_RoleToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_RoleToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Role" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_RoleToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Permission_action_entity_access_key" ON "Permission"("action", "entity", "access");

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_PermissionToRole_AB_unique" ON "_PermissionToRole"("A", "B");

-- CreateIndex
CREATE INDEX "_PermissionToRole_B_index" ON "_PermissionToRole"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_RoleToUser_AB_unique" ON "_RoleToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_RoleToUser_B_index" ON "_RoleToUser"("B");

-- Manual Migration - Roles & Permissions --
INSERT INTO Permission VALUES('cmavethnm00007q43iz1y7df6','create','user','own','',1747678775458,1747678775458);
INSERT INTO Permission VALUES('cmavethnp00017q43mnaxobgi','create','user','any','',1747678775462,1747678775462);
INSERT INTO Permission VALUES('cmavethnq00027q43u8rdibt4','read','user','own','',1747678775463,1747678775463);
INSERT INTO Permission VALUES('cmavethnr00037q43ysvbcw7y','read','user','any','',1747678775463,1747678775463);
INSERT INTO Permission VALUES('cmavethnr00047q435xnq0s5a','update','user','own','',1747678775464,1747678775464);
INSERT INTO Permission VALUES('cmavethns00057q43qb3bx85j','update','user','any','',1747678775465,1747678775465);
INSERT INTO Permission VALUES('cmavethnt00067q43fg5wj2xn','delete','user','own','',1747678775465,1747678775465);
INSERT INTO Permission VALUES('cmavethnu00077q43ds7xft2m','delete','user','any','',1747678775466,1747678775466);
INSERT INTO Permission VALUES('cmavethnv00087q43g7s4ugpt','create','note','own','',1747678775467,1747678775467);
INSERT INTO Permission VALUES('cmavethnw00097q43bubiw0us','create','note','any','',1747678775468,1747678775468);
INSERT INTO Permission VALUES('cmavethnw000a7q43co3w21n8','read','note','own','',1747678775469,1747678775469);
INSERT INTO Permission VALUES('cmavethnx000b7q43lk6eg3ox','read','note','any','',1747678775470,1747678775470);
INSERT INTO Permission VALUES('cmavethny000c7q43m7wbfg4s','update','note','own','',1747678775470,1747678775470);
INSERT INTO Permission VALUES('cmavethny000d7q43mmfnkwqo','update','note','any','',1747678775471,1747678775471);
INSERT INTO Permission VALUES('cmavethnz000e7q43h6w1mkdz','delete','note','own','',1747678775471,1747678775471);
INSERT INTO Permission VALUES('cmavethnz000f7q436775wa53','delete','note','any','',1747678775472,1747678775472);

INSERT INTO Role VALUES('cmavetho1000g7q432lc2viye','admin','',1747678775474,1747678775474);
INSERT INTO Role VALUES('cmavetho3000h7q43p439cd85','user','',1747678775475,1747678775475);

INSERT INTO _PermissionToRole VALUES('cmavethnp00017q43mnaxobgi','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethnr00037q43ysvbcw7y','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethns00057q43qb3bx85j','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethnu00077q43ds7xft2m','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethnw00097q43bubiw0us','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethnx000b7q43lk6eg3ox','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethny000d7q43mmfnkwqo','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethnz000f7q436775wa53','cmavetho1000g7q432lc2viye');
INSERT INTO _PermissionToRole VALUES('cmavethnm00007q43iz1y7df6','cmavetho3000h7q43p439cd85');
INSERT INTO _PermissionToRole VALUES('cmavethnq00027q43u8rdibt4','cmavetho3000h7q43p439cd85');
INSERT INTO _PermissionToRole VALUES('cmavethnr00047q435xnq0s5a','cmavetho3000h7q43p439cd85');
INSERT INTO _PermissionToRole VALUES('cmavethnt00067q43fg5wj2xn','cmavetho3000h7q43p439cd85');
INSERT INTO _PermissionToRole VALUES('cmavethnv00087q43g7s4ugpt','cmavetho3000h7q43p439cd85');
INSERT INTO _PermissionToRole VALUES('cmavethnw000a7q43co3w21n8','cmavetho3000h7q43p439cd85');
INSERT INTO _PermissionToRole VALUES('cmavethny000c7q43m7wbfg4s','cmavetho3000h7q43p439cd85');
INSERT INTO _PermissionToRole VALUES('cmavethnz000e7q43h6w1mkdz','cmavetho3000h7q43p439cd85');
