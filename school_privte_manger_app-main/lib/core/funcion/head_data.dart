import '../class/state_raqust.dart';

StateRaqust headData(respones) {
  if (respones is StateRaqust) {
    return respones;
  } else {
    return StateRaqust.succes;
  }
}
