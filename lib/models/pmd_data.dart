class PmdData {
  final int focusTime;
  final int breakTime;

  PmdData(this.focusTime, this.breakTime);

  @override
  int get hashCode => Object.hash(focusTime, breakTime);

  @override
  bool operator ==(covariant PmdData other) {
    return other.focusTime == focusTime && other.breakTime == breakTime;
  }
}
