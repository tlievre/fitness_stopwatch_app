class QuickTimer {
  int _minutes;
  int _seconds;

  QuickTimer(this._minutes, this._seconds);

  get minutes => _minutes;

  get seconds => _seconds;

  set minutes(min) {
    _minutes = min;
  }

  set seconds(sec) {
    _seconds = sec;
  }

  String returnFormattedText() {
    String formatedMinutes = _minutes.toString().padLeft(2, "0");
    String formatedSeconds = _seconds.toString().padLeft(2, "0");
    return "$formatedMinutes:$formatedSeconds";
  }
}
