-- CreateEnum
CREATE TYPE "TaskCategory" AS ENUM ('personal', 'work');

-- CreateEnum
CREATE TYPE "TaskStatus" AS ENUM ('pending', 'in_progress', 'complete');

-- CreateEnum
CREATE TYPE "TaskPriority" AS ENUM ('high', 'low');

-- CreateTable
CREATE TABLE "Task" (
    "id" SERIAL NOT NULL,
    "duration" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "category" "TaskCategory" NOT NULL,
    "actions" TEXT[],
    "task_group" TEXT NOT NULL,
    "status" "TaskStatus" NOT NULL,
    "assigned_date" TIMESTAMP(3),
    "user_id" INTEGER NOT NULL,
    "priority" "TaskPriority" NOT NULL DEFAULT 'low',

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TaskLog" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "notes" TEXT NOT NULL,
    "task_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "duration" INTEGER NOT NULL,
    "category" "TaskCategory" NOT NULL,
    "actions" TEXT[],
    "task_group" TEXT NOT NULL,
    "status" "TaskStatus" NOT NULL,
    "priority" "TaskPriority" NOT NULL,

    CONSTRAINT "TaskLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskLog" ADD CONSTRAINT "TaskLog_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskLog" ADD CONSTRAINT "TaskLog_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
