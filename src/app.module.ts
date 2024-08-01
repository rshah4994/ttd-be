import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TaskLogModule } from './modules/task-log/task-log.module';
import { TaskModule } from './modules/task/task.module';
import { UserModule } from './modules/user/user.module';

@Module({
  imports: [TaskModule, TaskLogModule, UserModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
