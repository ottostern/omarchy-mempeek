import QtQuick
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "ottostern.ram"

  // 1) Eine "Variable": hier merken wir uns den aktuellen Wert
  property string ram: "…"

  implicitWidth: knopf.implicitWidth
  implicitHeight: barSize

  // 2) Ein Terminal-Befehl, der die RAM-Auslastung ausrechnet
  Process {
    id: abfrage
    command: ["sh", "-c", "LC_ALL=C free -m | awk '/Mem/ {printf \"%d%%\", $3/$2*100}'"]
    stdout: StdioCollector {
      onStreamFinished: root.ram = text.trim()
    }
  }

  // 3) Ein Wecker, der alle 5 Sekunden den Befehl startet
  Timer {
    interval: 5000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: abfrage.running = true
  }

  // 4) Die Anzeige
  WidgetButton {
    id: knopf
    bar: root.bar
    text: "RAM " + root.ram
    tooltipText: "Belegter Arbeitsspeicher"
  }
}
