import { Module } from '@nestjs/common';
import { TaskLogController } from './task-log.controller';
import { TaskLogService } from './task-log.service';

@Module({
  imports: [],
  exports: [TaskLogService],
  providers: [TaskLogController],
})
export class TaskLogModule {}
