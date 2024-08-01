import { Injectable } from '@nestjs/common';
import { Prisma, PrismaClient } from '@prisma/client';

@Injectable()
export class TaskService {
  constructor(private readonly prisma: PrismaClient) {}

  createTask(userId: number, payload: Prisma.TaskCreateInput) {
    return this.prisma.task.create({
      data: { ...payload, user: { connect: { id: userId } } },
    });
  }

  fetchTasks(userId: number) {
    return this.prisma.task.findMany({ where: { userId: userId } });
  }

  updateTask(userId: number, taskId: number, payload: Prisma.TaskUpdateInput) {
    return this.prisma.task.update({
      where: { id: taskId, userId },
      data: payload,
    });
  }

  deleteTask(userId: number, taskId: number) {
    return this.prisma.task.delete({ where: { id: taskId, userId } });
  }
}
