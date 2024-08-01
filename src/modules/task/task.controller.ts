import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { TaskService } from './task.service';

const USER_ID = 1;
@Controller('task')
export class TaskController {
  constructor(private readonly taskService: TaskService) {}

  @Get()
  async fetchTasks() {
    return this.taskService.fetchTasks(USER_ID);
  }

  @Post()
  async postTask(@Body() body: Prisma.TaskCreateInput) {
    return this.taskService.createTask(USER_ID, body);
  }

  @Patch(':id')
  async patchTask(@Param('id') taskId, @Body() body: Prisma.TaskUpdateInput) {
    return this.taskService.updateTask(USER_ID, taskId, body);
  }

  @Delete(':id')
  async deleteTask(@Param('id') taskId) {
    return this.taskService.deleteTask(USER_ID, taskId);
  }
}
