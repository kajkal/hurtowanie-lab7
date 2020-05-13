DROP TABLE IF EXISTS [hurtownie].[dbo].[lab7_fakt_OPERACJE]
DROP TABLE IF EXISTS [hurtownie].[dbo].[lab7_wymiar_STARTY]
DROP TABLE IF EXISTS [hurtownie].[dbo].[lab7_wymiar_LADOWANIA]
DROP TABLE IF EXISTS [hurtownie].[dbo].[lab7_wymiar_LOTNISKA]


CREATE TABLE [hurtownie].[dbo].[lab7_wymiar_LOTNISKA] (
    [airport_code_iata] varchar(50),
    [name] varchar(100),
    [city] varchar(50),
    [country] varchar(50),
    [code_icao] varchar(50),
    [lat] real,
    [lon] real,
    [alt] real,
    [offsetfromutc] real,
    [dst] varchar(1),
    [timezone] varchar(50),
    [type] varchar(50),
    [source] varchar(50),

    CONSTRAINT PK_IATA_code PRIMARY KEY CLUSTERED ([airport_code_iata])
)

CREATE TABLE [hurtownie].[dbo].[lab7_wymiar_STARTY] (
    [takeoff_id] bigint IDENTITY(1,1),
    [date] datetime,

    CONSTRAINT PK_takeoff_id PRIMARY KEY CLUSTERED ([takeoff_id])
)

CREATE TABLE [hurtownie].[dbo].[lab7_wymiar_LADOWANIA] (
    [landing_id] bigint IDENTITY(1,1),
    [date] datetime,

    CONSTRAINT PK_landing_id PRIMARY KEY CLUSTERED ([landing_id])
)

CREATE TABLE [hurtownie].[dbo].[lab7_fakt_OPERACJE] (
    [id] bigint,
    [takeoff_id] bigint,
    [landing_id] bigint,
    [takeoff] datetime,
    [landing] datetime,
    [src_iata_code] varchar(50),
    [dst_iata_code] varchar(50),
    [occup] smallint,
    [occup_pct] real,

    CONSTRAINT PK_operation_id PRIMARY KEY CLUSTERED ([id]),

    CONSTRAINT FK_takeoff_id FOREIGN KEY ([takeoff_id])
    REFERENCES [hurtownie].[dbo].[lab7_wymiar_STARTY] ([takeoff_id]),
    CONSTRAINT FK_landing_id FOREIGN KEY ([landing_id])
    REFERENCES [hurtownie].[dbo].[lab7_wymiar_LADOWANIA] ([landing_id]),

    CONSTRAINT FK_src_airport_IATA FOREIGN KEY ([src_iata_code])
    REFERENCES [hurtownie].[dbo].[lab7_wymiar_LOTNISKA] ([airport_code_iata]),
    CONSTRAINT FK_dst_airport_IATA FOREIGN KEY ([dst_iata_code])
    REFERENCES [hurtownie].[dbo].[lab7_wymiar_LOTNISKA] ([airport_code_iata])
)
