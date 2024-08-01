import { Module } from '@nestjs/common';
import { TaskController } from './task.controller';
import { TaskService } from './task.service';

@Module({
  imports: [],
  exports: [TaskService],
  providers: [TaskController],
})
export class TaskModule {}
