/*
    Copyright (C) 2014 Ales Katona.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2
import QtQuick.Window 2.2 as QtQuick
import org.nemomobile.lipstick 0.1
import org.nemomobile.configuration 1.0
import org.nemomobile.systemsettings 1.0
import org.nemomobile.devicelock 1.0
import org.nemomobile.dbus 2.0 as NemoDBus
import Sailfish.Silica 1.0
import Sailfish.Silica 1.0 as SS
import Sailfish.Ambience 1.0
import Sailfish.Silica.private 1.0
import Sailfish.Lipstick 1.0
import com.jolla.lipstick 0.1
import "pages"

ApplicationWindow
{
    id: applicationWindow

    initialPage: Component { Summary { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    onApplicationActiveChanged: monitor.setApplicationActive(applicationActive);
    PeekFilter
}
