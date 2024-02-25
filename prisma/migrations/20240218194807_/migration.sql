-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(150) NOT NULL,
    `password` VARCHAR(72) NOT NULL,
    `firstname` VARCHAR(191) NOT NULL,
    `lastname` VARCHAR(191) NOT NULL,
    `idcard` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `age` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `users_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Booking` (
    `booking_id` INTEGER NOT NULL AUTO_INCREMENT,
    `book_date` DATETIME(3) NOT NULL,
    `sex` VARCHAR(191) NULL,
    `userUser_id` INTEGER NULL,

    PRIMARY KEY (`booking_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Booking_ba` (
    `ba_id` INTEGER NOT NULL AUTO_INCREMENT,
    `doctor_id` INTEGER NOT NULL,
    `status` VARCHAR(191) NULL,
    `ordinal` VARCHAR(191) NULL,
    `bookingBooking_id` INTEGER NULL,

    PRIMARY KEY (`ba_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Duty` (
    `duty_id` INTEGER NOT NULL AUTO_INCREMENT,
    `duty_name` VARCHAR(191) NULL,
    `duty_password` VARCHAR(191) NULL,
    `userUser_id` INTEGER NULL,

    PRIMARY KEY (`duty_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Treatment_type` (
    `treatment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `treatment_name` VARCHAR(191) NULL,
    `bookingBooking_id` INTEGER NULL,

    PRIMARY KEY (`treatment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Province` (
    `pv_id` INTEGER NOT NULL AUTO_INCREMENT,
    `pv_name` VARCHAR(191) NOT NULL,
    `userUser_id` INTEGER NULL,

    PRIMARY KEY (`pv_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `District` (
    `dist_id` INTEGER NOT NULL AUTO_INCREMENT,
    `dist_name` VARCHAR(191) NOT NULL,
    `provincePv_id` INTEGER NULL,

    PRIMARY KEY (`dist_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sub_district` (
    `sdt_id` INTEGER NOT NULL AUTO_INCREMENT,
    `sdt_name` VARCHAR(191) NOT NULL,
    `provincePv_id` INTEGER NULL,
    `districtDist_id` INTEGER NULL,

    PRIMARY KEY (`sdt_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Booking` ADD CONSTRAINT `Booking_userUser_id_fkey` FOREIGN KEY (`userUser_id`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Booking_ba` ADD CONSTRAINT `Booking_ba_bookingBooking_id_fkey` FOREIGN KEY (`bookingBooking_id`) REFERENCES `Booking`(`booking_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Duty` ADD CONSTRAINT `Duty_userUser_id_fkey` FOREIGN KEY (`userUser_id`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Treatment_type` ADD CONSTRAINT `Treatment_type_bookingBooking_id_fkey` FOREIGN KEY (`bookingBooking_id`) REFERENCES `Booking`(`booking_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Province` ADD CONSTRAINT `Province_userUser_id_fkey` FOREIGN KEY (`userUser_id`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `District` ADD CONSTRAINT `District_provincePv_id_fkey` FOREIGN KEY (`provincePv_id`) REFERENCES `Province`(`pv_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sub_district` ADD CONSTRAINT `Sub_district_provincePv_id_fkey` FOREIGN KEY (`provincePv_id`) REFERENCES `Province`(`pv_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sub_district` ADD CONSTRAINT `Sub_district_districtDist_id_fkey` FOREIGN KEY (`districtDist_id`) REFERENCES `District`(`dist_id`) ON DELETE SET NULL ON UPDATE CASCADE;
