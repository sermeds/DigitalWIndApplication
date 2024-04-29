import 'package:digital_wind_application/utils/test_difficulty.dart';

const int REWARD_XP = 1;
const int REWARD_MONEY = 2;

const TEST_TIMER = 5; 

int calcReward(int count, Difficulty difficulty, int constant){
  return count * (difficulty.index + 1) * constant;
}

int calcRemaindReward(int reward, int perc, int? prevPerc) {
      if (prevPerc == null) {
        return reward * perc ~/ 100;
      }

      if (prevPerc >= perc) {
        return 0;
      }

      return reward * perc ~/ 100 - reward * prevPerc ~/ 100;
    }